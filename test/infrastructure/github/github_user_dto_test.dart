import 'package:dportfolio_v2/infrastructure/github/github_user_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'should return expected [GithubUserDTO] '
    'when json is correct',
    () {
      final json = {
        "login": "testLogin",
        "avatar_url": "testAvatarUrl",
        "html_url": "testUrl"
      };

      const expected = GithubUserDTO(
        login: "testLogin",
        avatar_url: "testAvatarUrl",
        html_url: "testUrl",
      );

      expect(GithubUserDTO.fromJson(json), expected);
    },
  );

  test(
    'should return [GithubUserDTO] with null variables '
    'when json is not correct',
    () {
      final json = {
        "login": 5, // must be string
        "avatar_url": 5, // must be string
        "html_url": 5 // must be string
      };

      const expected = GithubUserDTO(
        login: null,
        avatar_url: null,
        html_url: null,
      );

      expect(GithubUserDTO.fromJson(json), expected);
    },
  );
}
