part of 'github_bloc.dart';

@freezed
abstract class GithubEvent with _$GithubEvent {
  const factory GithubEvent.getUserAndRepos({
    required String name,
    @Default(false) bool isRefresh,
  }) = GetUserAndRepos;

  const factory GithubEvent.paginate() = Paginate;
}
