import 'package:dportfolio_v2/application/github_search_bloc/github_search_pagination.dart';
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
    'should set [currentSearchResults] to null '
    'and [currentPage] to 1',
    () {
      pagination.currentPage = 2;
      pagination.currentSearchResults = fetchedSearchReposThatCanLoadMore;

      pagination.resetPagination();

      expect(pagination.currentSearchResults, isNull);
      expect(pagination.currentPage, 1);
    },
  );
}
