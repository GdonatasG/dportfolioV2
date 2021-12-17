part of 'github_bloc.dart';

@freezed
abstract class GithubState with _$GithubState {
  const factory GithubState.initial() = _Initial;

  const factory GithubState.loading() = _Loading;

  const factory GithubState.loadingMore() = _Filtering;

  const factory GithubState.refreshing() = _Refreshing;

  const factory GithubState.userWithReposLoaded(
    GithubUser githubUser,
    GithubSearchRepos githubSearchRepos, {
    GithubFailure? failure,
    required bool canLoadMore,
  }) = _UserWithReposLoaded;

  const factory GithubState.initialLoadingError(GithubFailure failure) =
      _InitialLoadingError;

  const factory GithubState.loadingMoreError(GithubFailure failure) =
      _LoadingMoreError;
}
