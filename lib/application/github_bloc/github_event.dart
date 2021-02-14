part of 'github_bloc.dart';

@freezed
abstract class GithubEvent with _$GithubEvent {
  const factory GithubEvent.getUserDataByName(
    String name,
    bool isRefresh,
  ) = GetUserDataByName;

  const factory GithubEvent.filterList(
    Map<String, bool> filterOptions,
  ) = FilterList;

  const factory GithubEvent.loadFilterOptions() = LoadFilterOptions;

  const factory GithubEvent.filterCheckRequest() = FilterCheckRequest;
}
