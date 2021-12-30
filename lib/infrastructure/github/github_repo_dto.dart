import 'dart:convert';

import 'package:dportfolio_v2/domain/github/github_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_repo_dto.freezed.dart';

part 'github_repo_dto.g.dart';

@freezed
abstract class GithubRepoDTO implements _$GithubRepoDTO {
  const GithubRepoDTO._();

  const factory GithubRepoDTO({
    required String? name,
    required String? html_url,
    required String? language,
  }) = _GithubRepoDTO;

  GithubRepo toDomain() => GithubRepo(
        name: name,
        html_url: html_url,
        language: language,
      );

  factory GithubRepoDTO.fromJson(dynamic j) => _customFromJson(j);

  static GithubRepoDTO _customFromJson(Map<String, dynamic> incoming) {
    final jsonPayload = Map<String, dynamic>.from(incoming);

    if (jsonPayload['name'] is! String) {
      jsonPayload['name'] = null;
    }

    if (jsonPayload['html_url'] is! String) {
      jsonPayload['html_url'] = null;
    }

    if (jsonPayload['language'] is! String) {
      jsonPayload['language'] = null;
    }

    return _$GithubRepoDTOFromJson(
      json.decode(json.encode(jsonPayload)) as Map<String, dynamic>,
    );
  }
}
