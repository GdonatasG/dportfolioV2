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
      _customFromJson(json);

  static GithubUserDTO _customFromJson(Map<String, dynamic> incoming) {
    final jsonPayload = Map<String, dynamic>.from(incoming);

    if (jsonPayload['login'] is! String) {
      jsonPayload['login'] = null;
    }

    if (jsonPayload['avatar_url'] is! String) {
      jsonPayload['avatar_url'] = null;
    }

    if (jsonPayload['html_url'] is! String) {
      jsonPayload['html_url'] = null;
    }

    return _$GithubUserDTOFromJson(
      json.decode(json.encode(jsonPayload)) as Map<String, dynamic>,
    );
  }
}
