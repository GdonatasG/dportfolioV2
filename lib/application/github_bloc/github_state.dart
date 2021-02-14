part of 'github_bloc.dart';

@freezed
abstract class GithubState with _$GithubState {
  const factory GithubState.initial() = _Initial;
  const factory GithubState.loading() = _Loading;
  const factory GithubState.userDataLoaded(GithubUserData githubUserData) =
      _UserDataLoaded;
  const factory GithubState.userDataLoadingError(GithubFailure githubFailure) =
      _UserDataLoadingError;
  const factory GithubState.listFiltered(List<GithubRepo> listOfFilteredRepos) =
      _ListFiltered;
  const factory GithubState.filterOptionsLoaded(
      Map<String, bool> filterOptions) = _FilterOptionsLoaded;
  const factory GithubState.refreshError(GithubFailure githubFailure) =
      _RefreshError;
  const factory GithubState.refreshing() = _Refreshing;
}
