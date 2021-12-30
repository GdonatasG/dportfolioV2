import 'dart:convert';

import 'package:dportfolio_v2/domain/github/github_search_repos.dart';
import 'package:dportfolio_v2/infrastructure/github/github_repo_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_search_repos_dto.freezed.dart';

part 'github_search_repos_dto.g.dart';

@freezed
abstract class GithubSearchReposDTO implements _$GithubSearchReposDTO {
  const GithubSearchReposDTO._();

  const factory GithubSearchReposDTO({
    required int? total_count,
    required List<GithubRepoDTO>? items,
  }) = _GithubSearchReposDTO;

  GithubSearchRepos toDomain() => GithubSearchRepos(
        total_count: total_count,
        items: items?.map((repo) => repo.toDomain()).toList(),
      );

  factory GithubSearchReposDTO.fromJson(dynamic j) => _customFromJson(j);

  static GithubSearchReposDTO _customFromJson(Map<String, dynamic> incoming) {
    final jsonPayload = Map<String, dynamic>.from(incoming);

    if (jsonPayload['total_count'] is! int) {
      jsonPayload['total_count'] = null;
    }

    if (jsonPayload['items'] is! List) {
      jsonPayload['items'] = null;
    }

    return _$GithubSearchReposDTOFromJson(
      json.decode(json.encode(jsonPayload)) as Map<String, dynamic>,
    );
  }
}
