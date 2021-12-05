import 'package:auto_route/annotations.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/after_tutorial_page.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/settings_page/widgets/language_page.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/settings_page/widgets/theme_page.dart';
import 'package:dportfolio_v2/presentation/core/widgets/custom_webview.dart';
import 'package:dportfolio_v2/presentation/tutorial/tutorial_page.dart';
import 'package:dportfolio_v2/presentation/wrapper/wrapper_page.dart';

@AdaptiveAutoRouter(
  routes: [
    MaterialRoute(page: WrapperPage, initial: true),
    MaterialRoute(page: TutorialPage),
    MaterialRoute(page: AfterTutorialPage),
    MaterialRoute(page: CustomWebView, fullscreenDialog: true),
    MaterialRoute(page: LanguagePage, fullscreenDialog: true),
    MaterialRoute(page: ThemePage, fullscreenDialog: true),
  ],
)
class $AppRouter {}
