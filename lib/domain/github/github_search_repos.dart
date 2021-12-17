import 'package:dportfolio_v2/domain/github/github_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_search_repos.freezed.dart';

@freezed
abstract class GithubSearchRepos implements _$GithubSearchRepos {
  const GithubSearchRepos._();

  const factory GithubSearchRepos({
    required int? total_count,
    required List<GithubRepo>? items,
  }) = _GithubSearchRepos;
}
