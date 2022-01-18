import 'package:auto_route/auto_route.dart';
import 'package:dportfolio_v2/application/github_bloc/github_bloc.dart';
import 'package:dportfolio_v2/presentation/core/locale_constants.dart';
import 'package:dportfolio_v2/presentation/routes/router.gr.dart';
import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import '../../utils/general_mocks/mock_github_bloc.dart';
import 'after_tutorial_page_finders.dart';

void main() {
  MockGithubBloc? mockGithubBloc;
  late AppRouter router;

  final firstItem = AfterTutorialPageFinders.bottomItemAboutMeIcon;
  final secondItem = AfterTutorialPageFinders.bottomItemPortfolioIcon;
  final thirdItem = AfterTutorialPageFinders.bottomItemContactsIcon;
  final fourthItem = AfterTutorialPageFinders.bottomItemGithubIcon;
  final fifthItem = AfterTutorialPageFinders.bottomItemSettingsIcon;

  Future<void> setUpNeededDependencies() async {
    final getIt = GetIt.instance;

    getIt.registerLazySingleton<GithubBloc>(() => mockGithubBloc!);
    getIt.registerLazySingletonAsync<StreamingSharedPreferences>(
      () async => StreamingSharedPreferences.instance,
    );
    await GetIt.I.isReady<StreamingSharedPreferences>();
  }

  void resetInitBlocs() {
    mockGithubBloc = MockGithubBloc();
  }

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    router = AppRouter();
    resetInitBlocs();
    when(() => mockGithubBloc!.state)
        .thenAnswer((invocation) => const GithubState.initial());
    await setUpNeededDependencies();
  });

  tearDown(() async {
    final getIt = GetIt.instance;
    await getIt.reset();
    await mockGithubBloc!.close();
    router.dispose();
  });

  Future<void> pumpAfterTutorialPage(WidgetTester tester) async {
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
              const AfterTutorialPageRoute(),
            ],
          ),
        ),
      ),
    );
  }

  testWidgets(
    'current index of [BottomNavigationBar] should be 0 initially '
    'and initial route should be [AboutMePageRoute]',
    (WidgetTester tester) async {
      await tester.runAsync(() async {
        await pumpAfterTutorialPage(tester);
        await tester.pumpAndSettle();

        final BottomNavigationBar bottomNavigationBar =
            tester.firstWidget(AfterTutorialPageFinders.bottomNavigationBar);

        expect(bottomNavigationBar.currentIndex, 0);
        expect(
          router
              .innerRouterOf<TabsRouter>(AfterTutorialPageRoute.name)!
              .current
              .name,
          AboutMePageRoute.name,
        );
      });
    },
    variant: TargetPlatformVariant.mobile(),
  );

  testWidgets(
    'current index of [BottomNavigationBar] should be 0 '
    'and current route should be [AboutMePageRoute] '
    'when tapping on the first icon of the bottom navigation bar',
    (WidgetTester tester) async {
      await tester.runAsync(() async {
        await pumpAfterTutorialPage(tester);
        await tester.pumpAndSettle();

        // changing initial current item for testing purposes
        await tester.tap(secondItem);
        await tester.pumpAndSettle();
        BottomNavigationBar bottomNavigationBar =
            tester.firstWidget(AfterTutorialPageFinders.bottomNavigationBar);
        expect(bottomNavigationBar.currentIndex, 1);

        await tester.tap(firstItem);
        await tester.pumpAndSettle();

        bottomNavigationBar =
            tester.firstWidget(AfterTutorialPageFinders.bottomNavigationBar);

        expect(bottomNavigationBar.currentIndex, 0);
        expect(
          router
              .innerRouterOf<TabsRouter>(AfterTutorialPageRoute.name)!
              .current
              .name,
          AboutMePageRoute.name,
        );
      });
    },
    variant: TargetPlatformVariant.mobile(),
  );

  testWidgets(
    'current index of [BottomNavigationBar] should be 1 '
    'and current route should be [PortfolioPageRoute] '
    'when tapping on the second icon of the bottom navigation bar',
    (WidgetTester tester) async {
      await tester.runAsync(() async {
        await pumpAfterTutorialPage(tester);
        await tester.pumpAndSettle();

        await tester.tap(secondItem);
        await tester.pumpAndSettle();

        final BottomNavigationBar bottomNavigationBar =
            tester.firstWidget(AfterTutorialPageFinders.bottomNavigationBar);

        expect(bottomNavigationBar.currentIndex, 1);
        expect(
          router
              .innerRouterOf<TabsRouter>(AfterTutorialPageRoute.name)!
              .current
              .name,
          PortfolioPageRoute.name,
        );
      });
    },
    variant: TargetPlatformVariant.mobile(),
  );

  testWidgets(
    'current index of [BottomNavigationBar] should be 2 '
    'and current route should be [ContactPageRoute] '
    'when tapping on the 3rd icon of the bottom navigation bar',
    (WidgetTester tester) async {
      await tester.runAsync(() async {
        await pumpAfterTutorialPage(tester);
        await tester.pumpAndSettle();

        await tester.tap(thirdItem);
        await tester.pumpAndSettle();

        final BottomNavigationBar bottomNavigationBar =
            tester.firstWidget(AfterTutorialPageFinders.bottomNavigationBar);

        expect(bottomNavigationBar.currentIndex, 2);
        expect(
          router
              .innerRouterOf<TabsRouter>(AfterTutorialPageRoute.name)!
              .current
              .name,
          ContactPageRoute.name,
        );
      });
    },
    variant: TargetPlatformVariant.mobile(),
  );

  testWidgets(
    'current index of [BottomNavigationBar] should be 3 '
    'and current route should be [GithubPageWrapperRouter] '
    'when tapping on the 4th icon of the bottom navigation bar',
    (WidgetTester tester) async {
      await tester.runAsync(() async {
        await pumpAfterTutorialPage(tester);
        await tester.pumpAndSettle();

        await tester.tap(fourthItem);
        await tester.pump(const Duration(milliseconds: 400));
        await tester.pump(const Duration(milliseconds: 400));

        final BottomNavigationBar bottomNavigationBar =
            tester.firstWidget(AfterTutorialPageFinders.bottomNavigationBar);

        expect(bottomNavigationBar.currentIndex, 3);
        expect(
          router
              .innerRouterOf<TabsRouter>(AfterTutorialPageRoute.name)!
              .current
              .name,
          GithubPageWrapperRouter.name,
        );
      });
    },
    variant: TargetPlatformVariant.mobile(),
  );

  testWidgets(
    'current index of [BottomNavigationBar] should be 4 '
    'and current route should be [SettingsPageWrapperRouter] '
    'when tapping on the 5th icon of the bottom navigation bar',
    (WidgetTester tester) async {
      await tester.runAsync(() async {
        await pumpAfterTutorialPage(tester);
        await tester.pumpAndSettle();

        await tester.tap(fifthItem);
        await tester.pump(const Duration(milliseconds: 400));
        await tester.pump(const Duration(milliseconds: 400));

        final BottomNavigationBar bottomNavigationBar =
            tester.firstWidget(AfterTutorialPageFinders.bottomNavigationBar);

        expect(bottomNavigationBar.currentIndex, 4);
        expect(
          router
              .innerRouterOf<TabsRouter>(AfterTutorialPageRoute.name)!
              .current
              .name,
          SettingsPageWrapperRouter.name,
        );
      });
    },
    variant: TargetPlatformVariant.mobile(),
  );
}
