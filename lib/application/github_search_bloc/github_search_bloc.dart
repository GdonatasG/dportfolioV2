import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dportfolio_v2/application/github_search_bloc/github_search_filter_options.dart';
import 'package:dportfolio_v2/application/github_search_bloc/github_search_pagination.dart';
import 'package:dportfolio_v2/domain/github/github_failure.dart';
import 'package:dportfolio_v2/domain/github/github_search_repos.dart';
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
  final GithubSearchPagination _pagination;
  final String? username;

  List<String> get getFilterOptions => List.unmodifiable(defaultFilterOptions);

  ValueListenable<int> get languageIndexNotifier =>
      _pagination.languageIndexNotifier;

  GithubSearchBloc(
    this._pagination, {
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
    emit(
      await _pagination.search(
        username: username,
        loadingMore: true,
      ),
    );
  }

  Future<void> _retrySearchEvent({
    required RetrySearch e,
    required Emitter<GithubSearchState> emit,
  }) async {
    emit(const GithubSearchState.searching());
    _pagination.resetPagination();
    emit(
      await _pagination.search(
        username: username,
      ),
    );
  }

  Future<void> _searchTypeChangedEvent({
    required SearchTypeChanged e,
    required Emitter<GithubSearchState> emit,
  }) async {
    emit(const GithubSearchState.searching());
    _pagination.resetPagination();
    _pagination.searchTypeChanged(newValue: e.isGlobal);
    emit(
      await _pagination.search(
        username: username,
      ),
    );
  }

  Future<void> _languageChangedEvent({
    required LanguageChanged e,
    required Emitter<GithubSearchState> emit,
  }) async {
    emit(const GithubSearchState.searching());
    _pagination.resetPagination();
    _pagination.currentLanguageIndexChanged(newValue: e.index);
    emit(
      await _pagination.search(
        username: username,
      ),
    );
  }

  Future<void> _queryChangedEvent({
    required QueryChanged e,
    required Emitter<GithubSearchState> emit,
  }) async {
    emit(const GithubSearchState.searching());
    _pagination.resetPagination();
    _pagination.queryChanged(newValue: e.query);
    emit(
      await _pagination.search(
        username: username,
      ),
    );
  }

  @override
  Future<void> close() {
    _pagination.close();
    return super.close();
  }
}
