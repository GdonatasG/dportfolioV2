import 'package:dportfolio_v2/infrastructure/github/github_repo_dto.dart';
import 'package:dportfolio_v2/infrastructure/github/github_search_repos_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'should return expected [GithubSearchReposDTO] '
    'when json is correct',
    () {
      final json = {
        "total_count": 5,
        "items": [
          {
            "name": "testName1",
            "html_url": "testUrl1",
            "language": "testLanguage1"
          },
          {
            "name": "testName2",
            "html_url": "testUrl2",
            "language": "testLanguage2"
          }
        ],
      };

      const expected = GithubSearchReposDTO(
        total_count: 5,
        items: [
          GithubRepoDTO(
            name: "testName1",
            html_url: "testUrl1",
            language: "testLanguage1",
          ),
          GithubRepoDTO(
            name: "testName2",
            html_url: "testUrl2",
            language: "testLanguage2",
          ),
        ],
      );

      expect(GithubSearchReposDTO.fromJson(json), expected);
    },
  );

  test(
    'should return [GithubSearchReposDTO] with null variables '
    'when json is not correct',
    () {
      final json = {
        "total_count": "incorrect", // must be int
        "items": 2, // must be list
      };

      const expected = GithubSearchReposDTO(
        total_count: null,
        items: null,
      );

      expect(GithubSearchReposDTO.fromJson(json), expected);
    },
  );
}
