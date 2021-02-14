// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../afterTutorial/after_tutorial_page.dart';
import '../afterTutorial/widgets/settings_page/widgets/language_page.dart';
import '../core/widgets/custom_webview.dart';
import '../tutorial/tutorial_page.dart';
import '../wrapper/wrapper_page.dart';

class Routes {
  static const String wrapperPage = '/';
  static const String tutorialPage = '/tutorial-page';
  static const String afterTutorialPage = '/after-tutorial-page';
  static const String customWebView = '/custom-web-view';
  static const String languagePage = '/language-page';
  static const all = <String>{
    wrapperPage,
    tutorialPage,
    afterTutorialPage,
    customWebView,
    languagePage,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.wrapperPage, page: WrapperPage),
    RouteDef(Routes.tutorialPage, page: TutorialPage),
    RouteDef(Routes.afterTutorialPage, page: AfterTutorialPage),
    RouteDef(Routes.customWebView, page: CustomWebView),
    RouteDef(Routes.languagePage, page: LanguagePage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    WrapperPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => WrapperPage(),
        settings: data,
      );
    },
    TutorialPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => TutorialPage(),
        settings: data,
      );
    },
    AfterTutorialPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AfterTutorialPage(),
        settings: data,
      );
    },
    CustomWebView: (data) {
      final args = data.getArgs<CustomWebViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => CustomWebView(
          key: args.key,
          url: args.url,
        ),
        settings: data,
        fullscreenDialog: true,
      );
    },
    LanguagePage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LanguagePage(),
        settings: data,
        fullscreenDialog: true,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension RouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushWrapperPage() => push<dynamic>(Routes.wrapperPage);

  Future<dynamic> pushTutorialPage() => push<dynamic>(Routes.tutorialPage);

  Future<dynamic> pushAfterTutorialPage() =>
      push<dynamic>(Routes.afterTutorialPage);

  Future<dynamic> pushCustomWebView({
    Key key,
    @required String url,
  }) =>
      push<dynamic>(
        Routes.customWebView,
        arguments: CustomWebViewArguments(key: key, url: url),
      );

  Future<dynamic> pushLanguagePage() => push<dynamic>(Routes.languagePage);
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// CustomWebView arguments holder class
class CustomWebViewArguments {
  final Key key;
  final String url;
  CustomWebViewArguments({this.key, @required this.url});
}
