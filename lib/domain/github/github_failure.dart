import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_failure.freezed.dart';

@freezed
abstract class GithubFailure with _$GithubFailure {
  const factory GithubFailure.userLoadingFailure() = _UserLoadingFailure;

  const factory GithubFailure.reposLoadingFailure() = _ReposLoadingFailure;

  const factory GithubFailure.userAndReposLoadingFailure() =
      _UserAndReposLoadingFailure;

  const factory GithubFailure.unexpected() = _Unexpected;
}
