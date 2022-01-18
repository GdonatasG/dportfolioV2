import 'package:dportfolio_v2/presentation/afterTutorial/widgets/settings_page/widgets/theme_page/theme_page_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

mixin ThemePageFinders {
  static final radioTileThemeLight =
      find.byKey(const ValueKey(ThemePageKeys.radioTileThemeLight));

  static final radioTileThemeDark =
      find.byKey(const ValueKey(ThemePageKeys.radioTileThemeDark));

  static final radioTileThemeSystem =
      find.byKey(const ValueKey(ThemePageKeys.radioTileThemeSystem));

  static final themePage = find.byKey(const ValueKey(ThemePageKeys.themePage));
}
