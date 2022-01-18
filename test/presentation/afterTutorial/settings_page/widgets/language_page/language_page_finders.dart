import 'package:dportfolio_v2/presentation/afterTutorial/widgets/settings_page/widgets/language_page/language_page_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

mixin LanguagePageFinders {
  static final radioTileLanguageEn =
      find.byKey(const ValueKey(LanguagePageKeys.radioTileLanguageEn));
  static final radioTileLanguageLt =
      find.byKey(const ValueKey(LanguagePageKeys.radioTileLanguageLt));
  static final radioTileLanguageDevice =
      find.byKey(const ValueKey(LanguagePageKeys.radioTileLanguageDevice));
}
