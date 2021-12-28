import 'package:dartz/dartz.dart';
import 'package:dportfolio_v2/application/github_search_bloc/github_search_bloc.dart';
import 'package:dportfolio_v2/application/github_search_bloc/github_search_filter_options.dart';
import 'package:dportfolio_v2/application/github_search_bloc/github_search_pagination.dart';
import 'package:dportfolio_v2/domain/github/github_failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/general_mocks/mock_github_repository.dart';
import '../../github_bloc/core/github_bloc_fetched_results.dart';

void main() {
  final MockGithubRepository mockGithubRepository = MockGithubRepository();
  late GithubSearchPagination pagination;
  const String username = 'testUser';

  setUp(
    () {
      pagination = GithubSearchPagination(mockGithubRepository);
    },
  );

  tearDown(
    () {
      reset(mockGithubRepository);
    },
  );

  test(
    'should return [GithubSearchState.initial] '
    'when query is empty, '
    'language index is 0 (language is not selected) '
    'and [loadingMore] is false, '
    'should NOT perform any actions with repository',
    () async {
      pagination.query = '';
      pagination.currentLanguageIndexNotifier.value = 0;

      final result = await pagination.search(
        loadingMore: false,
        username: 'testUser',
      );

      expect(result, const GithubSearchState.initial());
      verifyNoMoreInteractions(mockGithubRepository);
    },
  );

  test(
    'when query is NOT empty, '
    'language index is 0 (language is not selected), '
    '[loadingMore] is FALSE, '
    'should call repository to search more repos, ',
    () async {
      pagination.query = 'testQuery';

      when(
        () => mockGithubRepository.searchUserRepos(
          name: username,
          per_page: pagination.LOAD_PER_PAGE,
          page: 1,
          query: 'testQuery',
          language: '',
        ),
      ).thenAnswer(
        (invocation) async => right(fetchedSearchReposThatCanLoadMore),
      );

      await pagination.search(
        loadingMore: false,
        username: 'testUser',
      );

      verify(
        () => mockGithubRepository.searchUserRepos(
          name: username,
          per_page: pagination.LOAD_PER_PAGE,
          page: 1,
          query: 'testQuery',
          language: '',
        ),
      ).called(1);
    },
  );

  test(
    'when query IS empty, '
    'language index is 1 (language is selected), '
    '[loadingMore] is FALSE, '
    'should call repository to search more repos, ',
    () async {
      pagination.query = '';
      pagination.currentLanguageIndexNotifier.value = 1;

      when(
        () => mockGithubRepository.searchUserRepos(
          name: username,
          per_page: pagination.LOAD_PER_PAGE,
          page: 1,
          query: '',
          language: defaultFilterOptions[1],
        ),
      ).thenAnswer(
        (invocation) async => right(fetchedSearchReposThatCanLoadMore),
      );

      await pagination.search(
        loadingMore: false,
        username: 'testUser',
      );

      verify(
        () => mockGithubRepository.searchUserRepos(
          name: username,
          per_page: pagination.LOAD_PER_PAGE,
          page: 1,
          query: '',
          language: defaultFilterOptions[1],
        ),
      ).called(1);
    },
  );

  test(
    'when query IS empty, '
    'language index is 0 (language is NOT selected), '
    '[loadingMore] is TRUE, '
    'should call repository to search more repos, ',
    () async {
      pagination.query = '';
      pagination.currentLanguageIndexNotifier.value = 0;

      when(
        () => mockGithubRepository.searchUserRepos(
          name: username,
          per_page: pagination.LOAD_PER_PAGE,
          page: 2,
          query: '',
          language: '',
        ),
      ).thenAnswer(
        (invocation) async => right(fetchedSearchReposThatCanLoadMore),
      );

      await pagination.search(
        loadingMore: true,
        username: 'testUser',
      );

      verify(
        () => mockGithubRepository.searchUserRepos(
          name: username,
          per_page: pagination.LOAD_PER_PAGE,
          page: 2,
          query: '',
          language: '',
        ),
      ).called(1);
    },
  );

  test(
    'should increment [currentPage] '
    'when repos searched successfully '
    'and [loadingMore] is true',
    () async {
      pagination.query = 'testQuery';
      pagination.currentPage = 1;

      when(
        () => mockGithubRepository.searchUserRepos(
          name: username,
          per_page: pagination.LOAD_PER_PAGE,
          page: 2,
          query: 'testQuery',
          language: '',
        ),
      ).thenAnswer(
        (invocation) async => right(paginatedSearchReposThatCanLoadMore),
      );

      expect(pagination.currentPage, 1);

      await pagination.search(
        loadingMore: true,
        username: 'testUser',
      );

      expect(pagination.currentPage, 2);
    },
  );

  test(
    'should NOT increment [currentPage] '
    'when repos searched successfully '
    'and [loadingMore] is false',
    () async {
      pagination.query = 'testQuery';
      pagination.currentPage = 1;

      when(
        () => mockGithubRepository.searchUserRepos(
          name: username,
          per_page: pagination.LOAD_PER_PAGE,
          page: 2,
          query: 'testQuery',
          language: '',
        ),
      ).thenAnswer(
        (invocation) async => right(fetchedSearchReposThatCanLoadMore),
      );

      expect(pagination.currentPage, 1);

      await pagination.search(
        loadingMore: false,
        username: 'testUser',
      );

      expect(pagination.currentPage, 1);
    },
  );

  test(
    'should NOT increment [currentPage] '
    'when repos searched UNSUCCESSFULLY '
    'and [loadingMore] is true',
    () async {
      pagination.query = 'testQuery';
      pagination.currentPage = 1;

      when(
        () => mockGithubRepository.searchUserRepos(
          name: username,
          per_page: pagination.LOAD_PER_PAGE,
          page: 2,
          query: 'testQuery',
          language: '',
        ),
      ).thenAnswer(
        (invocation) async => left(const GithubFailure.reposLoadingFailure()),
      );

      expect(pagination.currentPage, 1);

      await pagination.search(
        loadingMore: true,
        username: 'testUser',
      );

      expect(pagination.currentPage, 1);
    },
  );

  test(
    'should keep the same [currentSearchResults] '
    'when search repos is unsuccessful ',
    () async {
      pagination.query = 'testQuery';
      pagination.currentPage = 1;
      pagination.currentSearchResults = fetchedSearchReposThatCanLoadMore;

      when(
        () => mockGithubRepository.searchUserRepos(
          name: username,
          per_page: pagination.LOAD_PER_PAGE,
          page: 2,
          query: 'testQuery',
          language: '',
        ),
      ).thenAnswer(
        (invocation) async => left(const GithubFailure.reposLoadingFailure()),
      );

      await pagination.search(
        loadingMore: true,
        username: 'testUser',
      );

      expect(
        pagination.currentSearchResults,
        fetchedSearchReposThatCanLoadMore,
      );
    },
  );

  test(
    'should join [currentSearchResults] '
    'with successfully searched repos ',
    () async {
      pagination.query = 'testQuery';
      pagination.currentPage = 1;
      pagination.currentSearchResults = fetchedSearchReposThatCanLoadMore;

      when(
        () => mockGithubRepository.searchUserRepos(
          name: username,
          per_page: pagination.LOAD_PER_PAGE,
          page: 2,
          query: 'testQuery',
          language: '',
        ),
      ).thenAnswer(
        (invocation) async => right(paginatedSearchReposThatCanNotLoadMore),
      );

      await pagination.search(
        loadingMore: true,
        username: 'testUser',
      );

      expect(
        pagination.currentSearchResults,
        mergedSearchReposThatCanNotLoadMore,
      );
    },
  );

  test(
    'should keep the same [canLoadMore] '
    'when search repos is unsuccessful ',
    () async {
      pagination.query = 'testQuery';
      pagination.currentPage = 1;
      pagination.canLoadMore = true;

      when(
        () => mockGithubRepository.searchUserRepos(
          name: username,
          per_page: pagination.LOAD_PER_PAGE,
          page: 2,
          query: 'testQuery',
          language: '',
        ),
      ).thenAnswer(
        (invocation) async => left(const GithubFailure.reposLoadingFailure()),
      );

      await pagination.search(
        loadingMore: true,
        username: 'testUser',
      );

      expect(
        pagination.canLoadMore,
        true,
      );
    },
  );

  test(
    'should change [canLoadMore] '
    'when search repos is successful ',
    () async {
      pagination.query = 'testQuery';
      pagination.currentPage = 1;
      pagination.canLoadMore = true;

      when(
        () => mockGithubRepository.searchUserRepos(
          name: username,
          per_page: pagination.LOAD_PER_PAGE,
          page: 2,
          query: 'testQuery',
          language: '',
        ),
      ).thenAnswer(
        (invocation) async => right(paginatedSearchReposThatCanNotLoadMore),
      );

      await pagination.search(
        loadingMore: true,
        username: 'testUser',
      );

      expect(
        pagination.canLoadMore,
        false,
      );
    },
  );

  test(
    'should return [GithubSearchState.searched] '
    'when repos searched successfully, ',
    () async {
      pagination.query = 'testQuery';
      pagination.currentPage = 1;

      when(
        () => mockGithubRepository.searchUserRepos(
          name: username,
          per_page: pagination.LOAD_PER_PAGE,
          page: 1,
          query: 'testQuery',
          language: '',
        ),
      ).thenAnswer(
        (invocation) async => right(fetchedSearchReposThatCanLoadMore),
      );

      final result = await pagination.search(
        loadingMore: false,
        username: 'testUser',
      );

      expect(
        result,
        const GithubSearchState.searched(
          fetchedSearchReposThatCanLoadMore,
          true,
        ),
      );
    },
  );

  test(
    'should return [GithubSearchState.loadingMoreError] '
    'when repos searched UNSUCCESSFULLY '
    'and [loadingMore] is TRUE',
    () async {
      pagination.query = 'testQuery';
      pagination.currentPage = 1;

      when(
        () => mockGithubRepository.searchUserRepos(
          name: username,
          per_page: pagination.LOAD_PER_PAGE,
          page: 2,
          query: 'testQuery',
          language: '',
        ),
      ).thenAnswer(
        (invocation) async => left(const GithubFailure.reposLoadingFailure()),
      );

      final result = await pagination.search(
        loadingMore: true,
        username: 'testUser',
      );

      expect(
        result,
        const GithubSearchState.loadingMoreError(
          GithubFailure.reposLoadingFailure(),
        ),
      );
    },
  );

  test(
    'should return [GithubSearchState.searchingError] '
    'when repos searched UNSUCCESSFULLY '
    'and [loadingMore] is FALSE',
    () async {
      pagination.query = 'testQuery';
      pagination.currentPage = 1;

      when(
        () => mockGithubRepository.searchUserRepos(
          name: username,
          per_page: pagination.LOAD_PER_PAGE,
          page: 1,
          query: 'testQuery',
          language: '',
        ),
      ).thenAnswer(
        (invocation) async => left(const GithubFailure.reposLoadingFailure()),
      );

      final result = await pagination.search(
        loadingMore: false,
        username: 'testUser',
      );

      expect(
        result,
        const GithubSearchState.searchingError(
          GithubFailure.reposLoadingFailure(),
        ),
      );
    },
  );

  test(
    'should return [GithubSearchState.loadingMoreError] with unexpected failure '
    'when try/catch activates (something throws error) '
    'and [loadingMore] is TRUE',
    () async {
      pagination.query = 'testQuery';
      pagination.currentPage = 1;

      when(
        () => mockGithubRepository.searchUserRepos(
          name: username,
          per_page: pagination.LOAD_PER_PAGE,
          page: 1,
          query: 'testQuery',
          language: '',
        ),
      ).thenThrow(Exception());

      final result = await pagination.search(
        loadingMore: true,
        username: 'testUser',
      );

      expect(
        result,
        const GithubSearchState.loadingMoreError(
          GithubFailure.unexpected(),
        ),
      );
    },
  );

  test(
    'should return [GithubSearchState.searchingError] with unexpected failure '
    'when try/catch activates (something throws error) '
    'and [loadingMore] is FALSE',
    () async {
      pagination.query = 'testQuery';
      pagination.currentPage = 1;

      when(
        () => mockGithubRepository.searchUserRepos(
          name: username,
          per_page: pagination.LOAD_PER_PAGE,
          page: 1,
          query: 'testQuery',
          language: '',
        ),
      ).thenThrow(Exception());

      final result = await pagination.search(
        loadingMore: false,
        username: 'testUser',
      );

      expect(
        result,
        const GithubSearchState.searchingError(
          GithubFailure.unexpected(),
        ),
      );
    },
  );
}
