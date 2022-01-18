import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/settings_page/settings_page.dart';
import 'package:dportfolio_v2/presentation/core/locale_constants.dart';
import 'package:dportfolio_v2/presentation/core/themes/theme_dark.dart';
import 'package:dportfolio_v2/presentation/core/themes/theme_light.dart';
import 'package:dportfolio_v2/presentation/routes/router.gr.dart';
import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/general_mocks/mock_auto_router_observer.dart';

mixin SettingsPageTestUtils {
  static Future<void> pumpPageRouted(
    WidgetTester tester,
    AppRouter router, {
    MockAutoRouterObserver? mockNavigatorObserver,
  }) async {
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
          builder: (context, localizationDelegate) => MaterialApp.router(
            localizationsDelegates: localizationDelegate.localizationDelegates,
            supportedLocales: localizationDelegate.supportedLocales,
            localeResolutionCallback:
                localizationDelegate.localeResolutionCallback,
            theme: theme,
            darkTheme: darkTheme,
            routeInformationParser: router.defaultRouteParser(),
            routerDelegate: router.delegate(
              initialRoutes: [
                const AfterTutorialPageRoute(),
              ],
              navigatorObservers: () => mockNavigatorObserver != null
                  ? [
                      mockNavigatorObserver,
                    ]
                  : [],
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    router.navigate(const SettingsPageWrapperRouter());
    await tester.pumpAndSettle();

    expect(find.byType(SettingsPage), findsOneWidget);
  }
}
