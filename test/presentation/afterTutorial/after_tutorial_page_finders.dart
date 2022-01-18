import 'package:dportfolio_v2/presentation/afterTutorial/after_tutorial_page_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

mixin AfterTutorialPageFinders {
  static final bottomNavigationBar = find.byKey(
    const ValueKey(AfterTutorialPageKeys.BOTTOM_NAVIGATION_BAR),
  );

  static final bottomItemAboutMeIcon = find.byKey(
    const ValueKey(AfterTutorialPageKeys.BOTTOM_ITEM_ABOUT_ME_ICON),
  );
  static final bottomItemPortfolioIcon = find.byKey(
    const ValueKey(AfterTutorialPageKeys.BOTTOM_ITEM_PORTFOLIO_ICON),
  );
  static final bottomItemContactsIcon = find.byKey(
    const ValueKey(AfterTutorialPageKeys.BOTTOM_ITEM_CONTACTS_ICON),
  );
  static final bottomItemGithubIcon = find.byKey(
    const ValueKey(AfterTutorialPageKeys.BOTTOM_ITEM_GITHUB_ICON),
  );
  static final bottomItemSettingsIcon = find.byKey(
    const ValueKey(AfterTutorialPageKeys.BOTTOM_ITEM_SETTINGS_ICON),
  );
}
