import 'package:dartz/dartz.dart';
import 'package:dportfolio_v2/application/github_search_bloc/github_search_pagination.dart';
import 'package:dportfolio_v2/domain/github/github_failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/general_mocks/mock_github_repository.dart';
import '../../github_bloc/core/github_bloc_fetched_results.dart';

void main() {
  final MockGithubRepository mockGithubRepository = MockGithubRepository();
  late GithubSearchPagination pagination;

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
    'should join [currentSearchResults] '
    'with paginated results when search is successful',
    () {
      pagination.currentSearchResults = fetchedSearchReposThatCanLoadMore;

      pagination.finalizeResults(
        right(paginatedSearchReposThatCanNotLoadMore),
      );

      expect(
        pagination.currentSearchResults,
        mergedSearchReposThatCanNotLoadMore,
      );
    },
  );

  test(
    'should set [currentSearchResults] '
    'to paginated results when search is successful '
    'and [currentSearchResults] == null',
    () {
      pagination.currentSearchResults = null;

      pagination.finalizeResults(
        right(paginatedSearchReposThatCanNotLoadMore),
      );

      expect(
        pagination.currentSearchResults,
        paginatedSearchReposThatCanNotLoadMore,
      );
    },
  );

  test(
    'should keep the same [currentSearchResults] '
    'when search is UNSUCCESSFUL ',
    () {
      pagination.currentSearchResults = fetchedSearchReposThatCanLoadMore;

      pagination.finalizeResults(
        left(const GithubFailure.reposLoadingFailure()),
      );

      expect(
        pagination.currentSearchResults,
        fetchedSearchReposThatCanLoadMore,
      );
    },
  );
}
