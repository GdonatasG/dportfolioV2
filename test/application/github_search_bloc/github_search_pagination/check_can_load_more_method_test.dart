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
    'should change [canLoadMore] '
    'when search is successful',
    () {
      pagination.canLoadMore = true;

      pagination
          .checkCanLoadMore(right(paginatedSearchReposThatCanNotLoadMore));

      expect(
        pagination.canLoadMore,
        false,
      );
    },
  );

  test(
    'should keep the same [canLoadMore] '
    'when search is UNSUCCESSFUL ',
    () {
      pagination.canLoadMore = true;

      pagination.checkCanLoadMore(
        left(const GithubFailure.reposLoadingFailure()),
      );

      expect(
        pagination.canLoadMore,
        true,
      );
    },
  );
}
