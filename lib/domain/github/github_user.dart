import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_user.freezed.dart';

@freezed
abstract class GithubUser implements _$GithubUser {
  const GithubUser._();

  const factory GithubUser({
    required String? login,
    required String? avatar_url,
    required String? html_url,
  }) = _GithubUser;
}
