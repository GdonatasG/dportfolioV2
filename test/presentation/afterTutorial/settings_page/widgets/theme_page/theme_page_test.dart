import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/settings_page/widgets/theme_page/theme_page.dart';
import 'package:dportfolio_v2/presentation/core/locale_constants.dart';
import 'package:dportfolio_v2/presentation/core/themes/theme_dark.dart';
import 'package:dportfolio_v2/presentation/core/themes/theme_light.dart';
import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'theme_page_finders.dart';

void main() {
  Future<void> pumpPage(
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      AdaptiveTheme(
        light: themeLight,
        dark: themeDark,
        initial: AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => EzLocalizationBuilder(
          delegate: const EzLocalizationDelegate(
            supportedLocales: [
              Locale(LocaleConstants.LANG_EN),
              Locale(LocaleConstants.LANG_LT)
            ],
            locale: Locale(LocaleConstants.LANG_EN),
          ),
          builder: (context, localizationDelegate) => MaterialApp(
            localizationsDelegates: localizationDelegate.localizationDelegates,
            supportedLocales: localizationDelegate.supportedLocales,
            localeResolutionCallback:
                localizationDelegate.localeResolutionCallback,
            theme: theme,
            darkTheme: darkTheme,
            home: const ThemePage(),
          ),
        ),
      ),
    );
    await tester.pump();
  }

  testWidgets(
    'light theme radio tile should be checked '
    'and current theme should be light theme '
    'when tapping on radio tile',
    (WidgetTester tester) async {
      await tester.runAsync(
        () async {
          await pumpPage(
            tester,
          );

          final BuildContext context =
              tester.element(ThemePageFinders.themePage);

          AdaptiveTheme.of(context).setDark();
          await tester.pumpAndSettle();
          expect(
            AdaptiveTheme.of(context).mode,
            isNot(AdaptiveThemeMode.light),
          );

          await tester.tap(ThemePageFinders.radioTileThemeLight);
          await tester.pumpAndSettle();

          final RadioListTile lightThemeTile =
              tester.firstWidget(ThemePageFinders.radioTileThemeLight);
          final RadioListTile darkThemeTile =
              tester.firstWidget(ThemePageFinders.radioTileThemeDark);
          final RadioListTile systemThemeTile =
              tester.firstWidget(ThemePageFinders.radioTileThemeSystem);

          expect(lightThemeTile.checked, true);
          expect(darkThemeTile.checked, false);
          expect(systemThemeTile.checked, false);
          expect(
            AdaptiveTheme.of(context).mode,
            AdaptiveThemeMode.light,
          );
          expect(Theme.of(context).brightness, Brightness.light);
          expect(CupertinoTheme.of(context).brightness, Brightness.light);
        },
      );
    },
    variant: TargetPlatformVariant.mobile(),
  );

  testWidgets(
    'dark theme radio tile should be checked '
    'and current theme should be dark theme '
    'when tapping on radio tile',
    (WidgetTester tester) async {
      await tester.runAsync(
        () async {
          await pumpPage(
            tester,
          );

          final BuildContext context =
              tester.element(ThemePageFinders.themePage);

          AdaptiveTheme.of(context).setLight();
          await tester.pumpAndSettle();
          expect(
            AdaptiveTheme.of(context).mode,
            isNot(AdaptiveThemeMode.dark),
          );

          await tester.tap(ThemePageFinders.radioTileThemeDark);
          await tester.pumpAndSettle();

          final RadioListTile lightThemeTile =
              tester.firstWidget(ThemePageFinders.radioTileThemeLight);
          final RadioListTile darkThemeTile =
              tester.firstWidget(ThemePageFinders.radioTileThemeDark);
          final RadioListTile systemThemeTile =
              tester.firstWidget(ThemePageFinders.radioTileThemeSystem);

          expect(lightThemeTile.checked, false);
          expect(darkThemeTile.checked, true);
          expect(systemThemeTile.checked, false);
          expect(
            AdaptiveTheme.of(context).mode,
            AdaptiveThemeMode.dark,
          );
          expect(Theme.of(context).brightness, Brightness.dark);
          expect(CupertinoTheme.of(context).brightness, Brightness.dark);
        },
      );
    },
    variant: TargetPlatformVariant.mobile(),
  );

  testWidgets(
    'system theme radio tile should be checked '
    'and current theme should be light theme '
    'when tapping on radio tile',
    (WidgetTester tester) async {
      await tester.runAsync(
        () async {
          await pumpPage(
            tester,
          );

          final BuildContext context =
              tester.element(ThemePageFinders.themePage);

          AdaptiveTheme.of(context).setLight();
          await tester.pumpAndSettle();
          expect(
            AdaptiveTheme.of(context).mode,
            isNot(AdaptiveThemeMode.system),
          );

          await tester.tap(ThemePageFinders.radioTileThemeSystem);
          await tester.pumpAndSettle();

          final RadioListTile lightThemeTile =
              tester.firstWidget(ThemePageFinders.radioTileThemeLight);
          final RadioListTile darkThemeTile =
              tester.firstWidget(ThemePageFinders.radioTileThemeDark);
          final RadioListTile systemThemeTile =
              tester.firstWidget(ThemePageFinders.radioTileThemeSystem);

          expect(lightThemeTile.checked, false);
          expect(darkThemeTile.checked, false);
          expect(systemThemeTile.checked, true);
          expect(
            AdaptiveTheme.of(context).mode,
            AdaptiveThemeMode.system,
          );
          expect(Theme.of(context).brightness, Brightness.light);
          expect(CupertinoTheme.of(context).brightness, Brightness.light);
        },
      );
    },
    variant: TargetPlatformVariant.mobile(),
  );
}
