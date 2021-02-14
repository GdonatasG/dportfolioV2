import 'package:auto_route/auto_route.dart';
import 'package:dportfolio_v2/application/app_data_builder/app_data_export.dart';
import 'package:dportfolio_v2/application/app_data_builder/locale_constants.dart';
import 'package:dportfolio_v2/application/wrapper_bloc/wrapper_bloc.dart';
import 'package:dportfolio_v2/injection.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/misc/current_bottom_bar_page.dart';
import 'package:dportfolio_v2/presentation/core/global_constants.dart';
import 'package:dportfolio_v2/presentation/core/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:dportfolio_v2/presentation/routes/router.gr.dart' as router;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppDataBuilder(
        delegate: AppLocalizationsDelegate(
          supportedLocales: [
            Locale(LocaleConstants.LANG_EN),
            Locale(LocaleConstants.LANG_LT)
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
              child: MaterialApp(
                localizationsDelegates:
                    localizationDelegate.localizationDelegates,
                supportedLocales: localizationDelegate.supportedLocales,
                localeResolutionCallback:
                    localizationDelegate.localeResolutionCallback,
                debugShowCheckedModeBanner: false,
                title: GlobalConst.APP_NAME,
                theme: theme,
                builder: ExtendedNavigator<router.Router>(
                  router: router.Router(),
                ),
              ),
            ),
          );
        });
  }
}
