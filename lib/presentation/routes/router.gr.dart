// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:dportfolio_v2/presentation/afterTutorial/after_tutorial_page.dart'
    as _i3;
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/about_me_page/about_me_page.dart'
    as _i5;
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/contact_page/contact_page.dart'
    as _i7;
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/github_page.dart'
    as _i9;
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/widgets/states/loaded/github_search_page.dart'
    as _i10;
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/portfolio_page/portfolio_page.dart'
    as _i6;
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/settings_page/settings_page.dart'
    as _i11;
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/settings_page/widgets/language_page.dart'
    as _i13;
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/settings_page/widgets/theme_page.dart'
    as _i12;
import 'package:dportfolio_v2/presentation/core/widgets/custom_webview.dart'
    as _i4;
import 'package:dportfolio_v2/presentation/tutorial/tutorial_page.dart' as _i2;
import 'package:dportfolio_v2/presentation/wrapper/wrapper_page.dart' as _i1;
import 'package:flutter/cupertino.dart' as _i15;
import 'package:flutter/material.dart' as _i14;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i14.GlobalKey<_i14.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    WrapperPageRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: _i1.WrapperPage());
    },
    TutorialPageRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: _i2.TutorialPage());
    },
    AfterTutorialPageRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: _i3.AfterTutorialPage());
    },
    CustomWebViewRoute.name: (routeData) {
      final args = routeData.argsAs<CustomWebViewRouteArgs>();
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i4.CustomWebView(key: args.key, url: args.url),
          fullscreenDialog: true);
    },
    AboutMePageRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: _i5.AboutMePage());
    },
    PortfolioPageRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: _i6.PortfolioPage());
    },
    ContactPageRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: _i7.ContactPage());
    },
    GithubPageWrapperRouter.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i8.EmptyRouterPage());
    },
    SettingsPageWrapperRouter.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i8.EmptyRouterPage());
    },
    GithubPageRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i9.GithubPage());
    },
    GithubSearchPageRoute.name: (routeData) {
      final args = routeData.argsAs<GithubSearchPageRouteArgs>();
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i10.GithubSearchPage(key: args.key, username: args.username));
    },
    SettingsPageRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: _i11.SettingsPage());
    },
    ThemePageRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData,
          child: const _i12.ThemePage(),
          fullscreenDialog: true);
    },
    LanguagePageRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i13.LanguagePage(),
          fullscreenDialog: true);
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(WrapperPageRoute.name, path: '/'),
        _i8.RouteConfig(TutorialPageRoute.name, path: '/tutorial-page'),
        _i8.RouteConfig(AfterTutorialPageRoute.name,
            path: '/after-tutorial-page',
            children: [
              _i8.RouteConfig(AboutMePageRoute.name,
                  path: 'about-me-page', parent: AfterTutorialPageRoute.name),
              _i8.RouteConfig(PortfolioPageRoute.name,
                  path: 'portfolio-page', parent: AfterTutorialPageRoute.name),
              _i8.RouteConfig(ContactPageRoute.name,
                  path: 'contact-page', parent: AfterTutorialPageRoute.name),
              _i8.RouteConfig(GithubPageWrapperRouter.name,
                  path: 'empty-router-page',
                  parent: AfterTutorialPageRoute.name,
                  children: [
                    _i8.RouteConfig(GithubPageRoute.name,
                        path: '', parent: GithubPageWrapperRouter.name),
                    _i8.RouteConfig(GithubSearchPageRoute.name,
                        path: 'github-search-page',
                        parent: GithubPageWrapperRouter.name)
                  ]),
              _i8.RouteConfig(SettingsPageWrapperRouter.name,
                  path: 'empty-router-page',
                  parent: AfterTutorialPageRoute.name,
                  children: [
                    _i8.RouteConfig(SettingsPageRoute.name,
                        path: '', parent: SettingsPageWrapperRouter.name),
                    _i8.RouteConfig(ThemePageRoute.name,
                        path: 'theme-page',
                        parent: SettingsPageWrapperRouter.name),
                    _i8.RouteConfig(LanguagePageRoute.name,
                        path: 'language-page',
                        parent: SettingsPageWrapperRouter.name)
                  ])
            ]),
        _i8.RouteConfig(CustomWebViewRoute.name, path: '/custom-web-view')
      ];
}

/// generated route for
/// [_i1.WrapperPage]
class WrapperPageRoute extends _i8.PageRouteInfo<void> {
  const WrapperPageRoute() : super(WrapperPageRoute.name, path: '/');

  static const String name = 'WrapperPageRoute';
}

/// generated route for
/// [_i2.TutorialPage]
class TutorialPageRoute extends _i8.PageRouteInfo<void> {
  const TutorialPageRoute()
      : super(TutorialPageRoute.name, path: '/tutorial-page');

  static const String name = 'TutorialPageRoute';
}

/// generated route for
/// [_i3.AfterTutorialPage]
class AfterTutorialPageRoute extends _i8.PageRouteInfo<void> {
  const AfterTutorialPageRoute({List<_i8.PageRouteInfo>? children})
      : super(AfterTutorialPageRoute.name,
            path: '/after-tutorial-page', initialChildren: children);

  static const String name = 'AfterTutorialPageRoute';
}

/// generated route for
/// [_i4.CustomWebView]
class CustomWebViewRoute extends _i8.PageRouteInfo<CustomWebViewRouteArgs> {
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
/// [_i5.AboutMePage]
class AboutMePageRoute extends _i8.PageRouteInfo<void> {
  const AboutMePageRoute()
      : super(AboutMePageRoute.name, path: 'about-me-page');

  static const String name = 'AboutMePageRoute';
}

/// generated route for
/// [_i6.PortfolioPage]
class PortfolioPageRoute extends _i8.PageRouteInfo<void> {
  const PortfolioPageRoute()
      : super(PortfolioPageRoute.name, path: 'portfolio-page');

  static const String name = 'PortfolioPageRoute';
}

/// generated route for
/// [_i7.ContactPage]
class ContactPageRoute extends _i8.PageRouteInfo<void> {
  const ContactPageRoute() : super(ContactPageRoute.name, path: 'contact-page');

  static const String name = 'ContactPageRoute';
}

/// generated route for
/// [_i8.EmptyRouterPage]
class GithubPageWrapperRouter extends _i8.PageRouteInfo<void> {
  const GithubPageWrapperRouter({List<_i8.PageRouteInfo>? children})
      : super(GithubPageWrapperRouter.name,
            path: 'empty-router-page', initialChildren: children);

  static const String name = 'GithubPageWrapperRouter';
}

/// generated route for
/// [_i8.EmptyRouterPage]
class SettingsPageWrapperRouter extends _i8.PageRouteInfo<void> {
  const SettingsPageWrapperRouter({List<_i8.PageRouteInfo>? children})
      : super(SettingsPageWrapperRouter.name,
            path: 'empty-router-page', initialChildren: children);

  static const String name = 'SettingsPageWrapperRouter';
}

/// generated route for
/// [_i9.GithubPage]
class GithubPageRoute extends _i8.PageRouteInfo<void> {
  const GithubPageRoute() : super(GithubPageRoute.name, path: '');

  static const String name = 'GithubPageRoute';
}

/// generated route for
/// [_i10.GithubSearchPage]
class GithubSearchPageRoute
    extends _i8.PageRouteInfo<GithubSearchPageRouteArgs> {
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
/// [_i11.SettingsPage]
class SettingsPageRoute extends _i8.PageRouteInfo<void> {
  const SettingsPageRoute() : super(SettingsPageRoute.name, path: '');

  static const String name = 'SettingsPageRoute';
}

/// generated route for
/// [_i12.ThemePage]
class ThemePageRoute extends _i8.PageRouteInfo<void> {
  const ThemePageRoute() : super(ThemePageRoute.name, path: 'theme-page');

  static const String name = 'ThemePageRoute';
}

/// generated route for
/// [_i13.LanguagePage]
class LanguagePageRoute extends _i8.PageRouteInfo<void> {
  const LanguagePageRoute()
      : super(LanguagePageRoute.name, path: 'language-page');

  static const String name = 'LanguagePageRoute';
}
