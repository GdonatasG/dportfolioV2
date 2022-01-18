import 'dart:convert';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:dportfolio_v2/application/wrapper_bloc/wrapper_bloc.dart';
import 'package:dportfolio_v2/injection.dart';
import 'package:dportfolio_v2/presentation/core/app_widget.dart';
import 'package:dportfolio_v2/presentation/core/locale_constants.dart';
import 'package:dportfolio_v2/presentation/routes/router.gr.dart';
import 'package:dportfolio_v2/presentation/wrapper/wrapper_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import '../../utils/general_mocks/mock_wrapper_bloc.dart';

void main() {
  MockWrapperBloc? mockWrapperBloc;

  setUpAll(
    () {
      registerFallbackValue(FakeWrapperState());
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

  void resetInitBlocs() {
    mockWrapperBloc = MockWrapperBloc();
  }

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    resetInitBlocs();
    when(() => mockWrapperBloc!.state)
        .thenAnswer((invocation) => const WrapperState.initial());
    await setUpNeededDependencies();
  });

  tearDown(() async {
    final getIt = GetIt.instance;

    await getIt.reset();
    await mockWrapperBloc!.close();
  });

  testWidgets(
    'current page of the router should be [WrapperPage] '
    'when initially calling [AppWidget]',
    (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(AppWidget());
        await tester.pumpAndSettle();

        final BuildContext context = tester.element(find.byType(WrapperPage));

        expect(context.router.current.name, WrapperPageRoute.name);
        expect(find.byType(WrapperPage), findsOneWidget);
      });
    },
    variant: TargetPlatformVariant.mobile(),
  );

  testWidgets(
    '[WrapperBloc] should call an event [const WrapperEvent.tutorialCheckRequest] '
    'when initially calling [AppWidget]',
    (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(AppWidget());
        await tester.pumpAndSettle();

        verify(
          () => mockWrapperBloc!.add(const WrapperEvent.tutorialCheckRequest()),
        ).called(1);
      });
    },
    variant: TargetPlatformVariant.mobile(),
  );

  group(
    'theme_mode',
    () {
      testWidgets(
        'should set theme mode to light initially '
        'when theme mode is not saved in SharedPreferences',
        (WidgetTester tester) async {
          await tester.runAsync(
            () async {
              SharedPreferences.setMockInitialValues({});

              await tester.pumpWidget(AppWidget());
              await tester.pump();

              final BuildContext context =
                  tester.element(find.byType(MaterialApp));

              expect(AdaptiveTheme.of(context).mode, AdaptiveThemeMode.light);
            },
          );
        },
        variant: TargetPlatformVariant.mobile(),
      );

      testWidgets(
        'should set theme mode to light initially '
        'when light theme mode is saved in SharedPreferences',
        (WidgetTester tester) async {
          await tester.runAsync(
            () async {
              final initialData = {
                'theme_mode': AdaptiveThemeMode.light.index,
                'default_theme_mode': AdaptiveThemeMode.system.index,
              };
              SharedPreferences.setMockInitialValues(
                {
                  AdaptiveTheme.prefKey: json.encode(initialData),
                },
              );

              await tester.pumpWidget(AppWidget());
              await tester.pump();

              final BuildContext context =
                  tester.element(find.byType(MaterialApp));

              expect(AdaptiveTheme.of(context).mode, AdaptiveThemeMode.light);
            },
          );
        },
        variant: TargetPlatformVariant.mobile(),
      );

      testWidgets(
        'should set theme mode to dark initially '
        'when dark theme mode is saved in SharedPreferences',
        (WidgetTester tester) async {
          await tester.runAsync(
            () async {
              final initialData = {
                'theme_mode': AdaptiveThemeMode.dark.index,
                'default_theme_mode': AdaptiveThemeMode.system.index,
              };
              SharedPreferences.setMockInitialValues(
                {
                  AdaptiveTheme.prefKey: json.encode(initialData),
                },
              );

              await tester.pumpWidget(AppWidget());
              await tester.pump();

              final BuildContext context =
                  tester.element(find.byType(MaterialApp));

              expect(AdaptiveTheme.of(context).mode, AdaptiveThemeMode.dark);
            },
          );
        },
        variant: TargetPlatformVariant.mobile(),
      );

      testWidgets(
        'should set theme mode to system initially '
        'when system theme mode is saved in SharedPreferences',
        (WidgetTester tester) async {
          await tester.runAsync(
            () async {
              final initialData = {
                'theme_mode': AdaptiveThemeMode.system.index,
                'default_theme_mode': AdaptiveThemeMode.system.index,
              };
              SharedPreferences.setMockInitialValues(
                {
                  AdaptiveTheme.prefKey: json.encode(initialData),
                },
              );

              await tester.pumpWidget(AppWidget());
              await tester.pump();

              final BuildContext context =
                  tester.element(find.byType(MaterialApp));

              expect(AdaptiveTheme.of(context).mode, AdaptiveThemeMode.system);
            },
          );
        },
        variant: TargetPlatformVariant.mobile(),
      );
    },
  );

  group(
    'locale',
    () {
      testWidgets(
        'current language should be [en] '
        'when [en] language is saved in StreamingSharedPreferences',
        (WidgetTester tester) async {
          await tester.runAsync(
            () async {
              await getIt<StreamingSharedPreferences>().setString(
                LocaleConstants.PREFERENCE_LANGUAGE,
                LocaleConstants.LANG_EN,
              );

              await tester.pumpWidget(AppWidget());
              await tester.pumpAndSettle();

              final BuildContext context = tester.element(
                find.byType(WrapperPage),
              );

              expect(
                Localizations.localeOf(context),
                const Locale(LocaleConstants.LANG_EN),
              );
            },
          );
        },
        variant: TargetPlatformVariant.mobile(),
      );

      testWidgets(
        'current language should be [lt] '
        'when [lt] language is saved in StreamingSharedPreferences',
        (WidgetTester tester) async {
          await tester.runAsync(
            () async {
              await getIt<StreamingSharedPreferences>().setString(
                LocaleConstants.PREFERENCE_LANGUAGE,
                LocaleConstants.LANG_LT,
              );

              await tester.pumpWidget(AppWidget());
              await tester.pumpAndSettle();

              final BuildContext context = tester.element(
                find.byType(WrapperPage),
              );

              expect(
                Localizations.localeOf(context),
                const Locale(LocaleConstants.LANG_LT),
              );
            },
          );
        },
        variant: TargetPlatformVariant.mobile(),
      );

      testWidgets(
        'current language should be [en] '
        'when [device] language is saved in StreamingSharedPreferences',
        (WidgetTester tester) async {
          await tester.runAsync(
            () async {
              await getIt<StreamingSharedPreferences>().setString(
                LocaleConstants.PREFERENCE_LANGUAGE,
                LocaleConstants.LANG_DEVICE,
              );

              await tester.pumpWidget(AppWidget());
              await tester.pumpAndSettle();

              final BuildContext context = tester.element(
                find.byType(WrapperPage),
              );

              expect(
                Localizations.localeOf(context),
                const Locale(LocaleConstants.LANG_EN),
              );
            },
          );
        },
        variant: TargetPlatformVariant.mobile(),
      );

      testWidgets(
        'current language should be [en] '
        'when language is NOT saved in StreamingSharedPreferences',
        (WidgetTester tester) async {
          await tester.runAsync(
            () async {
              await getIt<StreamingSharedPreferences>().clear();

              await tester.pumpWidget(AppWidget());
              await tester.pumpAndSettle();

              final BuildContext context = tester.element(
                find.byType(WrapperPage),
              );

              expect(
                Localizations.localeOf(context),
                const Locale(LocaleConstants.LANG_EN),
              );
            },
          );
        },
        variant: TargetPlatformVariant.mobile(),
      );
    },
  );
}
