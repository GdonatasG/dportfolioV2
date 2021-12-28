import 'package:dportfolio_v2/application/github_search_bloc/github_search_filter_options.dart';
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
    'should return specific language '
    'when [currentLanguageIndexNotifier.value] equals to 1',
    () {
      pagination.currentLanguageIndexNotifier.value = 1;

      final result = pagination.getCurrentLanguageAsString();

      expect(
        result,
        defaultFilterOptions[1],
      );
    },
  );

  test(
    'should return specific language '
    'when [currentLanguageIndexNotifier.value] equals to 3',
    () {
      pagination.currentLanguageIndexNotifier.value = 3;

      final result = pagination.getCurrentLanguageAsString();

      expect(
        result,
        defaultFilterOptions[3],
      );
    },
  );

  test(
    'should return empty string '
    'when [currentLanguageIndexNotifier.value] equals to 0',
    () {
      pagination.currentLanguageIndexNotifier.value = 0;

      final result = pagination.getCurrentLanguageAsString();

      expect(
        result,
        '',
      );
    },
  );

  test(
    'should return empty string '
    'when [currentLanguageIndexNotifier.value] is higher '
    'than the length of filter options list',
    () {
      pagination.currentLanguageIndexNotifier.value =
          defaultFilterOptions.length + 1;

      final result = pagination.getCurrentLanguageAsString();

      expect(
        result,
        '',
      );
    },
  );
}
