import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/widgets/states/loaded/github_search_page/github_search_page_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

mixin GithubSearchPageFinders {
  static final searchTextField =
      find.byKey(const ValueKey(GithubSearchPageKeys.SEARCH_TEXT_FIELD));
  static final searchClearButton =
      find.byKey(const ValueKey(GithubSearchPageKeys.SEARCH_CLEAR_BUTTON));

  // language_selector
  static final languageSelectorButton =
      find.byKey(const ValueKey(GithubSearchPageKeys.LANGUAGE_SELECTOR_BUTTON));
  static final languageSelectorIconSelected = find.byKey(
    const ValueKey(GithubSearchPageKeys.LANGUAGE_SELECTOR_ICON_SELECTED),
  );
  static final languageSelectorIconUnselected = find.byKey(
    const ValueKey(GithubSearchPageKeys.LANGUAGE_SELECTOR_ICON_UNSELECTED),
  );

  static final globalSearchSwitch =
      find.byKey(const ValueKey(GithubSearchPageKeys.GLOBAL_SEARCH_SWITCH));

  // search_error_widget
  static final searchErrorWidgetRetryButton = find.byKey(
    const ValueKey(GithubSearchPageKeys.SEARCH_ERROR_WIDGET_RETRY_BUTTON),
  );

  // loaded_search_widget
  static final reposListView = find.byKey(
    const ValueKey(GithubSearchPageKeys.reposListView),
  );

  // *** surrounded widget for pagination
  // has [paginationIndicator] or [paginateButton] inside
  // depending on state ***
  static final paginateWidget = find.byKey(
    const ValueKey(GithubSearchPageKeys.paginateWidget),
  );
  static final paginateButton = find.byKey(
    const ValueKey(GithubSearchPageKeys.paginateButton),
  );
  static final paginationIndicator = find.byKey(
    const ValueKey(GithubSearchPageKeys.paginationIndicator),
  );
}
