import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dportfolio_v2/application/github_search_bloc/github_search_filter_options.dart';
import 'package:dportfolio_v2/domain/github/github_failure.dart';
import 'package:dportfolio_v2/domain/github/github_search_repos.dart';
import 'package:dportfolio_v2/domain/github/i_github_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'github_search_bloc.dart';

@injectable
class GithubSearchPagination {
  final IGithubRepository _iGithubRepository;

  int LOAD_PER_PAGE = 15;

  @visibleForTesting
  bool isGlobalSearch = false;

  void searchTypeChanged({required bool newValue}) {
    isGlobalSearch = newValue;
  }

  @visibleForTesting
  bool canLoadMore = true;
  @visibleForTesting
  int currentPage = 1;

  @visibleForTesting
  String query = "";

  void queryChanged({required String newValue}) {
    query = newValue;
  }

  @visibleForTesting
  GithubSearchRepos? currentSearchResults;

  @visibleForTesting
  final ValueNotifier<int> currentLanguageIndexNotifier = ValueNotifier(0);

  void currentLanguageIndexChanged({required int newValue}) {
    currentLanguageIndexNotifier.value = newValue;
  }

  ValueListenable<int> get languageIndexNotifier =>
      currentLanguageIndexNotifier;

  GithubSearchPagination(
    this._iGithubRepository,
  );

  Future<GithubSearchState> search({
    required String? username,
    bool loadingMore = false,
  }) async {
    if (query.isEmpty && getCurrentLanguageAsString().isEmpty && !loadingMore) {
      return const GithubSearchState.initial();
    } else {
      try {
        final suitableMethod = isGlobalSearch
            ? _iGithubRepository.searchReposGlobally(
                per_page: LOAD_PER_PAGE,
                page: loadingMore ? currentPage + 1 : currentPage,
                query: query,
                language: getCurrentLanguageAsString(),
              )
            : _iGithubRepository.searchUserRepos(
                name: username!,
                per_page: LOAD_PER_PAGE,
                page: loadingMore ? currentPage + 1 : currentPage,
                query: query,
                language: getCurrentLanguageAsString(),
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
          currentPage++;
        }

        finalizeResults(result);
        checkCanLoadMore(result);

        return result.fold(
          (f) => loadingMore
              ? GithubSearchState.loadingMoreError(f)
              : GithubSearchState.searchingError(f),
          (r) => GithubSearchState.searched(
            currentSearchResults ?? r,
            canLoadMore,
          ),
        );
      } catch (e) {
        log(e.toString());
        return loadingMore
            ? const GithubSearchState.loadingMoreError(
                GithubFailure.unexpected(),
              )
            : const GithubSearchState.searchingError(
                GithubFailure.unexpected(),
              );
      }
    }
  }

  @visibleForTesting
  void finalizeResults(
    Either<GithubFailure, GithubSearchRepos> result,
  ) {
    currentSearchResults = result.fold(
      (l) => currentSearchResults,
      (r) => currentSearchResults != null
          ? currentSearchResults?.copyWith(
              total_count: r.total_count,
              items: List.from(currentSearchResults?.items ?? [])
                ..addAll(r.items ?? []),
            )
          : r,
    );
  }

  @visibleForTesting
  void checkCanLoadMore(Either<GithubFailure, GithubSearchRepos> result) {
    if (result.isRight()) {
      canLoadMore = result.fold((_) {
        return canLoadMore;
      }, (r) {
        if (currentSearchResults?.items != null &&
            currentSearchResults?.total_count != null) {
          return currentSearchResults!.items!.length <
              currentSearchResults!.total_count!;
        }
        return false;
      });
    }
  }

  @visibleForTesting
  String getCurrentLanguageAsString() =>
      currentLanguageIndexNotifier.value > 0 &&
              currentLanguageIndexNotifier.value < defaultFilterOptions.length
          ? defaultFilterOptions[currentLanguageIndexNotifier.value]
          : '';

  void resetPagination() {
    currentSearchResults = null;
    currentPage = 1;
  }

  void close() {
    currentLanguageIndexNotifier.dispose();
  }
}
