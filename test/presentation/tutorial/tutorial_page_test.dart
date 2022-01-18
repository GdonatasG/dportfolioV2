import 'package:dportfolio_v2/application/wrapper_bloc/wrapper_bloc.dart';
import 'package:dportfolio_v2/injection.dart';
import 'package:dportfolio_v2/presentation/core/locale_constants.dart';
import 'package:dportfolio_v2/presentation/routes/router.gr.dart';
import 'package:dportfolio_v2/presentation/tutorial/tutorial_page.dart';
import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import '../../utils/general_mocks/mock_auto_router_observer.dart';
import '../../utils/general_mocks/mock_wrapper_bloc.dart';
import 'tutorial_page_finders.dart';

void main() {
  final MockAutoRouterObserver mockNavigatorObserver = MockAutoRouterObserver();
  MockWrapperBloc? mockWrapperBloc;
  late AppRouter router;

  setUpAll(
    () {
      registerFallbackValue(FakeWrapperState());
      registerFallbackValue(FakeRoute());
    },
  );

  Future<void> setUpNeededDependencies() async {
    final getIt = GetIt.instance;

    getIt.registerLazySingleton<WrapperBloc>(() => mockWrapperBloc!);
    getIt.registerLazySingletonAsync<StreamingSharedPreferences>(
      () async => StreamingSharedPreferences.instance,
    );
    await GetIt.I.isReady<StreamingSharedPreferences>();
  }

  void resetInitMocks() {
    reset(mockNavigatorObserver);
    mockWrapperBloc = MockWrapperBloc();
  }

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    router = AppRouter();
    resetInitMocks();
    when(() => mockWrapperBloc!.state)
        .thenAnswer((invocation) => const WrapperState.initial());
    await setUpNeededDependencies();
  });

  tearDown(() async {
    final getIt = GetIt.instance;

    await getIt.reset();
    await mockWrapperBloc!.close();
    router.dispose();
  });

  Future<void> pumpTutorialPage(WidgetTester tester) async {
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<WrapperBloc>(
            create: (BuildContext c) => getIt<WrapperBloc>(),
          ),
        ],
        child: EzLocalizationBuilder(
          delegate: const EzLocalizationDelegate(
            supportedLocales: [
              Locale(LocaleConstants.LANG_EN),
              Locale(LocaleConstants.LANG_LT)
            ],
            locale: Locale(LocaleConstants.LANG_EN),
          ),
          builder: (context, localizationDelegate) => MaterialApp(
            localizationsDelegates: localizationDelegate.localizationDelegates,
            supportedLocales: localizationDelegate.supportedLocales,
            localeResolutionCallback:
                localizationDelegate.localeResolutionCallback,
            home: const TutorialPage(),
          ),
        ),
      ),
    );
  }

  Future<void> pumpTutorialPageRouted(WidgetTester tester) async {
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<WrapperBloc>(
            create: (BuildContext c) => getIt<WrapperBloc>(),
          ),
        ],
        child: EzLocalizationBuilder(
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
                const TutorialPageRoute(),
              ],
              navigatorObservers: () => [
                mockNavigatorObserver,
              ],
            ),
          ),
        ),
      ),
    );
  }

  group(
    '[FooterControls]',
    () {
      group(
        'visibility tests',
        () {
          testWidgets(
            'should show only forward arrow '
            'when [currentPage] of PageView is 0',
            (WidgetTester tester) async {
              await tester.runAsync(
                () async {
                  await pumpTutorialPage(tester);
                  await tester.pumpAndSettle();

                  final PageView pageView = tester.firstWidget(
                    TutorialPageFinders.pageView,
                  );

                  expect(pageView.controller.page, 0);
                  expect(TutorialPageFinders.arrowForward, findsOneWidget);
                  expect(TutorialPageFinders.arrowBack, findsNothing);
                  expect(TutorialPageFinders.done, findsNothing);
                },
              );
            },
            variant: TargetPlatformVariant.mobile(),
          );

          testWidgets(
            'should show forward and back arrows '
            'when [currentPage] of PageView is 1',
            (WidgetTester tester) async {
              await tester.runAsync(
                () async {
                  await pumpTutorialPage(tester);
                  await tester.pumpAndSettle();

                  final PageView pageView = tester.firstWidget(
                    TutorialPageFinders.pageView,
                  );

                  pageView.controller.jumpToPage(1);
                  await tester.pump();

                  expect(pageView.controller.page, 1);
                  expect(TutorialPageFinders.arrowForward, findsOneWidget);
                  expect(TutorialPageFinders.arrowBack, findsOneWidget);
                  expect(TutorialPageFinders.done, findsNothing);
                },
              );
            },
            variant: TargetPlatformVariant.mobile(),
          );

          testWidgets(
            'should show only back arrow and done button '
            'when [currentPage] of PageView is 2 (last page)',
            (WidgetTester tester) async {
              await tester.runAsync(
                () async {
                  await pumpTutorialPage(tester);
                  await tester.pumpAndSettle();

                  final PageView pageView = tester.firstWidget(
                    TutorialPageFinders.pageView,
                  );

                  pageView.controller.jumpToPage(2);
                  await tester.pump();

                  expect(pageView.controller.page, 2);
                  expect(TutorialPageFinders.arrowForward, findsNothing);
                  expect(TutorialPageFinders.arrowBack, findsOneWidget);
                  expect(TutorialPageFinders.done, findsOneWidget);
                },
              );
            },
            variant: TargetPlatformVariant.mobile(),
          );
        },
      );

      group(
        'functionality tests',
        () {
          testWidgets(
            'should increment page of the PageView '
            'when tapping on forward arrow',
            (WidgetTester tester) async {
              await tester.runAsync(
                () async {
                  await pumpTutorialPage(tester);
                  await tester.pumpAndSettle();

                  final PageView pageView = tester.firstWidget(
                    TutorialPageFinders.pageView,
                  );

                  await tester.tap(TutorialPageFinders.arrowForward);
                  await tester.pumpAndSettle();

                  expect(pageView.controller.page, 1);
                },
              );
            },
            variant: TargetPlatformVariant.mobile(),
          );

          testWidgets(
            'should decrement page of the PageView '
            'when tapping on forward arrow',
            (WidgetTester tester) async {
              await tester.runAsync(
                () async {
                  await pumpTutorialPage(tester);
                  await tester.pumpAndSettle();

                  final PageView pageView = tester.firstWidget(
                    TutorialPageFinders.pageView,
                  );

                  pageView.controller.jumpToPage(1);
                  await tester.pump();
                  expect(pageView.controller.page, 1);

                  await tester.tap(TutorialPageFinders.arrowBack);
                  await tester.pumpAndSettle();

                  expect(pageView.controller.page, 0);
                },
              );
            },
            variant: TargetPlatformVariant.mobile(),
          );

          testWidgets(
            'should call tutorial close dialog '
            'when tapping on done button',
            (WidgetTester tester) async {
              await tester.runAsync(
                () async {
                  await pumpTutorialPage(tester);
                  await tester.pumpAndSettle();

                  final PageView pageView = tester.firstWidget(
                    TutorialPageFinders.pageView,
                  );

                  // jumping to the last page to make visible done button
                  pageView.controller.jumpToPage(2);
                  await tester.pump();
                  expect(pageView.controller.page, 2);

                  await tester.tap(TutorialPageFinders.done);
                  await tester.pumpAndSettle();

                  expect(
                    TutorialPageFinders.tutorialCloseDialog,
                    findsOneWidget,
                  );
                },
              );
            },
            variant: TargetPlatformVariant.mobile(),
          );
        },
      );
    },
  );

  group(
    'close tutorial dialog',
    () {
      testWidgets(
        'should close dialog when tapping on dialog close button',
        (WidgetTester tester) async {
          await tester.runAsync(() async {
            await pumpTutorialPage(tester);
            await tester.pumpAndSettle();

            final BuildContext context =
                tester.firstElement(TutorialPageFinders.arrowForward);

            FooterControls.closeTutorialDialog(
              context,
            );
            await tester.pump();

            expect(TutorialPageFinders.tutorialCloseDialog, findsOneWidget);

            await tester.tap(TutorialPageFinders.dialogCancelButton);
            await tester.pump();

            expect(TutorialPageFinders.tutorialCloseDialog, findsNothing);
          });
        },
        variant: TargetPlatformVariant.mobile(),
      );

      testWidgets(
        'should replace route with [AfterTutorialPageRoute] and '
        'add an [WrapperEvent.tutorialCompleted] to [WrapperBloc] '
        'when tapping on close dialog confirm button',
        (WidgetTester tester) async {
          await tester.runAsync(() async {
            await pumpTutorialPageRouted(tester);
            await tester.pumpAndSettle();

            final BuildContext context =
                tester.firstElement(TutorialPageFinders.arrowForward);

            FooterControls.closeTutorialDialog(
              context,
            );
            await tester.pump();

            expect(TutorialPageFinders.tutorialCloseDialog, findsOneWidget);

            await tester.tap(TutorialPageFinders.dialogConfirmButton);
            await tester.pumpAndSettle();

            verify(() => mockNavigatorObserver.didPush(any(), any())).called(
              3,
            ); // 1st [didPush] pushes [TutorialPageRoute] initially,
            // 2nd opens dialog, 3rd pushes [AfterTutorialPageRoute]

            verify(() => mockNavigatorObserver.didRemove(any(), any())).called(
              2,
            ); // 1st [didRemove] for closes opened dialog, 2nd removes [TutorialPageRoute]

            expect(router.current.name, AfterTutorialPageRoute.name);
            expect(find.byType(TutorialPage), findsNothing);
            verify(
              () =>
                  mockWrapperBloc!.add(const WrapperEvent.tutorialCompleted()),
            ).called(1);
          });
        },
        variant: TargetPlatformVariant.mobile(),
      );
    },
  );
}
