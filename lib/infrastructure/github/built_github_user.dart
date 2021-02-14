import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dportfolio_v2/domain/github/github_user.dart';

part 'built_github_user.g.dart';

abstract class BuiltGithubUser
    implements Built<BuiltGithubUser, BuiltGithubUserBuilder> {
  String get login;

  String get avatar_url;

  String get html_url;

  BuiltGithubUser._();

  GithubUser toDomain() {
    return GithubUser(
      login: login,
      avatar_url: avatar_url,
      html_url: html_url,
    );
  }

  factory BuiltGithubUser([updates(BuiltGithubUserBuilder b)]) =
      _$BuiltGithubUser;

  static Serializer<BuiltGithubUser> get serializer =>
      _$builtGithubUserSerializer;
}
