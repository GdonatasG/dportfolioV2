import 'package:dportfolio_v2/presentation/core/themes/theme_dark.dart';
import 'package:dportfolio_v2/presentation/core/themes/theme_light.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pref/pref.dart';

import '../themes/theme_constants.dart';

extension ThemeExtension on BuildContext {
  ThemeData get getCurrentTheme => themeLight;
/*{
    final isThemeDark = PrefService.of(this).get(ThemeConstants.IS_THEME_DARK);
    if (isThemeDark == null || !isThemeDark) {
      return themeLight;
    } else {
      return themeDark;
    }
  }*/
}
