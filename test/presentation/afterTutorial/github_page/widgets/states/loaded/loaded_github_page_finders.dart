import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/widgets/states/loaded/core/loaded_github_page_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

mixin LoadedGithubPageFinders {
  static final refreshIndicator = find.byKey(
    const ValueKey(LoadedGithubPageKeys.REFRESH_INDICATOR),
  );
  static final searchTextField = find.byKey(
    const ValueKey(LoadedGithubPageKeys.SEARCH_TEXT_FIELD),
  );

  // LoadedSliverAppBar
  static final visitProfileButton = find.byKey(
    const ValueKey(LoadedGithubPageKeys.VISIT_PROFILE_BUTTON),
  );

  static final reposCountStickyHeader = find.byKey(
    const ValueKey(LoadedGithubPageKeys.REPOS_COUNT_STICKY_HEADER),
  );
  static final emptyListWidgetSliver = find.byKey(
    const ValueKey(LoadedGithubPageKeys.EMPTY_LIST_WIDGET_SLIVER),
  );

  // GithubLoadedRepos
  static final repoList = find.byKey(
    const ValueKey(LoadedGithubPageKeys.REPO_LIST),
  );

  // *** surrounded widget for pagination
  // has [paginationIndicator] or [paginateButton] inside
  // depending on state ***
  static final paginateWidget = find.byKey(
    const ValueKey(LoadedGithubPageKeys.PAGINATE_WIDGET),
  );
  static final paginateButton = find.byKey(
    const ValueKey(LoadedGithubPageKeys.PAGINATE_BUTTON),
  );
  static final paginationIndicator = find.byKey(
    const ValueKey(LoadedGithubPageKeys.PAGINATION_INDICATOR),
  );

  // EmptyListWidget
  static final emptyListRefreshButton = find.byKey(
    const ValueKey(LoadedGithubPageKeys.EMPTY_LIST_REFRESH_BUTTON),
  );
}
