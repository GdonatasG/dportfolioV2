import 'dart:convert';

import 'package:dportfolio_v2/domain/github/github_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_user_dto.freezed.dart';

part 'github_user_dto.g.dart';

@freezed
abstract class GithubUserDTO implements _$GithubUserDTO {
  const GithubUserDTO._();

  const factory GithubUserDTO({
    required String? login,
    required String? avatar_url,
    required String? html_url,
  }) = _GithubUserDTO;

  GithubUser toDomain() => GithubUser(
        login: login,
        avatar_url: avatar_url,
        html_url: html_url,
      );

  factory GithubUserDTO.fromJson(Map<String, dynamic> json) =>
      _$GithubUserDTOFromJson(json);
}
