import 'package:preferences/preferences.dart';

import '../../../application/app_data_builder/app_data_export.dart';
import 'package:flutter/material.dart';

import '../../../application/app_data_builder/locale_constants.dart';

/// Contains some useful methods for build contexts.
extension AppDataExtension on BuildContext {
  /// Returns the string associated to the specified key using EzLocalization.
  String getString(String key, [dynamic args]) =>
      AppLocalizations.of(this).get(key, args);
}

extension CurrentLocale on BuildContext {
  Locale get getCurrentLocale =>
      PrefService.getString(LocaleConstants.PREFERENCE_LANGUAGE) != null
          ? Locale(PrefService.getString(LocaleConstants.PREFERENCE_LANGUAGE))
          : Localizations.localeOf(this, nullOk: true);
}
