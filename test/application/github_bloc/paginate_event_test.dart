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

      // this is pagination which means that data were initially loaded
      // and can be paginated
      githubBloc.currentLoadedUser = fetchedUser;
      githubBloc.currentSearchResults = fetchedSearchReposThatCanLoadMore;
      githubBloc.canLoadMore = true;
    },
  );

  tearDown(
    () async {
      reset(mockGithubRepository);
      await githubBloc.close();
    },
  );

  blocTest<GithubBloc, GithubState>(
    'pagination successful, '
    'should increment [currentPage] counter, '
    'should join initially fetched and paginated lists together '
    'should be able to load more (paginate), '
    'should emit [GithubState.userWithReposLoaded]',
    build: () {
      when(
        () => mockGithubRepository.searchUserRepos(
          name: fetchedUser.login!,
          per_page: githubBloc.LOAD_PER_PAGE,
          page: 2,
        ),
      ).thenAnswer(
        (invocation) async => right(paginatedSearchReposThatCanLoadMore),
      );

      githubBloc.currentPage = 1;

      return githubBloc;
    },
    act: (bloc) => bloc.add(const GithubEvent.paginate()),
    expect: () => [
      const GithubState.loadingMore(),
      GithubState.userWithReposLoaded(
        fetchedUser,
        mergedSearchReposThatCanLoadMore,
        canLoadMore: true,
      ),
    ],
    verify: (bloc) {
      verify(
        () => mockGithubRepository.searchUserRepos(
          name: fetchedUser.login!,
          per_page: githubBloc.LOAD_PER_PAGE,
          page: 2,
        ),
      ).called(1);

      expect(bloc.currentPage, 2);
      expect(bloc.currentLoadedUser, fetchedUser);
      expect(bloc.currentSearchResults, mergedSearchReposThatCanLoadMore);
    },
  );

  blocTest<GithubBloc, GithubState>(
    'pagination successful, '
    'should increment [currentPage] counter, '
    'should join initially fetched and paginated lists together '
    'should NOT be able to load more (paginate), '
    'should emit [GithubState.userWithReposLoaded]',
    build: () {
      when(
        () => mockGithubRepository.searchUserRepos(
          name: fetchedUser.login!,
          per_page: githubBloc.LOAD_PER_PAGE,
          page: 2,
        ),
      ).thenAnswer(
        (invocation) async => right(paginatedSearchReposThatCanNotLoadMore),
      );

      githubBloc.currentPage = 1;

      return githubBloc;
    },
    act: (bloc) => bloc.add(const GithubEvent.paginate()),
    expect: () => [
      const GithubState.loadingMore(),
      GithubState.userWithReposLoaded(
        fetchedUser,
        mergedSearchReposThatCanNotLoadMore,
        canLoadMore: false,
      ),
    ],
    verify: (bloc) {
      verify(
        () => mockGithubRepository.searchUserRepos(
          name: fetchedUser.login!,
          per_page: githubBloc.LOAD_PER_PAGE,
          page: 2,
        ),
      ).called(1);

      expect(bloc.currentPage, 2);
      expect(bloc.currentLoadedUser, fetchedUser);
      expect(bloc.currentSearchResults, mergedSearchReposThatCanNotLoadMore);
    },
  );

  blocTest<GithubBloc, GithubState>(
    'pagination UNSUCCESSFUL, '
    'should NOT increment [currentPage] counter, '
    'should NOT join initially fetched and paginated lists together '
    'should be able to load more (paginate), '
    'because current pagination is unsuccessful, '
    'should emit [GithubState.loadingMoreError] '
    'with specified [GithubFailure.reposLoadingFailure] failure',
    build: () {
      when(
        () => mockGithubRepository.searchUserRepos(
          name: fetchedUser.login!,
          per_page: githubBloc.LOAD_PER_PAGE,
          page: 3,
        ),
      ).thenAnswer(
        (invocation) async => left(const GithubFailure.reposLoadingFailure()),
      );

      githubBloc.currentPage = 2;

      return githubBloc;
    },
    act: (bloc) => bloc.add(const GithubEvent.paginate()),
    expect: () => [
      const GithubState.loadingMore(),
      const GithubState.loadingMoreError(
        GithubFailure.reposLoadingFailure(),
      ),
    ],
    verify: (bloc) {
      verify(
        () => mockGithubRepository.searchUserRepos(
          name: fetchedUser.login!,
          per_page: githubBloc.LOAD_PER_PAGE,
          page: 3,
        ),
      ).called(1);

      expect(bloc.currentPage, 2);
      expect(bloc.currentLoadedUser, fetchedUser);
      expect(bloc.currentSearchResults, fetchedSearchReposThatCanLoadMore);
      expect(bloc.canLoadMore, true);
    },
  );
}
