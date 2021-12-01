// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:dportfolio_v2/presentation/afterTutorial/after_tutorial_page.dart'
    as _i3;
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/settings_page/widgets/language_page.dart'
    as _i5;
import 'package:dportfolio_v2/presentation/core/widgets/custom_webview.dart'
    as _i4;
import 'package:dportfolio_v2/presentation/tutorial/tutorial_page.dart' as _i2;
import 'package:dportfolio_v2/presentation/wrapper/wrapper_page.dart' as _i1;
import 'package:flutter/material.dart' as _i7;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    WrapperPageRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.WrapperPage());
    },
    TutorialPageRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.TutorialPage());
    },
    AfterTutorialPageRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.AfterTutorialPage());
    },
    CustomWebViewRoute.name: (routeData) {
      final args = routeData.argsAs<CustomWebViewRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.CustomWebView(key: args.key, url: args.url),
          fullscreenDialog: true);
    },
    LanguagePageRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.LanguagePage(),
          fullscreenDialog: true);
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(WrapperPageRoute.name, path: '/'),
        _i6.RouteConfig(TutorialPageRoute.name, path: '/tutorial-page'),
        _i6.RouteConfig(AfterTutorialPageRoute.name,
            path: '/after-tutorial-page'),
        _i6.RouteConfig(CustomWebViewRoute.name, path: '/custom-web-view'),
        _i6.RouteConfig(LanguagePageRoute.name, path: '/language-page')
      ];
}

/// generated route for [_i1.WrapperPage]
class WrapperPageRoute extends _i6.PageRouteInfo<void> {
  const WrapperPageRoute() : super(name, path: '/');

  static const String name = 'WrapperPageRoute';
}

/// generated route for [_i2.TutorialPage]
class TutorialPageRoute extends _i6.PageRouteInfo<void> {
  const TutorialPageRoute() : super(name, path: '/tutorial-page');

  static const String name = 'TutorialPageRoute';
}

/// generated route for [_i3.AfterTutorialPage]
class AfterTutorialPageRoute extends _i6.PageRouteInfo<void> {
  const AfterTutorialPageRoute() : super(name, path: '/after-tutorial-page');

  static const String name = 'AfterTutorialPageRoute';
}

/// generated route for [_i4.CustomWebView]
class CustomWebViewRoute extends _i6.PageRouteInfo<CustomWebViewRouteArgs> {
  CustomWebViewRoute({_i7.Key? key, required String url})
      : super(name,
            path: '/custom-web-view',
            args: CustomWebViewRouteArgs(key: key, url: url));

  static const String name = 'CustomWebViewRoute';
}

class CustomWebViewRouteArgs {
  const CustomWebViewRouteArgs({this.key, required this.url});

  final _i7.Key? key;

  final String url;
}

/// generated route for [_i5.LanguagePage]
class LanguagePageRoute extends _i6.PageRouteInfo<void> {
  const LanguagePageRoute() : super(name, path: '/language-page');

  static const String name = 'LanguagePageRoute';
}
