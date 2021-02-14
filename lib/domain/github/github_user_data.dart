import 'package:dportfolio_v2/domain/github/github_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'github_repo.dart';

part 'github_user_data.freezed.dart';

@freezed
abstract class GithubUserData with _$GithubUserData {
  const GithubUserData._();

  const factory GithubUserData({
    @required GithubUser user,
    @required List<GithubRepo> repos,
  }) = _GithubUserData;
}
