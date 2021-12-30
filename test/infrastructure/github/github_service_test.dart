import 'dart:convert';

import 'package:dportfolio_v2/hidden.dart';
import 'package:dportfolio_v2/infrastructure/github/github_search_repos_dto.dart';
import 'package:dportfolio_v2/infrastructure/github/github_service.dart';
import 'package:dportfolio_v2/infrastructure/github/github_user_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  final githubUserJson = {
    "login": "testUser",
    "avatar_url": "testAvatarUrl",
    "html_url": "testHtmlUrl",
  };
  final githubSearchReposJson = {
    "total_count": 5,
    "items": [
      {
        "name": "testName1",
        "html_url": "testUrl1",
        "language": "testLanguage1"
      },
      {"name": "testName2", "html_url": "testUrl2", "language": "testLanguage2"}
    ],
  };
  final errorJson = {
    "error": "error",
  };

  group(
    'getGithubUserByName',
    () {
      test(
        'request url should match expected url',
        () async {
          final expectedUrl =
              Uri.parse("https://api.github.com/users/testUser");

          final mockClient = MockClient(
            (request) async {
              expect(request.url, expectedUrl);
              return http.Response(json.encode(githubUserJson), 200);
            },
          );

          final GithubService githubService =
              GithubService.createForTesting(mockClient);

          await githubService.getGithubUserByName(
            Hidden.GITHUB_TOKEN,
            'testUser',
          );
        },
      );

      test(
        'request headers should be '
        'Authorization with token',
        () async {
          final mockClient = MockClient(
            (request) async {
              expect(
                request.headers,
                {"Authorization": Hidden.GITHUB_TOKEN},
              );
              return http.Response(json.encode(githubUserJson), 200);
            },
          );

          final GithubService githubService =
              GithubService.createForTesting(mockClient);

          await githubService.getGithubUserByName(
            Hidden.GITHUB_TOKEN,
            'testUser',
          );
        },
      );

      test(
        'should get expected [GithubUserDTO] '
        'when response is successful',
        () async {
          final mockClient = MockClient(
            (request) async {
              return http.Response(json.encode(githubUserJson), 200);
            },
          );

          final GithubService githubService =
              GithubService.createForTesting(mockClient);

          final result = await githubService.getGithubUserByName(
            Hidden.GITHUB_TOKEN,
            'testUser',
          );

          expect(result.body, GithubUserDTO.fromJson(githubUserJson));
        },
      );

      test(
        'response body should be null '
        'when response is UNSUCCESSFUL',
        () async {
          final mockClient = MockClient(
            (request) async {
              return http.Response(json.encode(errorJson), 400);
            },
          );

          final GithubService githubService =
              GithubService.createForTesting(mockClient);

          final result = await githubService.getGithubUserByName(
            Hidden.GITHUB_TOKEN,
            'testUser',
          );

          expect(result.isSuccessful, false);
          expect(result.body, null);
        },
      );
    },
  );

  group(
    'searchUserRepos',
    () {
      test(
        'request url should match expected url',
        () async {
          final expectedUrl = Uri.parse(
            "https://api.github.com/search/repositories?q=testQuery+user:testUser+language:"
            "testLanguage&per_page=15&page=2",
          );

          final mockClient = MockClient(
            (request) async {
              expect(request.url, expectedUrl);
              return http.Response(json.encode(githubSearchReposJson), 200);
            },
          );

          final GithubService githubService =
              GithubService.createForTesting(mockClient);

          await githubService.searchUserRepos(
            token: Hidden.GITHUB_TOKEN,
            query: "testQuery",
            user: "testUser",
            language: "testLanguage",
            per_page: 15,
            page: 2,
          );
        },
      );

      test(
        'request headers should be '
        'Authorization with token',
        () async {
          final mockClient = MockClient(
            (request) async {
              expect(
                request.headers,
                {"Authorization": Hidden.GITHUB_TOKEN},
              );
              return http.Response(json.encode(githubSearchReposJson), 200);
            },
          );

          final GithubService githubService =
              GithubService.createForTesting(mockClient);

          await githubService.searchUserRepos(
            token: Hidden.GITHUB_TOKEN,
            query: "testQuery",
            user: "testUser",
            language: "testLanguage",
            per_page: 15,
            page: 2,
          );
        },
      );

      test(
        'should get expected [GithubSearchReposDTO] '
        'when response is successful',
        () async {
          final mockClient = MockClient(
            (request) async {
              return http.Response(json.encode(githubSearchReposJson), 200);
            },
          );

          final GithubService githubService =
              GithubService.createForTesting(mockClient);

          final result = await githubService.searchUserRepos(
            token: Hidden.GITHUB_TOKEN,
            query: "testQuery",
            user: "testUser",
            language: "testLanguage",
            per_page: 15,
            page: 2,
          );

          expect(
            result.body,
            GithubSearchReposDTO.fromJson(githubSearchReposJson),
          );
        },
      );

      test(
        'response body should be null '
        'when response is UNSUCCESSFUL',
        () async {
          final mockClient = MockClient(
            (request) async {
              return http.Response(json.encode(errorJson), 400);
            },
          );

          final GithubService githubService =
              GithubService.createForTesting(mockClient);

          final result = await githubService.searchUserRepos(
            token: Hidden.GITHUB_TOKEN,
            query: "testQuery",
            user: "testUser",
            language: "testLanguage",
            per_page: 15,
            page: 2,
          );

          expect(result.isSuccessful, false);
          expect(result.body, null);
        },
      );
    },
  );

  group(
    'searchReposGlobally',
    () {
      test(
        'request url should match expected url',
        () async {
          final expectedUrl = Uri.parse(
            "https://api.github.com/search/repositories?q=testQuery+language:"
            "testLanguage&per_page=15&page=2",
          );

          final mockClient = MockClient(
            (request) async {
              expect(request.url, expectedUrl);
              return http.Response(json.encode(githubSearchReposJson), 200);
            },
          );

          final GithubService githubService =
              GithubService.createForTesting(mockClient);

          await githubService.searchReposGlobally(
            token: Hidden.GITHUB_TOKEN,
            query: "testQuery",
            language: "testLanguage",
            per_page: 15,
            page: 2,
          );
        },
      );

      test(
        'request headers should be '
        'Authorization with token',
        () async {
          final mockClient = MockClient(
            (request) async {
              expect(
                request.headers,
                {"Authorization": Hidden.GITHUB_TOKEN},
              );
              return http.Response(json.encode(githubSearchReposJson), 200);
            },
          );

          final GithubService githubService =
              GithubService.createForTesting(mockClient);

          await githubService.searchReposGlobally(
            token: Hidden.GITHUB_TOKEN,
            query: "testQuery",
            language: "testLanguage",
            per_page: 15,
            page: 2,
          );
        },
      );

      test(
        'should get expected [GithubSearchReposDTO] '
        'when response is successful',
        () async {
          final mockClient = MockClient(
            (request) async {
              return http.Response(json.encode(githubSearchReposJson), 200);
            },
          );

          final GithubService githubService =
              GithubService.createForTesting(mockClient);

          final result = await githubService.searchReposGlobally(
            token: Hidden.GITHUB_TOKEN,
            query: "testQuery",
            language: "testLanguage",
            per_page: 15,
            page: 2,
          );

          expect(
            result.body,
            GithubSearchReposDTO.fromJson(githubSearchReposJson),
          );
        },
      );

      test(
        'response body should be null '
        'when response is UNSUCCESSFUL',
        () async {
          final mockClient = MockClient(
            (request) async {
              return http.Response(json.encode(errorJson), 400);
            },
          );

          final GithubService githubService =
              GithubService.createForTesting(mockClient);

          final result = await githubService.searchReposGlobally(
            token: Hidden.GITHUB_TOKEN,
            query: "testQuery",
            language: "testLanguage",
            per_page: 15,
            page: 2,
          );

          expect(result.isSuccessful, false);
          expect(result.body, null);
        },
      );
    },
  );
}
