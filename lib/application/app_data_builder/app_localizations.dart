import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

/// Callback allowing to get the language path according to the specified locale.
typedef String GetPathFunction(Locale locale);

/// The AppData class.
class AppLocalizations {
  /// The current locale.
  final Locale locale;

  /// The get path function.
  final GetPathFunction getPathFunction;

  /// The string to return if the key is not found.
  final String notFoundString;

  /// The localized strings.
  final Map<String, String> _strings = HashMap();

  /// Creates a new AppData instance.
  AppLocalizations(
      {this.locale = const Locale('en'),
      this.getPathFunction = defaultGetPathFunction,
      this.notFoundString});

  /// Returns the AppLocalizations instance attached to the specified build config.
  static AppLocalizations of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations);

  /// Loads the localized strings.
  Future<bool> load() async {
    try {
      String data = await rootBundle.loadString(getPathFunction(locale));
      Map<String, dynamic> strings = json.decode(data);
      strings.forEach((String key, dynamic data) => _addValues(key, data));
      return true;
    } catch (exception, stacktrace) {
      print(exception);
      print(stacktrace);
    }
    return false;
  }

  /// Returns the string associated to the specified key.
  String get(String key, [dynamic args]) {
    String value = this._strings[key];
    if (value == null) {
      return notFoundString;
    }

    if (args != null) {
      value = _formatReturnValue(value, args);
    }

    return value;
  }

  /// The default get path function.
  static String defaultGetPathFunction(Locale locale) =>
      'assets/languages/${locale.languageCode}.json';

  /// Adds the values to the current map.
  void _addValues(String key, dynamic data) {
    if (data is Map) {
      data.forEach(
          (subKey, subData) => _addValues(key + '.' + subKey, subData));
      return;
    }

    if (data != null) {
      _strings[key] = data.toString();
    }
  }

  /// Formats the return value according to the specified arguments.
  String _formatReturnValue(String value, dynamic arguments) {
    if (arguments is List) {
      for (int i = 0; i < arguments.length; i++) {
        value =
            value.replaceAll('{' + i.toString() + '}', arguments[i].toString());
      }
    } else if (arguments is Map) {
      arguments.forEach((formatKey, formatValue) => value = value.replaceAll(
          '{' + formatKey.toString() + '}', formatValue.toString()));
    }
    return value;
  }
}
