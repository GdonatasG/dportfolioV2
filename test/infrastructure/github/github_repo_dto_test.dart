import 'package:dportfolio_v2/infrastructure/github/github_repo_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'should return expected [GithubRepoDTO] '
    'when json is correct',
    () {
      final json = {
        "name": "testName",
        "html_url": "testUrl",
        "language": "testLanguage"
      };

      const expected = GithubRepoDTO(
        name: "testName",
        html_url: "testUrl",
        language: "testLanguage",
      );

      expect(GithubRepoDTO.fromJson(json), expected);
    },
  );

  test(
    'should return [GithubRepoDTO] with null variables '
    'when json is not correct',
    () {
      final json = {
        "name": 5, // must be string
        "html_url": 5, // must be string
        "language": 5 // must be string
      };

      const expected = GithubRepoDTO(
        name: null,
        html_url: null,
        language: null,
      );

      expect(GithubRepoDTO.fromJson(json), expected);
    },
  );
}
