import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:dportfolio_v2/presentation/core/locale_keys.dart';
import 'package:ez_localization/src/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({Key? key}) : super(key: key);

  @override
  State<ThemePage> createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  List<Widget> _rebuildChoices(
    BuildContext context,
    AdaptiveThemeMode themeMode,
  ) =>
      [
        RadioListTile(
          title: Text(context.getString(LocaleKeys.LIGHT_THEME)),
          activeColor: Theme.of(context).colorScheme.secondary,
          value: AdaptiveThemeMode.light,
          groupValue: themeMode,
          onChanged: (value) {
            AdaptiveTheme.of(context).setLight();
          },
        ),
        RadioListTile(
          title: Text(context.getString(LocaleKeys.DARK_THEME)),
          activeColor: Theme.of(context).colorScheme.secondary,
          value: AdaptiveThemeMode.dark,
          groupValue: themeMode,
          onChanged: (value) {
            AdaptiveTheme.of(context).setDark();
          },
        ),
        RadioListTile(
          title: Text(context.getString(LocaleKeys.DEVICE_THEME)),
          activeColor: Theme.of(context).colorScheme.secondary,
          value: AdaptiveThemeMode.system,
          groupValue: themeMode,
          onChanged: (value) {
            AdaptiveTheme.of(context).setSystem();
          },
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).primaryColor,
        statusBarIconBrightness:
            Theme.of(context).brightness == Brightness.light
                ? Brightness.dark
                : Brightness.light,
        statusBarBrightness: Theme.of(context).brightness,
      ),
      child: Container(
        color: Theme.of(context).primaryColor,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                context.getString(LocaleKeys.THEME),
              ),
              centerTitle: true,
            ),
            body: ValueListenableBuilder<AdaptiveThemeMode>(
              valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
              builder: (_, mode, child) {
                final List<Widget> widgets = _rebuildChoices(context, mode);
                return ListView.separated(
                  itemBuilder: (ctx, i) => widgets[i],
                  separatorBuilder: (ctx, i) => const Divider(
                    height: 1.0,
                  ),
                  itemCount: widgets.length,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
