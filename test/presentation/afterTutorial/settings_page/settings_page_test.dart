import 'package:dportfolio_v2/presentation/routes/router.gr.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import '../../../utils/general_mocks/mock_auto_router_observer.dart';
import 'settings_page_finders.dart';
import 'settings_page_test_utils.dart';

void main() {
  final MockAutoRouterObserver mockNavigatorObserver = MockAutoRouterObserver();
  late AppRouter router;

  void packageInfoMock({
    required String mockVersion,
  }) {
    const MethodChannel('plugins.flutter.io/package_info')
        .setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'getAll') {
        return <String, dynamic>{
          'appName': 'ABC', // <--- set initial values here
          'packageName': 'A.B.C', // <--- set initial values here
          'version': mockVersion, // <--- set initial values here
          'buildNumber': '' // <--- set initial values here
        };
      }
      return null;
    });
  }

  Future<void> setUpNeededDependencies() async {
    final getIt = GetIt.instance;

    getIt.registerLazySingletonAsync<StreamingSharedPreferences>(
      () async => StreamingSharedPreferences.instance,
    );
    await GetIt.I.isReady<StreamingSharedPreferences>();
  }

  setUpAll(
    () {
      registerFallbackValue(FakeRoute());
    },
  );

  setUp(
    () async {
      router = AppRouter();
      packageInfoMock(mockVersion: '2.0.0');
      await setUpNeededDependencies();
    },
  );

  tearDown(
    () async {
      final getIt = GetIt.instance;
      await getIt.reset();

      reset(mockNavigatorObserver);
      router.dispose();
    },
  );

  testWidgets(
    'should push [ThemePageRoute] to inner router '
    'when tapping on theme selection item',
    (WidgetTester tester) async {
      await tester.runAsync(
        () async {
          await SettingsPageTestUtils.pumpPageRouted(
            tester,
            router,
            mockNavigatorObserver: mockNavigatorObserver,
          );

          reset(mockNavigatorObserver);

          await tester.tap(SettingsPageFinders.itemThemePageFinder);
          await tester.pump();

          verify(() => mockNavigatorObserver.didPush(any(), any())).called(1);
          expect(
            router.innerRouterOf(AfterTutorialPageRoute.name)!.current.name,
            SettingsPageWrapperRouter.name,
          );
          expect(
            router
                .innerRouterOf(AfterTutorialPageRoute.name)!
                .innerRouterOf(SettingsPageWrapperRouter.name)!
                .current
                .name,
            ThemePageRoute.name,
          );
        },
      );
    },
    variant: TargetPlatformVariant.mobile(),
  );

  testWidgets(
    'should push [LanguagePageRoute] to inner router '
    'when tapping on language selection item',
    (WidgetTester tester) async {
      await tester.runAsync(
        () async {
          await SettingsPageTestUtils.pumpPageRouted(
            tester,
            router,
            mockNavigatorObserver: mockNavigatorObserver,
          );

          reset(mockNavigatorObserver);

          await tester.tap(SettingsPageFinders.itemLanguagePageFinder);
          await tester.pump();

          verify(() => mockNavigatorObserver.didPush(any(), any())).called(1);
          expect(
            router.innerRouterOf(AfterTutorialPageRoute.name)!.current.name,
            SettingsPageWrapperRouter.name,
          );
          expect(
            router
                .innerRouterOf(AfterTutorialPageRoute.name)!
                .innerRouterOf(SettingsPageWrapperRouter.name)!
                .current
                .name,
            LanguagePageRoute.name,
          );
        },
      );
    },
    variant: TargetPlatformVariant.mobile(),
  );

  testWidgets(
    'should display correct app version',
    (WidgetTester tester) async {
      await tester.runAsync(
        () async {
          await SettingsPageTestUtils.pumpPageRouted(
            tester,
            router,
          );

          expect(find.textContaining('2.0.0'), findsOneWidget);
        },
      );
    },
    variant: TargetPlatformVariant.mobile(),
  );
}
