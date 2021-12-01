import 'package:pref/pref.dart';

import '../../../application/app_data_builder/app_data_export.dart';
import 'package:flutter/material.dart';

import '../../../application/app_data_builder/locale_constants.dart';

/// Contains some useful methods for build contexts.
extension AppDataExtension on BuildContext {
  /// Returns the string associated to the specified key using EzLocalization.
  String? getString(String key, [dynamic args]) =>
      AppLocalizations.of(this)?.get(key, args);
}

extension CurrentLocale on BuildContext {
  Locale get getCurrentLocale => const Locale(LocaleConstants.LANG_EN);
/*PrefService.of(this)
              .get(LocaleConstants.PREFERENCE_LANGUAGE) !=
          null
      ? Locale(PrefService.of(this).get(LocaleConstants.PREFERENCE_LANGUAGE))
      : const Locale(LocaleConstants.LANG_EN);*/
}
