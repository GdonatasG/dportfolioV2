import 'package:bloc_test/bloc_test.dart';
import 'package:dportfolio_v2/application/github_search_bloc/github_search_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/general_mocks/mock_github_search_pagination.dart';
import '../github_bloc/core/github_bloc_fetched_results.dart';

void main() {
  final MockGithubSearchPagination mockPagination =
      MockGithubSearchPagination();
  late GithubSearchBloc githubSearchBloc;

  setUp(
    () {
      githubSearchBloc = GithubSearchBloc(mockPagination, username: 'testUser');
    },
  );

  tearDown(
    () async {
      reset(mockPagination);
      await githubSearchBloc.close();
    },
  );

  group(
    'paginateEvent',
    () {
      blocTest<GithubSearchBloc, GithubSearchState>(
        'should emit [GithubSearchState.loadingMore], '
        'should call [pagination.search], '
        'should also emit [GithubSearchState.searched], '
        'when search is successful',
        build: () {
          when(
            () => mockPagination.search(
              username: 'testUser',
              loadingMore: true,
            ),
          ).thenAnswer(
            (invocation) async => const GithubSearchState.searched(
              fetchedSearchReposThatCanLoadMore,
              true,
            ),
          );

          return githubSearchBloc;
        },
        act: (bloc) => bloc.add(
          const GithubSearchEvent.paginate(),
        ),
        expect: () => [
          const GithubSearchState.loadingMore(),
          const GithubSearchState.searched(
            fetchedSearchReposThatCanLoadMore,
            true,
          ),
        ],
        verify: (_) {
          verify(
            () => mockPagination.search(
              username: 'testUser',
              loadingMore: true,
            ),
          ).called(1);
        },
      );
    },
  );

  group(
    'retrySearchEvent',
    () {
      blocTest<GithubSearchBloc, GithubSearchState>(
        'should emit [GithubSearchState.searching], '
        'should call [pagination.resetPagination], '
        'should call [pagination.search], '
        'should also emit [GithubSearchState.searched], '
        'when search is successful',
        build: () {
          when(
            () => mockPagination.search(username: 'testUser'),
          ).thenAnswer(
            (invocation) async => const GithubSearchState.searched(
              fetchedSearchReposThatCanLoadMore,
              true,
            ),
          );

          return githubSearchBloc;
        },
        act: (bloc) => bloc.add(
          const GithubSearchEvent.retrySearch(),
        ),
        expect: () => [
          const GithubSearchState.searching(),
          const GithubSearchState.searched(
            fetchedSearchReposThatCanLoadMore,
            true,
          ),
        ],
        verify: (_) {
          verify(mockPagination.resetPagination).called(1);
          verify(
            () => mockPagination.search(
              username: 'testUser',
            ),
          ).called(1);
        },
      );
    },
  );

  group(
    'searchTypeChangedEvent',
    () {
      blocTest<GithubSearchBloc, GithubSearchState>(
        'should emit [GithubSearchState.searching], '
        'should call [pagination.resetPagination], '
        'should call [pagination.searchTypeChanged] with concrete value, '
        'should call [pagination.search], '
        'should also emit [GithubSearchState.searched], '
        'when search is successful',
        build: () {
          when(
            () => mockPagination.search(username: 'testUser'),
          ).thenAnswer(
            (invocation) async => const GithubSearchState.searched(
              fetchedSearchReposThatCanLoadMore,
              true,
            ),
          );

          return githubSearchBloc;
        },
        act: (bloc) => bloc.add(
          const GithubSearchEvent.searchTypeChanged(
            isGlobal: true,
          ),
        ),
        expect: () => [
          const GithubSearchState.searching(),
          const GithubSearchState.searched(
            fetchedSearchReposThatCanLoadMore,
            true,
          ),
        ],
        verify: (_) {
          verify(mockPagination.resetPagination).called(1);
          verify(() => mockPagination.searchTypeChanged(newValue: true))
              .called(1);
          verify(
            () => mockPagination.search(
              username: 'testUser',
            ),
          ).called(1);
        },
      );
    },
  );

  group(
    'languageChangedEvent',
    () {
      blocTest<GithubSearchBloc, GithubSearchState>(
        'should emit [GithubSearchState.searching], '
        'should call [pagination.resetPagination], '
        'should call [pagination.currentLanguageIndexChanged] with concrete value, '
        'should call [pagination.search], '
        'should also emit [GithubSearchState.searched], '
        'when search is successful',
        build: () {
          when(
            () => mockPagination.search(username: 'testUser'),
          ).thenAnswer(
            (invocation) async => const GithubSearchState.searched(
              fetchedSearchReposThatCanLoadMore,
              true,
            ),
          );

          return githubSearchBloc;
        },
        act: (bloc) => bloc.add(
          const GithubSearchEvent.languageChanged(
            index: 2,
          ),
        ),
        expect: () => [
          const GithubSearchState.searching(),
          const GithubSearchState.searched(
            fetchedSearchReposThatCanLoadMore,
            true,
          ),
        ],
        verify: (_) {
          verify(mockPagination.resetPagination).called(1);
          verify(() => mockPagination.currentLanguageIndexChanged(newValue: 2))
              .called(1);
          verify(
            () => mockPagination.search(
              username: 'testUser',
            ),
          ).called(1);
        },
      );
    },
  );

  group(
    'queryChangedEvent',
    () {
      blocTest<GithubSearchBloc, GithubSearchState>(
        'should emit [GithubSearchState.searching], '
        'should call [pagination.resetPagination], '
        'should call [pagination.queryChanged] with concrete value, '
        'should call [pagination.search], '
        'should also emit [GithubSearchState.searched], '
        'when search is successful',
        build: () {
          when(
            () => mockPagination.search(username: 'testUser'),
          ).thenAnswer(
            (invocation) async => const GithubSearchState.searched(
              fetchedSearchReposThatCanLoadMore,
              true,
            ),
          );

          return githubSearchBloc;
        },
        act: (bloc) => bloc.add(
          const GithubSearchEvent.queryChanged(
            query: 'testQuery',
          ),
        ),
        expect: () => [
          const GithubSearchState.searching(),
          const GithubSearchState.searched(
            fetchedSearchReposThatCanLoadMore,
            true,
          ),
        ],
        verify: (_) {
          verify(mockPagination.resetPagination).called(1);
          verify(() => mockPagination.queryChanged(newValue: 'testQuery'))
              .called(1);
          verify(
            () => mockPagination.search(
              username: 'testUser',
            ),
          ).called(1);
        },
      );
    },
  );

  test(
    'should call [pagination.close], '
    'when closing Bloc',
    () {
      // IMPORTANT: bloc.close() is called in [tearDown] test function

      verify(mockPagination.close).called(1);
    },
  );
}
