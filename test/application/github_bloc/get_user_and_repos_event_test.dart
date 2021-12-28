import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:dportfolio_v2/application/github_bloc/github_bloc.dart';
import 'package:dportfolio_v2/domain/github/github_failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/general_mocks/mock_github_repository.dart';
import 'core/github_bloc_fetched_results.dart';

void main() {
  final MockGithubRepository mockGithubRepository = MockGithubRepository();
  late GithubBloc githubBloc;

  setUp(
    () {
      githubBloc = GithubBloc(mockGithubRepository);
    },
  );

  tearDown(
    () {
      reset(mockGithubRepository);
    },
  );

  group('is_not_refresh', () {
    const bool refresh = false;
    blocTest<GithubBloc, GithubState>(
      'calling event with [name = testUser], '
      'user loaded successfully, '
      'repos loaded successfully and CAN BE PAGINATED, '
      'should emit [GithubState.userWithReposLoaded] ',
      build: () {
        when(() => mockGithubRepository.getUserByName(name: 'testUser'))
            .thenAnswer((invocation) async => right(fetchedUser));

        when(
          () => mockGithubRepository.searchUserRepos(
            name: 'testUser',
            per_page: githubBloc.LOAD_PER_PAGE,
            page: 1,
          ),
        ).thenAnswer(
          (invocation) async => right(fetchedSearchReposThatCanLoadMore),
        );

        return githubBloc;
      },
      act: (bloc) => bloc.add(
        const GithubEvent.getUserAndRepos(
          name: 'testUser',
          isRefresh: refresh,
        ),
      ),
      expect: () => [
        const GithubState.loading(),
        const GithubState.userWithReposLoaded(
          fetchedUser,
          fetchedSearchReposThatCanLoadMore,
          canLoadMore: true,
        ),
      ],
      verify: (bloc) {
        verify(() => mockGithubRepository.getUserByName(name: 'testUser'))
            .called(1);
        verify(
          () => mockGithubRepository.searchUserRepos(
            name: 'testUser',
            per_page: githubBloc.LOAD_PER_PAGE,
            page: 1,
          ),
        ).called(1);
        expect(bloc.canLoadMore, true);
        expect(bloc.currentSearchResults, fetchedSearchReposThatCanLoadMore);
        expect(bloc.currentLoadedUser, fetchedUser);
      },
    );

    blocTest<GithubBloc, GithubState>(
      'calling event with [name = testUser], '
      'user loaded successfully, '
      'repos loaded successfully and CAN NOT BE PAGINATED, '
      'should emit [GithubState.userWithReposLoaded] ',
      build: () {
        when(() => mockGithubRepository.getUserByName(name: 'testUser'))
            .thenAnswer((invocation) async => right(fetchedUser));

        when(
          () => mockGithubRepository.searchUserRepos(
            name: 'testUser',
            per_page: githubBloc.LOAD_PER_PAGE,
            page: 1,
          ),
        ).thenAnswer(
          (invocation) async => right(fetchedSearchReposThatCanNotLoadMore),
        );

        return githubBloc;
      },
      act: (bloc) => bloc.add(
        const GithubEvent.getUserAndRepos(
          name: 'testUser',
          isRefresh: refresh,
        ),
      ),
      expect: () => [
        const GithubState.loading(),
        const GithubState.userWithReposLoaded(
          fetchedUser,
          fetchedSearchReposThatCanNotLoadMore,
          canLoadMore: false,
        ),
      ],
      verify: (bloc) {
        verify(() => mockGithubRepository.getUserByName(name: 'testUser'))
            .called(1);
        verify(
          () => mockGithubRepository.searchUserRepos(
            name: 'testUser',
            per_page: githubBloc.LOAD_PER_PAGE,
            page: 1,
          ),
        ).called(1);
        expect(bloc.canLoadMore, false);
        expect(bloc.currentSearchResults, fetchedSearchReposThatCanNotLoadMore);
        expect(bloc.currentLoadedUser, fetchedUser);
      },
    );

    blocTest<GithubBloc, GithubState>(
      'calling event with [name = testUser], '
      'user loading UNSUCCESSFUL, '
      'should not perform any actions with repository, '
      'should emit [GithubState.initialLoadingError]',
      build: () {
        when(() => mockGithubRepository.getUserByName(name: 'testUser'))
            .thenAnswer(
          (invocation) async => left(const GithubFailure.userLoadingFailure()),
        );

        return githubBloc;
      },
      act: (bloc) => bloc.add(
        const GithubEvent.getUserAndRepos(
          name: 'testUser',
          isRefresh: refresh,
        ),
      ),
      expect: () => [
        const GithubState.loading(),
        const GithubState.initialLoadingError(
          GithubFailure.userLoadingFailure(),
        ),
      ],
      verify: (_) {
        verify(() => mockGithubRepository.getUserByName(name: 'testUser'))
            .called(1);
        verifyNoMoreInteractions(mockGithubRepository);
      },
    );

    blocTest<GithubBloc, GithubState>(
      'calling event with [name = testUser], '
      'user loading SUCCESSFUL, '
      'but repos loading is UNSUCCESSFUL, '
      'should emit [GithubState.initialLoadingError]',
      build: () {
        when(() => mockGithubRepository.getUserByName(name: 'testUser'))
            .thenAnswer(
          (invocation) async => right(fetchedUser),
        );

        when(
          () => mockGithubRepository.searchUserRepos(
            name: 'testUser',
            per_page: githubBloc.LOAD_PER_PAGE,
            page: 1,
          ),
        ).thenAnswer(
          (invocation) async => left(
            const GithubFailure.reposLoadingFailure(),
          ),
        );

        return githubBloc;
      },
      act: (bloc) => bloc.add(
        const GithubEvent.getUserAndRepos(
          name: 'testUser',
          isRefresh: refresh,
        ),
      ),
      expect: () => [
        const GithubState.loading(),
        const GithubState.initialLoadingError(
          GithubFailure.reposLoadingFailure(),
        ),
      ],
      verify: (_) {
        verify(() => mockGithubRepository.getUserByName(name: 'testUser'))
            .called(1);
        verify(
          () => mockGithubRepository.searchUserRepos(
            name: 'testUser',
            per_page: githubBloc.LOAD_PER_PAGE,
            page: 1,
          ),
        ).called(1);
      },
    );
  });

  group('is_refresh', () {
    const bool refresh = true;

    blocTest<GithubBloc, GithubState>(
      'calling event with [name = testUser], '
      'user loaded successfully, '
      'repos loaded successfully and CAN BE PAGINATED, '
      'should emit [GithubState.userWithReposLoaded] ',
      build: () {
        when(() => mockGithubRepository.getUserByName(name: 'testUser'))
            .thenAnswer((invocation) async => right(fetchedUser));

        when(
          () => mockGithubRepository.searchUserRepos(
            name: 'testUser',
            per_page: githubBloc.LOAD_PER_PAGE,
            page: 1,
          ),
        ).thenAnswer(
          (invocation) async => right(fetchedSearchReposThatCanLoadMore),
        );

        return githubBloc;
      },
      act: (bloc) => bloc.add(
        const GithubEvent.getUserAndRepos(
          name: 'testUser',
          isRefresh: refresh,
        ),
      ),
      expect: () => [
        const GithubState.refreshing(),
        const GithubState.userWithReposLoaded(
          fetchedUser,
          fetchedSearchReposThatCanLoadMore,
          canLoadMore: true,
        ),
      ],
      verify: (bloc) {
        verify(() => mockGithubRepository.getUserByName(name: 'testUser'))
            .called(1);
        verify(
          () => mockGithubRepository.searchUserRepos(
            name: 'testUser',
            per_page: githubBloc.LOAD_PER_PAGE,
            page: 1,
          ),
        ).called(1);
        expect(bloc.canLoadMore, true);
        expect(bloc.currentSearchResults, fetchedSearchReposThatCanLoadMore);
        expect(bloc.currentLoadedUser, fetchedUser);
      },
    );

    blocTest<GithubBloc, GithubState>(
      'calling event with [name = testUser], '
      'user loaded successfully, '
      'repos loaded successfully and CAN NOT BE PAGINATED, '
      'should emit [GithubState.userWithReposLoaded] ',
      build: () {
        when(() => mockGithubRepository.getUserByName(name: 'testUser'))
            .thenAnswer((invocation) async => right(fetchedUser));

        when(
          () => mockGithubRepository.searchUserRepos(
            name: 'testUser',
            per_page: githubBloc.LOAD_PER_PAGE,
            page: 1,
          ),
        ).thenAnswer(
          (invocation) async => right(fetchedSearchReposThatCanNotLoadMore),
        );

        return githubBloc;
      },
      act: (bloc) => bloc.add(
        const GithubEvent.getUserAndRepos(
          name: 'testUser',
          isRefresh: refresh,
        ),
      ),
      expect: () => [
        const GithubState.refreshing(),
        const GithubState.userWithReposLoaded(
          fetchedUser,
          fetchedSearchReposThatCanNotLoadMore,
          canLoadMore: false,
        ),
      ],
      verify: (bloc) {
        verify(() => mockGithubRepository.getUserByName(name: 'testUser'))
            .called(1);
        verify(
          () => mockGithubRepository.searchUserRepos(
            name: 'testUser',
            per_page: githubBloc.LOAD_PER_PAGE,
            page: 1,
          ),
        ).called(1);
        expect(bloc.canLoadMore, false);
        expect(bloc.currentSearchResults, fetchedSearchReposThatCanNotLoadMore);
        expect(bloc.currentLoadedUser, fetchedUser);
      },
    );

    blocTest<GithubBloc, GithubState>(
      'calling event with [name = testUser], '
      'user loading UNSUCCESSFUL, '
      'should still try to get user repos '
      'that are SUCCESSFUL and CAN BE PAGINATED, '
      'should emit [GithubState.userWithReposLoaded] '
      'with specified failure [GithubFailure.userLoadingFailure]',
      build: () {
        when(() => mockGithubRepository.getUserByName(name: 'testUser'))
            .thenAnswer(
          (invocation) async => left(const GithubFailure.userLoadingFailure()),
        );

        when(
          () => mockGithubRepository.searchUserRepos(
            name: 'testUser',
            per_page: githubBloc.LOAD_PER_PAGE,
            page: 1,
          ),
        ).thenAnswer(
          (invocation) async => right(fetchedSearchReposThatCanLoadMore),
        );

        // initially loaded user, because it is refresh event
        githubBloc.currentLoadedUser = fetchedUser;

        return githubBloc;
      },
      act: (bloc) => bloc.add(
        const GithubEvent.getUserAndRepos(
          name: 'testUser',
          isRefresh: refresh,
        ),
      ),
      expect: () => [
        const GithubState.refreshing(),
        const GithubState.userWithReposLoaded(
          fetchedUser,
          fetchedSearchReposThatCanLoadMore,
          failure: GithubFailure.userLoadingFailure(),
          canLoadMore: true,
        ),
      ],
      verify: (bloc) {
        verify(() => mockGithubRepository.getUserByName(name: 'testUser'))
            .called(1);
        verify(
          () => mockGithubRepository.searchUserRepos(
            name: 'testUser',
            per_page: githubBloc.LOAD_PER_PAGE,
            page: 1,
          ),
        ).called(1);

        expect(bloc.canLoadMore, true);
        expect(bloc.currentSearchResults, fetchedSearchReposThatCanLoadMore);
        expect(bloc.currentLoadedUser, fetchedUser);
      },
    );

    blocTest<GithubBloc, GithubState>(
      'calling event with [name = testUser], '
      'user loading UNSUCCESSFUL, '
      'repos loading UNSUCCESSFUL, '
      'should emit [GithubState.userWithReposLoaded] '
      'with specified failure [GithubFailure.userAndReposLoadingFailure]',
      build: () {
        when(() => mockGithubRepository.getUserByName(name: 'testUser'))
            .thenAnswer(
          (invocation) async => left(const GithubFailure.userLoadingFailure()),
        );

        when(
          () => mockGithubRepository.searchUserRepos(
            name: 'testUser',
            per_page: githubBloc.LOAD_PER_PAGE,
            page: 1,
          ),
        ).thenAnswer(
          (invocation) async => left(const GithubFailure.reposLoadingFailure()),
        );

        // initially loaded data, because it is refresh event
        githubBloc.currentLoadedUser = fetchedUser;
        githubBloc.currentSearchResults = fetchedSearchReposThatCanLoadMore;
        githubBloc.canLoadMore = true;

        return githubBloc;
      },
      act: (bloc) => bloc.add(
        const GithubEvent.getUserAndRepos(
          name: 'testUser',
          isRefresh: refresh,
        ),
      ),
      expect: () => [
        const GithubState.refreshing(),
        const GithubState.userWithReposLoaded(
          fetchedUser,
          fetchedSearchReposThatCanLoadMore,
          failure: GithubFailure.userAndReposLoadingFailure(),
          canLoadMore: true,
        ),
      ],
      verify: (bloc) {
        verify(() => mockGithubRepository.getUserByName(name: 'testUser'))
            .called(1);
        verify(
          () => mockGithubRepository.searchUserRepos(
            name: 'testUser',
            per_page: githubBloc.LOAD_PER_PAGE,
            page: 1,
          ),
        ).called(1);

        expect(bloc.canLoadMore, true);
        expect(bloc.currentSearchResults, fetchedSearchReposThatCanLoadMore);
        expect(bloc.currentLoadedUser, fetchedUser);
      },
    );

    blocTest<GithubBloc, GithubState>(
      'calling event with [name = testUser], '
      'user loaded successfully, '
      'repos loaded successfully and CAN BE PAGINATED, '
      'should reset [currentPage] counter, '
      'should emit [GithubState.userWithReposLoaded] ',
      build: () {
        when(() => mockGithubRepository.getUserByName(name: 'testUser'))
            .thenAnswer((invocation) async => right(fetchedUser));

        when(
          () => mockGithubRepository.searchUserRepos(
            name: 'testUser',
            per_page: githubBloc.LOAD_PER_PAGE,
            page: 1,
          ),
        ).thenAnswer(
          (invocation) async => right(fetchedSearchReposThatCanLoadMore),
        );

        // just faking currentPage number to see that it will be changed to 1
        githubBloc.currentPage = 2;

        return githubBloc;
      },
      act: (bloc) => bloc.add(
        const GithubEvent.getUserAndRepos(
          name: 'testUser',
          isRefresh: refresh,
        ),
      ),
      expect: () => [
        const GithubState.refreshing(),
        const GithubState.userWithReposLoaded(
          fetchedUser,
          fetchedSearchReposThatCanLoadMore,
          canLoadMore: true,
        ),
      ],
      verify: (bloc) {
        verify(() => mockGithubRepository.getUserByName(name: 'testUser'))
            .called(1);
        verify(
          () => mockGithubRepository.searchUserRepos(
            name: 'testUser',
            per_page: githubBloc.LOAD_PER_PAGE,
            page: 1,
          ),
        ).called(1);
        expect(bloc.canLoadMore, true);
        expect(bloc.currentSearchResults, fetchedSearchReposThatCanLoadMore);
        expect(bloc.currentLoadedUser, fetchedUser);
        expect(bloc.currentPage, 1);
      },
    );

    blocTest<GithubBloc, GithubState>(
      'calling event with [name = testUser], '
      'user loaded successfully, '
      'but repos loading UNSUCCESSFUL, '
      'should NOT reset [currentPage] counter, '
      'should emit [GithubState.userWithReposLoaded] '
      'with specified failure [GithubFailure.reposLoadingFailure]',
      build: () {
        when(() => mockGithubRepository.getUserByName(name: 'testUser'))
            .thenAnswer((invocation) async => right(fetchedUser));

        when(
          () => mockGithubRepository.searchUserRepos(
            name: 'testUser',
            per_page: githubBloc.LOAD_PER_PAGE,
            page: 1,
          ),
        ).thenAnswer(
          (invocation) async => left(const GithubFailure.reposLoadingFailure()),
        );

        // just faking currentPage number to see that it will NOT be changed to 1
        githubBloc.currentPage = 2;

        githubBloc.currentLoadedUser = fetchedUser;
        githubBloc.currentSearchResults = fetchedSearchReposThatCanLoadMore;
        githubBloc.canLoadMore = true;

        return githubBloc;
      },
      act: (bloc) => bloc.add(
        const GithubEvent.getUserAndRepos(
          name: 'testUser',
          isRefresh: refresh,
        ),
      ),
      expect: () => [
        const GithubState.refreshing(),
        const GithubState.userWithReposLoaded(
          fetchedUser,
          fetchedSearchReposThatCanLoadMore,
          failure: GithubFailure.reposLoadingFailure(),
          canLoadMore: true,
        ),
      ],
      verify: (bloc) {
        verify(() => mockGithubRepository.getUserByName(name: 'testUser'))
            .called(1);
        verify(
          () => mockGithubRepository.searchUserRepos(
            name: 'testUser',
            per_page: githubBloc.LOAD_PER_PAGE,
            page: 1,
          ),
        ).called(1);
        expect(bloc.canLoadMore, true);
        expect(bloc.currentSearchResults, fetchedSearchReposThatCanLoadMore);
        expect(bloc.currentLoadedUser, fetchedUser);
        expect(bloc.currentPage, 2);
      },
    );
  });
}
