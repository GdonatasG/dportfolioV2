import 'dart:developer';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:dportfolio_v2/domain/github/github_failure.dart';
import 'package:dportfolio_v2/domain/github/github_search_repos.dart';
import 'package:dportfolio_v2/domain/github/i_github_repository.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/widgets/states/loaded/core/github_filter_locale_keys.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'github_search_event.dart';

part 'github_search_state.dart';

part 'github_search_bloc.freezed.dart';

@injectable
class GithubSearchBloc extends Bloc<GithubSearchEvent, GithubSearchState> {
  final IGithubRepository _iGithubRepository;
  final String? username;

  int LOAD_PER_PAGE = 15;

  // Search through all GitHub or specific (my) account
  bool _isGlobalSearch = false;

  bool _canLoadMore = true;
  int _currentPage = 1;
  String _query = "";
  GithubSearchRepos? _currentSearchResults;

  final List<String> _defaultFilterOptions = [
    GithubFilterLocaleKeys.FILTER_OPTION_ALL,
    "Java",
    "Kotlin",
    "Dart",
    "Python",
    "Javascript",
    "HTML",
  ];

  List<String> get getFilterOptions => List.unmodifiable(_defaultFilterOptions);

  final ValueNotifier<int> _currentLanguageIndexNotifier = ValueNotifier(0);

  ValueListenable<int> get languageIndexNotifier =>
      _currentLanguageIndexNotifier;

  GithubSearchBloc(
    this._iGithubRepository, {
    @factoryParam this.username,
  }) : super(const GithubSearchState.initial()) {
    on<GithubSearchEvent>(
      (event, emit) async {
        await event.map(
          searchTypeChanged: (e) async => _searchTypeChangedEvent(
            e: e,
            emit: emit,
          ),
          languageChanged: (e) async => _languageChangedEvent(
            e: e,
            emit: emit,
          ),
          queryChanged: (e) async => _queryChangedEvent(
            e: e,
            emit: emit,
          ),
          paginate: (e) async => _paginateEvent(
            e: e,
            emit: emit,
          ),
          retrySearch: (e) async => _retrySearchEvent(
            e: e,
            emit: emit,
          ),
        );
      },
      transformer: restartable(),
    );
  }

  Future<void> _paginateEvent({
    required Paginate e,
    required Emitter<GithubSearchState> emit,
  }) async {
    emit(
      const GithubSearchState.loadingMore(),
    );
    await _search(
      emit: emit,
      loadingMore: true,
    );
  }

  void _resetPagination() {
    _currentSearchResults = null;
    _currentPage = 1;
  }

  Future<void> _retrySearchEvent({
    required RetrySearch e,
    required Emitter<GithubSearchState> emit,
  }) async {
    emit(const GithubSearchState.searching());
    _resetPagination();
    await _search(emit: emit);
  }

  Future<void> _searchTypeChangedEvent({
    required SearchTypeChanged e,
    required Emitter<GithubSearchState> emit,
  }) async {
    emit(const GithubSearchState.searching());
    _resetPagination();
    _isGlobalSearch = e.isGlobal;
    await _search(emit: emit);
  }

  Future<void> _languageChangedEvent({
    required LanguageChanged e,
    required Emitter<GithubSearchState> emit,
  }) async {
    emit(const GithubSearchState.searching());
    _resetPagination();
    _currentLanguageIndexNotifier.value = e.index;
    await _search(emit: emit);
  }

  Future<void> _queryChangedEvent({
    required QueryChanged e,
    required Emitter<GithubSearchState> emit,
  }) async {
    emit(const GithubSearchState.searching());
    _resetPagination();
    _query = e.query;
    await _search(emit: emit);
  }

  Future<void> _search({
    required Emitter<GithubSearchState> emit,
    bool loadingMore = false,
  }) async {
    if (_query.isEmpty &&
        _getCurrentLanguageAsString().isEmpty &&
        !loadingMore) {
      emit(const GithubSearchState.initial());
    } else {
      try {
        final suitableMethod = _isGlobalSearch
            ? _iGithubRepository.searchReposGlobally(
                per_page: LOAD_PER_PAGE,
                page: loadingMore ? _currentPage + 1 : _currentPage,
                query: _query,
                language: _getCurrentLanguageAsString(),
              )
            : _iGithubRepository.searchUserRepos(
                name: username!,
                per_page: LOAD_PER_PAGE,
                page: loadingMore ? _currentPage + 1 : _currentPage,
                query: _query,
                language: _getCurrentLanguageAsString(),
              );

        final result = await suitableMethod.timeout(
          const Duration(
            seconds: 30,
          ),
          onTimeout: () => left(const GithubFailure.reposLoadingFailure()),
        );

        // Loading more is successful
        // Incrementing currentPage counter,
        // because page from repository was requested using [_currentPage + 1]
        if (result.isRight() && loadingMore) {
          _currentPage++;
        }

        _finalizeResults(result);
        _checkCanLoadMore(result);

        emit(
          result.fold(
            (f) => loadingMore
                ? GithubSearchState.loadingMoreError(f)
                : GithubSearchState.searchingError(f),
            (r) => GithubSearchState.searched(
              _currentSearchResults ?? r,
              _canLoadMore,
            ),
          ),
        );
      } catch (e) {
        log(e.toString());
        emit(
          loadingMore
              ? const GithubSearchState.loadingMoreError(
                  GithubFailure.unexpected(),
                )
              : const GithubSearchState.searchingError(
                  GithubFailure.unexpected(),
                ),
        );
      }
    }
  }

  void _finalizeResults(
    Either<GithubFailure, GithubSearchRepos> result,
  ) {
    _currentSearchResults = result.fold(
      (l) => _currentSearchResults,
      (r) => _currentSearchResults != null
          ? _currentSearchResults?.copyWith(
              total_count: r.total_count,
              items: List.from(_currentSearchResults?.items ?? [])
                ..addAll(r.items ?? []),
            )
          : r,
    );
  }

  void _checkCanLoadMore(Either<GithubFailure, GithubSearchRepos> result) {
    if (result.isRight()) {
      _canLoadMore = result.fold((_) {
        return _canLoadMore;
      }, (r) {
        if (_currentSearchResults?.items != null &&
            _currentSearchResults?.total_count != null) {
          return _currentSearchResults!.items!.length <
              _currentSearchResults!.total_count!;
        }
        return false;
      });
    }
  }

  String _getCurrentLanguageAsString() =>
      _currentLanguageIndexNotifier.value > 0 &&
              _currentLanguageIndexNotifier.value < _defaultFilterOptions.length
          ? _defaultFilterOptions[_currentLanguageIndexNotifier.value]
          : '';

  @override
  Future<void> close() {
    _currentLanguageIndexNotifier.dispose();
    return super.close();
  }
}
