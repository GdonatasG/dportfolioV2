import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:chopper/chopper.dart';
import 'package:dportfolio_v2/application/wrapper_bloc/wrapper_bloc.dart';
import 'package:dportfolio_v2/infrastructure/github/github_service.dart';
import 'package:dportfolio_v2/injection.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/misc/current_bottom_bar_page.dart';
import 'package:dportfolio_v2/presentation/core/extensions/app_data_extensions.dart';
import 'package:dportfolio_v2/presentation/core/global_constants.dart';
import 'package:dportfolio_v2/presentation/core/themes/theme_dark.dart';
import 'package:dportfolio_v2/presentation/core/themes/theme_light.dart';
import 'package:dportfolio_v2/presentation/routes/router.gr.dart';
import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'locale_constants.dart';

class AppWidget extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  final _appRouter = AppRouter();

  AppWidget({
    Key? key,
    this.savedThemeMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: themeLight,
      dark: themeDark,
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (c) => getIt<WrapperBloc>()
              ..add(
                const WrapperEvent.tutorialCheckRequest(),
              ),
          ),
        ],
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => getIt<CurrentBottomBarPage>(),
            )
          ],
          child: EzLocalizationBuilder(
            delegate: EzLocalizationDelegate(
              supportedLocales: [
                const Locale(LocaleConstants.LANG_EN),
                const Locale(LocaleConstants.LANG_LT)
              ],
              locale: context.getCurrentLocale,
            ),
            builder: (context, localizationDelegate) => MaterialApp.router(
              localizationsDelegates:
                  localizationDelegate.localizationDelegates,
              supportedLocales: localizationDelegate.supportedLocales,
              localeResolutionCallback:
                  localizationDelegate.localeResolutionCallback,
              debugShowCheckedModeBanner: false,
              title: GlobalConst.APP_NAME,
              theme: theme,
              darkTheme: darkTheme,
              routerDelegate: _appRouter.delegate(),
              routeInformationParser: _appRouter.defaultRouteParser(),
            ),
          ),
        ),
      ),
    );

    /*return AdaptiveTheme(
      light: themeLight,
      dark: themeDark,
      initial: context.getCurrentThemeMode2,
      builder: (theme, darkTheme) => AppDataBuilder(
        delegate: AppLocalizationsDelegate(
          supportedLocales: [
            const Locale(LocaleConstants.LANG_EN),
            const Locale(LocaleConstants.LANG_LT)
          ],
          locale: context.getCurrentLocale,
        ),
        appThemeMode: context.getCurrentThemeMode,
        builder: (context, localizationDelegate, themeMode) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (c) => getIt<WrapperBloc>()
                  ..add(
                    const WrapperEvent.tutorialCheckRequest(),
                  ),
              ),
            ],
            child: MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (_) => getIt<CurrentBottomBarPage>(),
                )
              ],
              child: MaterialApp.router(
                localizationsDelegates:
                    localizationDelegate.localizationDelegates,
                supportedLocales: localizationDelegate.supportedLocales,
                localeResolutionCallback:
                    localizationDelegate.localeResolutionCallback,
                debugShowCheckedModeBanner: false,
                title: GlobalConst.APP_NAME,
                theme: theme,
                darkTheme: darkTheme,
                routerDelegate: _appRouter.delegate(),
                routeInformationParser: _appRouter.defaultRouteParser(),
              ),
            ),
          );
        },
      ),
    );*/
  }
}
