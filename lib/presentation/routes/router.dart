import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/after_tutorial_page.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/about_me_page/about_me_page.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/contact_page/contact_page.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/github_page.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/widgets/states/loaded/github_search_page.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/portfolio_page/portfolio_page.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/settings_page/settings_page.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/settings_page/widgets/language_page.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/settings_page/widgets/theme_page.dart';
import 'package:dportfolio_v2/presentation/core/widgets/custom_webview.dart';
import 'package:dportfolio_v2/presentation/tutorial/tutorial_page.dart';
import 'package:dportfolio_v2/presentation/wrapper/wrapper_page.dart';

@AdaptiveAutoRouter(
  routes: [
    AdaptiveRoute(page: WrapperPage, initial: true),
    AdaptiveRoute(page: TutorialPage),
    AdaptiveRoute(
      page: AfterTutorialPage,
      children: [
        AdaptiveRoute(
          page: AboutMePage,
        ),
        AdaptiveRoute(
          page: PortfolioPage,
        ),
        AdaptiveRoute(
          page: ContactPage,
        ),
        AdaptiveRoute(
            page: EmptyRouterPage,
            name: 'GithubPageWrapperRouter',
            children: [
              AdaptiveRoute(
                path: '',
                page: GithubPage,
              ),
              AdaptiveRoute(
                page: GithubSearchPage,
              ),
            ]),
        AdaptiveRoute(
          page: EmptyRouterPage,
          name: 'SettingsPageWrapperRouter',
          children: [
            AdaptiveRoute(
              path: '',
              page: SettingsPage,
            ),
            AdaptiveRoute(
              page: ThemePage,
              fullscreenDialog: true,
            ),
            AdaptiveRoute(
              page: LanguagePage,
              fullscreenDialog: true,
            ),
          ],
        ),
      ],
    ),
    AdaptiveRoute(page: CustomWebView, fullscreenDialog: true),
  ],
)
class $AppRouter {}
