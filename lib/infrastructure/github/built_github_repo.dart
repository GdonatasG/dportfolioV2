/*
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dportfolio_v2/domain/github/github_repo.dart';

part 'built_github_repo.g.dart';

abstract class BuiltGithubRepo
    implements Built<BuiltGithubRepo, BuiltGithubRepoBuilder> {
  @nullable
  String get name;

  @nullable
  String get html_url;

  @nullable
  String get language;

  BuiltGithubRepo._();

  GithubRepo toDomain() {
    return GithubRepo(
      name: name ?? "",
      html_url: html_url ?? "",
      language: language ?? "",
    );
  }

  factory BuiltGithubRepo([updates(BuiltGithubRepoBuilder b)]) =
      _$BuiltGithubRepo;

  static Serializer<BuiltGithubRepo> get serializer =>
      _$builtGithubRepoSerializer;
}
*/
