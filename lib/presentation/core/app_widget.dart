import 'package:dportfolio_v2/application/app_data_builder/app_data_export.dart';
import 'package:dportfolio_v2/application/app_data_builder/locale_constants.dart';
import 'package:dportfolio_v2/application/wrapper_bloc/wrapper_bloc.dart';
import 'package:dportfolio_v2/injection.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/misc/current_bottom_bar_page.dart';
import 'package:dportfolio_v2/presentation/core/extensions/theme_extensions.dart';
import 'package:dportfolio_v2/presentation/core/global_constants.dart';
import 'package:dportfolio_v2/presentation/core/themes/theme_dark.dart';
import 'package:dportfolio_v2/presentation/core/themes/theme_light.dart';
import 'package:dportfolio_v2/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return AppDataBuilder(
        delegate: AppLocalizationsDelegate(
          supportedLocales: [
            const Locale(LocaleConstants.LANG_EN),
            const Locale(LocaleConstants.LANG_LT)
          ],
          locale: context.getCurrentLocale,
        ),
        appTheme: context.getCurrentTheme,
        builder: (context, localizationDelegate, theme) {
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
                theme: themeLight,
                darkTheme: themeDark,
                routerDelegate: _appRouter.delegate(),
                routeInformationParser: _appRouter.defaultRouteParser(),
              ),
            ),
          );
        });
  }
}
