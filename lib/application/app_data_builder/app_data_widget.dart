import 'package:flutter/material.dart';

import 'app_data_export.dart';

class AppDataBuilder extends StatefulWidget {
  /// The delegate builder.
  final AppLocalizationsDelegate delegate;

  /// The widget builder.
  final Widget Function(BuildContext context,
      AppLocalizationsDelegate appDataDelegate, ThemeData theme) builder;

  final ThemeData appTheme;

  const AppDataBuilder(
      {this.delegate = const AppLocalizationsDelegate(),
      @required this.builder,
      this.appTheme});

  @override
  State<StatefulWidget> createState() => AppDataBuilderState();

  /// Allows to change the preferred locale (if using the builder).
  static AppDataBuilderState of(BuildContext context) =>
      context.findAncestorStateOfType<AppDataBuilderState>();
}

class AppDataBuilderState extends State<AppDataBuilder> {
  /// The current EzLocalization delegate.
  AppLocalizationsDelegate _appDataDelegate;
  ThemeData _appTheme;

  @override
  void initState() {
    super.initState();
    _appDataDelegate = widget.delegate;
    _appTheme = widget.appTheme;
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _appDataDelegate, _appTheme);
  }

  // Allows to change the preferred theme
  void changeTheme(ThemeData themeData) {
    if (mounted) {
      setState(() {
        _appTheme = themeData;
      });
    }
  }

  /// Allows to change the preferred locale.
  void changeLocale(Locale locale) {
    if (mounted) {
      setState(() {
        _appDataDelegate = AppLocalizationsDelegate(
          supportedLocales: _appDataDelegate.supportedLocales,
          getPathFunction: _appDataDelegate.getPathFunction,
          notFoundString: _appDataDelegate.notFoundString,
          locale: locale,
        );
      });
    }
  }
}
