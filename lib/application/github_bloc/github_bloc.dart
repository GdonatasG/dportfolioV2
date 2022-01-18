import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:dportfolio_v2/domain/github/github_failure.dart';
import 'package:dportfolio_v2/domain/github/github_search_repos.dart';
import 'package:dportfolio_v2/domain/github/github_user.dart';
import 'package:dportfolio_v2/domain/github/i_github_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'github_event.dart';

part 'github_state.dart';

part 'github_bloc.freezed.dart';

@injectable
class GithubBloc extends Bloc<GithubEvent, GithubState> {
  final IGithubRepository _iGithubRepository;

  int LOAD_PER_PAGE = 15;

  @visibleForTesting
  bool canLoadMore = true;

  @visibleForTesting
  int currentPage = 1;

  @visibleForTesting
  GithubUser? currentLoadedUser;

  @visibleForTesting
  GithubSearchRepos? currentSearchResults;

  GithubBloc(this._iGithubRepository) : super(const GithubState.initial()) {
    on<GithubEvent>(
      (event, emit) async {
        await event.map(
          getUserAndRepos: (e) async => _getUserAndReposEvent(
            e: e,
            emit: emit,
          ),
          paginate: (e) async => _paginateEvent(
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
    required Emitter<GithubState> emit,
  }) async {
    emit(const GithubState.loadingMore());
    try {
      final result = await _iGithubRepository.searchUserRepos(
        name: currentLoadedUser!.login!,
        per_page: LOAD_PER_PAGE,
        page: currentPage + 1,
      );

      if (result.isRight()) {
        currentPage++;
        _finalizeResults(result);
        _checkCanLoadMore(result);
        emit(
          GithubState.userWithReposLoaded(
            currentLoadedUser!,
            currentSearchResults!,
            canLoadMore: canLoadMore,
          ),
        );
      } else {
        emit(
          GithubState.loadingMoreError(
            result.fold((l) => l, (r) => null) ??
                const GithubFailure.unexpected(),
          ),
        );
      }
    } catch (e) {
      emit(
        const GithubState.loadingMoreError(
          GithubFailure.unexpected(),
        ),
      );
    }
  }

  Future<void> _getUserAndReposEvent({
    required GetUserAndRepos e,
    required Emitter<GithubState> emit,
  }) async {
    // to show RefreshIndicator
    if (e.isRefresh) {
      emit(const GithubState.refreshing());
    }
    // to show ProgressIndicator for whole page when loading initially
    else {
      emit(const GithubState.loading());
    }

    try {
      final userResult =
          await _iGithubRepository.getUserByName(name: e.name).timeout(
                const Duration(
                  seconds: 30,
                ),
                onTimeout: () => left(const GithubFailure.userLoadingFailure()),
              );

      // couldn't get user and this is initially loading
      // will not try to search user repositories
      if (userResult.isLeft() && !e.isRefresh) {
        final failure = userResult.fold((l) => l, (_) => null);
        if (failure == null) {
          throw Error();
        } else {
          emit(
            GithubState.initialLoadingError(failure),
          );
        }
      } else {
        final searchResult = await _iGithubRepository
            .searchUserRepos(
              name: e.name,
              per_page: LOAD_PER_PAGE,
              page: 1,
            )
            .timeout(
              const Duration(
                seconds: 30,
              ),
              onTimeout: () => left(const GithubFailure.reposLoadingFailure()),
            );

        // extracting results
        currentLoadedUser = userResult.fold((l) => currentLoadedUser, (r) => r);
        /*currentSearchResults =
            searchResult.fold((l) => currentSearchResults, (r) => r);*/
        currentSearchResults = searchResult.fold(
          (l) => currentSearchResults,
          (r) => r,
        );

        _checkCanLoadMore(searchResult);

        // Checking failures
        GithubFailure? finalFailure;
        if (userResult.isLeft() && searchResult.isLeft()) {
          finalFailure = const GithubFailure.userAndReposLoadingFailure();
        } else {
          if (userResult.isLeft()) {
            finalFailure = const GithubFailure.userLoadingFailure();
          } else if (searchResult.isLeft()) {
            finalFailure = const GithubFailure.reposLoadingFailure();
          }
        }

        // Refresh loading
        if (e.isRefresh) {
          // Search was successful within refresh event
          // Resetting [currentPage] counter
          if (searchResult.isRight()) {
            _resetPagination();
          }

          // This is refresh event
          // which means that user and repositories were initially loaded before
          // so we could emit loaded state with included refresh failure
          emit(
            GithubState.userWithReposLoaded(
              currentLoadedUser!,
              currentSearchResults!,
              failure: finalFailure,
              canLoadMore: canLoadMore,
            ),
          );
        }
        // Initial loading
        else {
          // No failures
          if (finalFailure == null) {
            emit(
              GithubState.userWithReposLoaded(
                currentLoadedUser!,
                currentSearchResults!,
                canLoadMore: canLoadMore,
              ),
            );
          } else {
            emit(
              GithubState.initialLoadingError(
                finalFailure,
              ),
            );
          }
        }
      }
    } catch (e) {
      emit(const GithubState.initialLoadingError(GithubFailure.unexpected()));
    }
  }

  void _finalizeResults(
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

  void _checkCanLoadMore(Either<GithubFailure, GithubSearchRepos> result) {
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

  void _resetPagination() {
    currentPage = 1;
  }
}
