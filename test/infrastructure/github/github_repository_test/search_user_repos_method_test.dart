import 'package:chopper/chopper.dart';
import 'package:dartz/dartz.dart';
import 'package:dportfolio_v2/domain/github/github_failure.dart';
import 'package:dportfolio_v2/domain/github/github_search_repos.dart';
import 'package:dportfolio_v2/hidden.dart';
import 'package:dportfolio_v2/infrastructure/github/github_repo_dto.dart';
import 'package:dportfolio_v2/infrastructure/github/github_repository.dart';
import 'package:dportfolio_v2/infrastructure/github/github_search_repos_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import '../../../utils/general_mocks/mock_github_service.dart';

void main() {
  final MockGithubService mockGithubService = MockGithubService();
  late GithubRepository githubRepository;

  setUp(
    () {
      githubRepository = GithubRepository(mockGithubService);
    },
  );

  tearDown(
    () {
      reset(mockGithubService);
    },
  );

  test(
    'should return [GithubSearchRepos] '
    'when [response.isSuccessful] '
    'and [response.body] != null',
    () async {
      const expectedDTO = GithubSearchReposDTO(
        total_count: 4,
        items: [
          GithubRepoDTO(
            name: 'repo1',
            html_url: 'html_url',
            language: 'language',
          ),
          GithubRepoDTO(
            name: 'repo2',
            html_url: 'html_url',
            language: 'language',
          ),
        ],
      );

      when(
        () => mockGithubService.searchUserRepos(
          token: Hidden.GITHUB_TOKEN,
          query: 'testQuery',
          user: 'testUser',
          language: 'testLanguage',
          per_page: 15,
        ),
      ).thenAnswer(
        (invocation) async => Future.value(
          Response<GithubSearchReposDTO>(
            http.Response("body", 200),
            expectedDTO,
          ),
        ),
      );

      final result = await githubRepository.searchUserRepos(
        query: 'testQuery',
        name: 'testUser',
        language: 'testLanguage',
        per_page: 15,
        page: 1,
      );

      final GithubSearchRepos? githubSearchRepos =
          result.fold((_) => null, (r) => r);

      expect(githubSearchRepos, expectedDTO.toDomain());
      verify(
        () => mockGithubService.searchUserRepos(
          token: Hidden.GITHUB_TOKEN,
          query: 'testQuery',
          user: 'testUser',
          language: 'testLanguage',
          per_page: 15,
        ),
      ).called(1);
      verifyNoMoreInteractions(mockGithubService);
    },
  );

  test(
    'should return [GithubFailure.reposLoadingFailure] '
    'when response is not successful',
    () async {
      when(
        () => mockGithubService.searchUserRepos(
          token: Hidden.GITHUB_TOKEN,
          query: 'testQuery',
          user: 'testUser',
          language: 'testLanguage',
          per_page: 15,
        ),
      ).thenAnswer(
        (invocation) async => Future.value(
          Response<GithubSearchReposDTO>(
            http.Response("body", 400),
            null,
          ),
        ),
      );

      final result = await githubRepository.searchUserRepos(
        query: 'testQuery',
        name: 'testUser',
        language: 'testLanguage',
        per_page: 15,
        page: 1,
      );

      expect(result, left(const GithubFailure.reposLoadingFailure()));
      verify(
        () => mockGithubService.searchUserRepos(
          token: Hidden.GITHUB_TOKEN,
          query: 'testQuery',
          user: 'testUser',
          language: 'testLanguage',
          per_page: 15,
        ),
      ).called(1);
      verifyNoMoreInteractions(mockGithubService);
    },
  );

  test(
    'should return [GithubFailure.reposLoadingFailure] '
    'when response is successful, '
    'but response body is null',
    () async {
      when(
        () => mockGithubService.searchUserRepos(
          token: Hidden.GITHUB_TOKEN,
          query: 'testQuery',
          user: 'testUser',
          language: 'testLanguage',
          per_page: 15,
        ),
      ).thenAnswer(
        (invocation) async => Future.value(
          Response<GithubSearchReposDTO>(
            http.Response("body", 200),
            null,
          ),
        ),
      );

      final result = await githubRepository.searchUserRepos(
        query: 'testQuery',
        name: 'testUser',
        language: 'testLanguage',
        per_page: 15,
        page: 1,
      );

      expect(result, left(const GithubFailure.reposLoadingFailure()));
      verify(
        () => mockGithubService.searchUserRepos(
          token: Hidden.GITHUB_TOKEN,
          query: 'testQuery',
          user: 'testUser',
          language: 'testLanguage',
          per_page: 15,
        ),
      ).called(1);
      verifyNoMoreInteractions(mockGithubService);
    },
  );

  test(
    'should return [GithubFailure.reposLoadingFailure] '
    'when response throws error',
    () async {
      when(
        () => mockGithubService.searchUserRepos(
          token: Hidden.GITHUB_TOKEN,
          query: 'testQuery',
          user: 'testUser',
          language: 'testLanguage',
          per_page: 15,
        ),
      ).thenThrow(Error());

      final result = await githubRepository.searchUserRepos(
        query: 'testQuery',
        name: 'testUser',
        language: 'testLanguage',
        per_page: 15,
        page: 1,
      );

      expect(result, left(const GithubFailure.reposLoadingFailure()));
      verify(
        () => mockGithubService.searchUserRepos(
          token: Hidden.GITHUB_TOKEN,
          query: 'testQuery',
          user: 'testUser',
          language: 'testLanguage',
          per_page: 15,
        ),
      ).called(1);
      verifyNoMoreInteractions(mockGithubService);
    },
  );
}
