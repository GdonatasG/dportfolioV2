import 'package:bloc_test/bloc_test.dart';
import 'package:dportfolio_v2/application/wrapper_bloc/wrapper_bloc.dart';
import 'package:dportfolio_v2/injection.dart';
import 'package:dportfolio_v2/presentation/core/locale_constants.dart';
import 'package:dportfolio_v2/presentation/routes/router.gr.dart';
import 'package:dportfolio_v2/presentation/wrapper/wrapper_page.dart';
import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import '../../utils/general_mocks/mock_auto_router_observer.dart';
import '../../utils/general_mocks/mock_wrapper_bloc.dart';

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

  Future<void> pumpWrapperPageRouted(WidgetTester tester) async {
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
                const WrapperPageRoute(),
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

  testWidgets(
    'should replace route with [AfterTutorialPageRoute] '
    'when state of the [WrapperBloc] '
    'is [WrapperState.afterTutorial]',
    (WidgetTester tester) async {
      await tester.runAsync(() async {
        whenListen<WrapperState>(
          mockWrapperBloc!,
          Stream.fromIterable(
            [
              const WrapperState.afterTutorial(),
            ],
          ),
        );

        await pumpWrapperPageRouted(tester);
        await tester.pumpAndSettle();

        // replace
        verify(() => mockNavigatorObserver.didPush(any(), any()))
            .called(2); // 1 [didPush] for pushing [WrapperPageRoute] initially
        verify(() => mockNavigatorObserver.didRemove(any(), any())).called(1);

        expect(router.current.name, AfterTutorialPageRoute.name);
        expect(find.byType(WrapperPage), findsNothing);
      });
    },
    variant: TargetPlatformVariant.mobile(),
  );

  testWidgets(
    'should replace route with [TutorialPageRoute] '
    'when state of the [WrapperBloc] '
    'is [WrapperState.tutorial]',
    (WidgetTester tester) async {
      await tester.runAsync(() async {
        whenListen<WrapperState>(
          mockWrapperBloc!,
          Stream.fromIterable(
            [
              const WrapperState.tutorial(),
            ],
          ),
        );

        await pumpWrapperPageRouted(tester);
        await tester.pumpAndSettle();

        // replace
        verify(() => mockNavigatorObserver.didPush(any(), any()))
            .called(2); // 1 [didPush] for pushing [WrapperPageRoute] initially
        verify(() => mockNavigatorObserver.didRemove(any(), any())).called(1);

        expect(router.current.name, TutorialPageRoute.name);
        expect(find.byType(WrapperPage), findsNothing);
      });
    },
    variant: TargetPlatformVariant.mobile(),
  );
}
