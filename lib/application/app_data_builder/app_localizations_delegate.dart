import 'dart:async';

import 'app_data_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// The EzLocalization delegate class.
class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  /// Contains all supported locales.
  final List<Locale> supportedLocales;

  /// The get path function.
  final GetPathFunction getPathFunction;

  /// The string to return if the key is not found.
  final String notFoundString;

  /// The locale to force (if specified, not recommended except under special circumstances).
  final Locale locale;

  /// Creates a new app localization delegate instance.
  const AppLocalizationsDelegate(
      {this.supportedLocales = const [Locale('en')],
      this.getPathFunction = AppLocalizations.defaultGetPathFunction,
      this.notFoundString,
      this.locale});

  @override
  bool isSupported(Locale locale) =>
      _isLocaleSupported(supportedLocales, locale) != null;

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations appData = AppLocalizations(
        locale: this.locale ?? locale,
        getPathFunction: getPathFunction,
        notFoundString: notFoundString);

    await appData.load();
    return appData;
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => true;

  /// The default locale resolution callback.
  Locale localeResolutionCallback(
    Locale locale,
    Iterable<Locale> supportedLocales,
  ) {
    if (this.locale != null) {
      return this.locale;
    }

    if (locale == null) {
      return supportedLocales.first;
    }

    return _isLocaleSupported(supportedLocales, locale) ??
        supportedLocales.first;
  }

  /// The localization delegates to add in your application.
  List<LocalizationsDelegate> get localizationDelegates => [
        this,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ];

  /// Returns the locale if it's supported by this localization delegate, null otherwise.
  Locale _isLocaleSupported(List<Locale> supportedLocales, Locale locale) {
    for (Locale supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode ||
          supportedLocale.countryCode == locale.countryCode) {
        return supportedLocale;
      }
    }
    return null;
  }
}
