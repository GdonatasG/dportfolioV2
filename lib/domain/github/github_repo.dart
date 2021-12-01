import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_repo.freezed.dart';

@freezed
abstract class GithubRepo implements _$GithubRepo {
  const GithubRepo._();

  const factory GithubRepo({
    required String? name,
    required String? html_url,
    required String? language,
  }) = _GithubRepo;
}
