import 'package:dportfolio_v2/injection.dart';
import 'package:dportfolio_v2/presentation/core/locale_constants.dart';
import 'package:flutter/material.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

extension CurrentLocale on BuildContext {
  Locale? get getCurrentLocale {
    final language = getIt<StreamingSharedPreferences>()
        .getString(
          LocaleConstants.PREFERENCE_LANGUAGE,
          defaultValue: LocaleConstants.LANG_DEVICE,
        )
        .getValue();

    return language == LocaleConstants.LANG_DEVICE
        ? Localizations.maybeLocaleOf(this)
        : Locale(language);
  }
}
