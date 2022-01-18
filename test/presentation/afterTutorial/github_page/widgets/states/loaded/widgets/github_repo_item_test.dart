import 'package:dportfolio_v2/domain/github/github_repo.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/widgets/states/loaded/widgets/github_repo_item.dart';
import 'package:dportfolio_v2/presentation/core/locale_constants.dart';
import 'package:dportfolio_v2/presentation/core/widgets/custom_webview.dart';
import 'package:dportfolio_v2/presentation/routes/router.gr.dart';
import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../../utils/general_mocks/mock_auto_router_observer.dart';

void main() {
  final MockAutoRouterObserver mockNavigatorObserver = MockAutoRouterObserver();
  const testRepo = GithubRepo(
    name: 'testName',
    html_url: 'testUrl',
    language: 'testLanguage',
  );
  late AppRouter router;

  Future<void> pumpItem(WidgetTester tester) async {
    await tester.pumpWidget(
      EzLocalizationBuilder(
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
          routeInformationParser: router.defaultRouteParser(),
          routerDelegate: router.delegate(
            initialRoutes: [
              TestPageRoute(
                body: const Scaffold(
                  body: GithubRepoItem(
                    repo: testRepo,
                  ),
                ),
              ),
            ],
            navigatorObservers: () => [
              mockNavigatorObserver,
            ],
          ),
        ),
      ),
    );
  }

  setUpAll(
    () {
      registerFallbackValue(FakeRoute());
    },
  );

  setUp(
    () {
      router = AppRouter();
    },
  );

  tearDown(
    () {
      reset(mockNavigatorObserver);
      router.dispose();
    },
  );

  testWidgets(
    'should push [CustomWebViewRoute] to root router '
    'when tapping on item',
    (WidgetTester tester) async {
      await tester.runAsync(
        () async {
          await pumpItem(tester);
          await tester.pumpAndSettle();

          await tester.tap(find.byType(GithubRepoItem));
          await tester.pumpAndSettle();

          verify(() => mockNavigatorObserver.didPush(any(), any())).called(
            2,
          ); // 1st [didPush] pushes initial route, 2nd pushes [CustomWebViewRoute]

          expect(router.root.current.name, CustomWebViewRoute.name);
          expect(
            find.byWidgetPredicate(
              (widget) =>
                  widget is CustomWebView && widget.url == testRepo.html_url,
            ),
            findsOneWidget,
          );
        },
      );
    },
    variant: TargetPlatformVariant.mobile(),
  );
}
