import 'package:chopper/chopper.dart';
import 'package:dartz/dartz.dart';
import 'package:dportfolio_v2/domain/github/github_failure.dart';
import 'package:dportfolio_v2/domain/github/github_user.dart';
import 'package:dportfolio_v2/hidden.dart';
import 'package:dportfolio_v2/infrastructure/github/github_repository.dart';
import 'package:dportfolio_v2/infrastructure/github/github_user_dto.dart';
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
    'should return [GithubUser] '
    'when [response.isSuccessful] '
    'and [response.body] != null',
    () async {
      const expectedDTO = GithubUserDTO(
        login: 'testLogin',
        avatar_url: 'testAvatarUrl',
        html_url: 'testUrl',
      );

      when(
        () => mockGithubService.getGithubUserByName(
          Hidden.GITHUB_TOKEN,
          'testUser',
        ),
      ).thenAnswer(
        (invocation) async => Future.value(
          Response<GithubUserDTO>(
            http.Response("body", 200),
            expectedDTO,
          ),
        ),
      );

      final result = await githubRepository.getUserByName(name: 'testUser');
      final GithubUser? user = result.fold((_) => null, (r) => r);

      expect(user, expectedDTO.toDomain());
      verify(
        () => mockGithubService.getGithubUserByName(
          Hidden.GITHUB_TOKEN,
          'testUser',
        ),
      ).called(1);
      verifyNoMoreInteractions(mockGithubService);
    },
  );

  test(
    'should return [GithubFailure.userLoadingFailure] '
    'when response is not successful',
    () async {
      when(
        () => mockGithubService.getGithubUserByName(
          Hidden.GITHUB_TOKEN,
          'testUser',
        ),
      ).thenAnswer(
        (invocation) async => Future.value(
          Response<GithubUserDTO>(
            http.Response("body", 400),
            null,
          ),
        ),
      );

      final result = await githubRepository.getUserByName(name: 'testUser');

      expect(result, left(const GithubFailure.userLoadingFailure()));
      verify(
        () => mockGithubService.getGithubUserByName(
          Hidden.GITHUB_TOKEN,
          'testUser',
        ),
      ).called(1);
      verifyNoMoreInteractions(mockGithubService);
    },
  );

  test(
    'should return [GithubFailure.userLoadingFailure] '
    'when response is successful, '
    'but response body is null',
    () async {
      when(
        () => mockGithubService.getGithubUserByName(
          Hidden.GITHUB_TOKEN,
          'testUser',
        ),
      ).thenAnswer(
        (invocation) async => Future.value(
          Response<GithubUserDTO>(
            http.Response("body", 200),
            null,
          ),
        ),
      );

      final result = await githubRepository.getUserByName(name: 'testUser');

      expect(result, left(const GithubFailure.userLoadingFailure()));
      verify(
        () => mockGithubService.getGithubUserByName(
          Hidden.GITHUB_TOKEN,
          'testUser',
        ),
      ).called(1);
      verifyNoMoreInteractions(mockGithubService);
    },
  );

  test(
    'should return [GithubFailure.userLoadingFailure] '
    'when response throws error',
    () async {
      when(
        () => mockGithubService.getGithubUserByName(
          Hidden.GITHUB_TOKEN,
          'testUser',
        ),
      ).thenThrow(Error());

      final result = await githubRepository.getUserByName(name: 'testUser');

      expect(result, left(const GithubFailure.userLoadingFailure()));
      verify(
        () => mockGithubService.getGithubUserByName(
          Hidden.GITHUB_TOKEN,
          'testUser',
        ),
      ).called(1);
      verifyNoMoreInteractions(mockGithubService);
    },
  );
}
