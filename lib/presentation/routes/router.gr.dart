// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i9;
import 'package:dportfolio_v2/presentation/afterTutorial/after_tutorial_page.dart'
    as _i3;
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/about_me_page/about_me_page.dart'
    as _i6;
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/contact_page/contact_page.dart'
    as _i8;
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/github_page.dart'
    as _i10;
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/widgets/states/loaded/github_search_page/github_search_page.dart'
    as _i11;
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/portfolio_page/portfolio_page.dart'
    as _i7;
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/settings_page/settings_page.dart'
    as _i12;
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/settings_page/widgets/language_page/language_page.dart'
    as _i14;
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/settings_page/widgets/theme_page/theme_page.dart'
    as _i13;
import 'package:dportfolio_v2/presentation/core/widgets/custom_webview.dart'
    as _i4;
import 'package:dportfolio_v2/presentation/test_page.dart' as _i5;
import 'package:dportfolio_v2/presentation/tutorial/tutorial_page.dart' as _i2;
import 'package:dportfolio_v2/presentation/wrapper/wrapper_page.dart' as _i1;
import 'package:flutter/material.dart' as _i15;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i15.GlobalKey<_i15.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    WrapperPageRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.WrapperPage());
    },
    TutorialPageRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.TutorialPage());
    },
    AfterTutorialPageRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: _i3.AfterTutorialPage());
    },
    CustomWebViewRoute.name: (routeData) {
      final args = routeData.argsAs<CustomWebViewRouteArgs>();
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i4.CustomWebView(key: args.key, url: args.url),
          fullscreenDialog: true);
    },
    TestPageRoute.name: (routeData) {
      final args = routeData.argsAs<TestPageRouteArgs>();
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i5.TestPage(key: args.key, body: args.body));
    },
    AboutMePageRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: _i6.AboutMePage());
    },
    PortfolioPageRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: _i7.PortfolioPage());
    },
    ContactPageRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: _i8.ContactPage());
    },
    GithubPageWrapperRouter.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i9.EmptyRouterPage());
    },
    SettingsPageWrapperRouter.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i9.EmptyRouterPage());
    },
    GithubPageRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i10.GithubPage());
    },
    GithubSearchPageRoute.name: (routeData) {
      final args = routeData.argsAs<GithubSearchPageRouteArgs>();
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i11.GithubSearchPage(key: args.key, username: args.username));
    },
    SettingsPageRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: _i12.SettingsPage());
    },
    ThemePageRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData,
          child: const _i13.ThemePage(),
          fullscreenDialog: true);
    },
    LanguagePageRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i14.LanguagePage(),
          fullscreenDialog: true);
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(WrapperPageRoute.name, path: '/'),
        _i9.RouteConfig(TutorialPageRoute.name, path: '/tutorial-page'),
        _i9.RouteConfig(AfterTutorialPageRoute.name,
            path: '/after-tutorial-page',
            children: [
              _i9.RouteConfig(AboutMePageRoute.name,
                  path: 'about-me-page', parent: AfterTutorialPageRoute.name),
              _i9.RouteConfig(PortfolioPageRoute.name,
                  path: 'portfolio-page', parent: AfterTutorialPageRoute.name),
              _i9.RouteConfig(ContactPageRoute.name,
                  path: 'contact-page', parent: AfterTutorialPageRoute.name),
              _i9.RouteConfig(GithubPageWrapperRouter.name,
                  path: 'empty-router-page',
                  parent: AfterTutorialPageRoute.name,
                  children: [
                    _i9.RouteConfig(GithubPageRoute.name,
                        path: '', parent: GithubPageWrapperRouter.name),
                    _i9.RouteConfig(GithubSearchPageRoute.name,
                        path: 'github-search-page',
                        parent: GithubPageWrapperRouter.name)
                  ]),
              _i9.RouteConfig(SettingsPageWrapperRouter.name,
                  path: 'empty-router-page',
                  parent: AfterTutorialPageRoute.name,
                  children: [
                    _i9.RouteConfig(SettingsPageRoute.name,
                        path: '', parent: SettingsPageWrapperRouter.name),
                    _i9.RouteConfig(ThemePageRoute.name,
                        path: 'theme-page',
                        parent: SettingsPageWrapperRouter.name),
                    _i9.RouteConfig(LanguagePageRoute.name,
                        path: 'language-page',
                        parent: SettingsPageWrapperRouter.name)
                  ])
            ]),
        _i9.RouteConfig(CustomWebViewRoute.name, path: '/custom-web-view'),
        _i9.RouteConfig(TestPageRoute.name, path: '/test-page')
      ];
}

/// generated route for
/// [_i1.WrapperPage]
class WrapperPageRoute extends _i9.PageRouteInfo<void> {
  const WrapperPageRoute() : super(WrapperPageRoute.name, path: '/');

  static const String name = 'WrapperPageRoute';
}

/// generated route for
/// [_i2.TutorialPage]
class TutorialPageRoute extends _i9.PageRouteInfo<void> {
  const TutorialPageRoute()
      : super(TutorialPageRoute.name, path: '/tutorial-page');

  static const String name = 'TutorialPageRoute';
}

/// generated route for
/// [_i3.AfterTutorialPage]
class AfterTutorialPageRoute extends _i9.PageRouteInfo<void> {
  const AfterTutorialPageRoute({List<_i9.PageRouteInfo>? children})
      : super(AfterTutorialPageRoute.name,
            path: '/after-tutorial-page', initialChildren: children);

  static const String name = 'AfterTutorialPageRoute';
}

/// generated route for
/// [_i4.CustomWebView]
class CustomWebViewRoute extends _i9.PageRouteInfo<CustomWebViewRouteArgs> {
  CustomWebViewRoute({_i15.Key? key, required String url})
      : super(CustomWebViewRoute.name,
            path: '/custom-web-view',
            args: CustomWebViewRouteArgs(key: key, url: url));

  static const String name = 'CustomWebViewRoute';
}

class CustomWebViewRouteArgs {
  const CustomWebViewRouteArgs({this.key, required this.url});

  final _i15.Key? key;

  final String url;

  @override
  String toString() {
    return 'CustomWebViewRouteArgs{key: $key, url: $url}';
  }
}

/// generated route for
/// [_i5.TestPage]
class TestPageRoute extends _i9.PageRouteInfo<TestPageRouteArgs> {
  TestPageRoute({_i15.Key? key, required _i15.Widget body})
      : super(TestPageRoute.name,
            path: '/test-page', args: TestPageRouteArgs(key: key, body: body));

  static const String name = 'TestPageRoute';
}

class TestPageRouteArgs {
  const TestPageRouteArgs({this.key, required this.body});

  final _i15.Key? key;

  final _i15.Widget body;

  @override
  String toString() {
    return 'TestPageRouteArgs{key: $key, body: $body}';
  }
}

/// generated route for
/// [_i6.AboutMePage]
class AboutMePageRoute extends _i9.PageRouteInfo<void> {
  const AboutMePageRoute()
      : super(AboutMePageRoute.name, path: 'about-me-page');

  static const String name = 'AboutMePageRoute';
}

/// generated route for
/// [_i7.PortfolioPage]
class PortfolioPageRoute extends _i9.PageRouteInfo<void> {
  const PortfolioPageRoute()
      : super(PortfolioPageRoute.name, path: 'portfolio-page');

  static const String name = 'PortfolioPageRoute';
}

/// generated route for
/// [_i8.ContactPage]
class ContactPageRoute extends _i9.PageRouteInfo<void> {
  const ContactPageRoute() : super(ContactPageRoute.name, path: 'contact-page');

  static const String name = 'ContactPageRoute';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class GithubPageWrapperRouter extends _i9.PageRouteInfo<void> {
  const GithubPageWrapperRouter({List<_i9.PageRouteInfo>? children})
      : super(GithubPageWrapperRouter.name,
            path: 'empty-router-page', initialChildren: children);

  static const String name = 'GithubPageWrapperRouter';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class SettingsPageWrapperRouter extends _i9.PageRouteInfo<void> {
  const SettingsPageWrapperRouter({List<_i9.PageRouteInfo>? children})
      : super(SettingsPageWrapperRouter.name,
            path: 'empty-router-page', initialChildren: children);

  static const String name = 'SettingsPageWrapperRouter';
}

/// generated route for
/// [_i10.GithubPage]
class GithubPageRoute extends _i9.PageRouteInfo<void> {
  const GithubPageRoute() : super(GithubPageRoute.name, path: '');

  static const String name = 'GithubPageRoute';
}

/// generated route for
/// [_i11.GithubSearchPage]
class GithubSearchPageRoute
    extends _i9.PageRouteInfo<GithubSearchPageRouteArgs> {
  GithubSearchPageRoute({_i15.Key? key, required String username})
      : super(GithubSearchPageRoute.name,
            path: 'github-search-page',
            args: GithubSearchPageRouteArgs(key: key, username: username));

  static const String name = 'GithubSearchPageRoute';
}

class GithubSearchPageRouteArgs {
  const GithubSearchPageRouteArgs({this.key, required this.username});

  final _i15.Key? key;

  final String username;

  @override
  String toString() {
    return 'GithubSearchPageRouteArgs{key: $key, username: $username}';
  }
}

/// generated route for
/// [_i12.SettingsPage]
class SettingsPageRoute extends _i9.PageRouteInfo<void> {
  const SettingsPageRoute() : super(SettingsPageRoute.name, path: '');

  static const String name = 'SettingsPageRoute';
}

/// generated route for
/// [_i13.ThemePage]
class ThemePageRoute extends _i9.PageRouteInfo<void> {
  const ThemePageRoute() : super(ThemePageRoute.name, path: 'theme-page');

  static const String name = 'ThemePageRoute';
}

/// generated route for
/// [_i14.LanguagePage]
class LanguagePageRoute extends _i9.PageRouteInfo<void> {
  const LanguagePageRoute()
      : super(LanguagePageRoute.name, path: 'language-page');

  static const String name = 'LanguagePageRoute';
}
