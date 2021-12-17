part of 'github_search_bloc.dart';

@freezed
abstract class GithubSearchState with _$GithubSearchState {
  const factory GithubSearchState.initial() = _Initial;

  const factory GithubSearchState.searching() = _Searching;

  const factory GithubSearchState.loadingMore() = _LoadingMore;

  const factory GithubSearchState.searched(
    GithubSearchRepos githubSearchRepos,
    bool canLoadMore,
  ) = _Searched;

  const factory GithubSearchState.searchingError(GithubFailure failure) =
      _SearchingError;

  const factory GithubSearchState.loadingMoreError(GithubFailure failure) =
      _LoadingMoreError;
}
