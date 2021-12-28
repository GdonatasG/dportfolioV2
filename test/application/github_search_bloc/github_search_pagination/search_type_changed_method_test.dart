import 'package:dportfolio_v2/application/github_search_bloc/github_search_pagination.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/general_mocks/mock_github_repository.dart';

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
    'should change [isGlobalSearch] '
    'when method called',
    () {
      pagination.isGlobalSearch = false;

      pagination.searchTypeChanged(newValue: true);

      expect(pagination.isGlobalSearch, true);
    },
  );
}
