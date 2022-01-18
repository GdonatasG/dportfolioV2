import 'package:dportfolio_v2/presentation/afterTutorial/widgets/settings_page/settings_page_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

mixin SettingsPageFinders {
  static final itemThemePageFinder =
      find.byKey(const ValueKey(SettingsPageKeys.itemThemePage));

  static final itemLanguagePageFinder =
      find.byKey(const ValueKey(SettingsPageKeys.itemLanguagePage));
}
