import 'package:dportfolio_v2/injection.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/settings_page/widgets/language_page/language_page.dart';
import 'package:dportfolio_v2/presentation/core/locale_constants.dart';
import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import 'language_page_finders.dart';

void main() {
  Future<void> pumpPage(
    WidgetTester tester, {
    Locale initialLocale = const Locale(LocaleConstants.LANG_EN),
  }) async {
    await tester.pumpWidget(
      EzLocalizationBuilder(
        delegate: EzLocalizationDelegate(
          supportedLocales: [
            const Locale(LocaleConstants.LANG_EN),
            const Locale(LocaleConstants.LANG_LT)
          ],
          locale: initialLocale,
        ),
        builder: (context, localizationDelegate) => MaterialApp(
          localizationsDelegates: localizationDelegate.localizationDelegates,
          supportedLocales: localizationDelegate.supportedLocales,
          localeResolutionCallback:
              localizationDelegate.localeResolutionCallback,
          home: LanguagePage(),
        ),
      ),
    );
    await tester.pump();
  }

  Future<void> setUpNeededDependencies() async {
    final getIt = GetIt.instance;

    getIt.registerLazySingletonAsync<StreamingSharedPreferences>(
      () async => StreamingSharedPreferences.instance,
    );
    await GetIt.I.isReady<StreamingSharedPreferences>();
  }

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await setUpNeededDependencies();
  });

  tearDown(() async {
    final getIt = GetIt.instance;

    await getIt.reset();
  });

  testWidgets(
    '[en] language radio tile should be checked '
    'when [en] language is saved into StreamingSharedPreferences',
    (WidgetTester tester) async {
      await tester.runAsync(
        () async {
          await getIt<StreamingSharedPreferences>().setString(
            LocaleConstants.PREFERENCE_LANGUAGE,
            LocaleConstants.LANG_EN,
          );

          await pumpPage(tester);

          final RadioListTile radioTileLanguageEn =
              tester.firstWidget(LanguagePageFinders.radioTileLanguageEn);
          final RadioListTile radioTileLanguageLt =
              tester.firstWidget(LanguagePageFinders.radioTileLanguageLt);
          final RadioListTile radioTileLanguageDevice =
              tester.firstWidget(LanguagePageFinders.radioTileLanguageDevice);

          expect(radioTileLanguageEn.checked, true);
          expect(radioTileLanguageLt.checked, false);
          expect(radioTileLanguageDevice.checked, false);
        },
      );
    },
    variant: TargetPlatformVariant.mobile(),
  );

  testWidgets(
    '[lt] language radio tile should be checked '
    'when [lt] language is saved into StreamingSharedPreferences',
    (WidgetTester tester) async {
      await tester.runAsync(
        () async {
          await getIt<StreamingSharedPreferences>().setString(
            LocaleConstants.PREFERENCE_LANGUAGE,
            LocaleConstants.LANG_LT,
          );

          await pumpPage(tester);

          final RadioListTile radioTileLanguageEn =
              tester.firstWidget(LanguagePageFinders.radioTileLanguageEn);
          final RadioListTile radioTileLanguageLt =
              tester.firstWidget(LanguagePageFinders.radioTileLanguageLt);
          final RadioListTile radioTileLanguageDevice =
              tester.firstWidget(LanguagePageFinders.radioTileLanguageDevice);

          expect(radioTileLanguageEn.checked, false);
          expect(radioTileLanguageLt.checked, true);
          expect(radioTileLanguageDevice.checked, false);
        },
      );
    },
    variant: TargetPlatformVariant.mobile(),
  );

  testWidgets(
    '[device] language radio tile should be checked '
    'when language is not saved into StreamingSharedPreferences',
    (WidgetTester tester) async {
      await tester.runAsync(
        () async {
          await getIt<StreamingSharedPreferences>().clear();

          await pumpPage(tester);

          final RadioListTile radioTileLanguageEn =
              tester.firstWidget(LanguagePageFinders.radioTileLanguageEn);
          final RadioListTile radioTileLanguageLt =
              tester.firstWidget(LanguagePageFinders.radioTileLanguageLt);
          final RadioListTile radioTileLanguageDevice =
              tester.firstWidget(LanguagePageFinders.radioTileLanguageDevice);

          expect(radioTileLanguageEn.checked, false);
          expect(radioTileLanguageLt.checked, false);
          expect(radioTileLanguageDevice.checked, true);
        },
      );
    },
    variant: TargetPlatformVariant.mobile(),
  );

  testWidgets(
    'device language radio tile should be checked '
    'when [device] language is saved into StreamingSharedPreferences',
    (WidgetTester tester) async {
      await tester.runAsync(
        () async {
          await getIt<StreamingSharedPreferences>().setString(
            LocaleConstants.PREFERENCE_LANGUAGE,
            LocaleConstants.LANG_DEVICE,
          );

          await pumpPage(tester);

          final RadioListTile radioTileLanguageEn =
              tester.firstWidget(LanguagePageFinders.radioTileLanguageEn);
          final RadioListTile radioTileLanguageLt =
              tester.firstWidget(LanguagePageFinders.radioTileLanguageLt);
          final RadioListTile radioTileLanguageDevice =
              tester.firstWidget(LanguagePageFinders.radioTileLanguageDevice);

          expect(radioTileLanguageEn.checked, false);
          expect(radioTileLanguageLt.checked, false);
          expect(radioTileLanguageDevice.checked, true);
        },
      );
    },
    variant: TargetPlatformVariant.mobile(),
  );

  testWidgets(
    'should change language to [en] '
    'when tapping on [en] language radio tile',
    (WidgetTester tester) async {
      await tester.runAsync(
        () async {
          await getIt<StreamingSharedPreferences>().setString(
            LocaleConstants.PREFERENCE_LANGUAGE,
            LocaleConstants.LANG_LT,
          );

          await pumpPage(
            tester,
            initialLocale: const Locale(LocaleConstants.LANG_LT),
          );

          final BuildContext context =
              tester.element(find.byType(LanguagePage));

          expect(
            EzLocalization.of(context)!.locale,
            isNot(
              const Locale(LocaleConstants.LANG_EN),
            ),
          );

          await tester.tap(LanguagePageFinders.radioTileLanguageEn);
          await tester.pump();

          expect(
            EzLocalization.of(context)!.locale,
            const Locale(LocaleConstants.LANG_EN),
          );
          expect(
            getIt<StreamingSharedPreferences>()
                .getString(
                  LocaleConstants.PREFERENCE_LANGUAGE,
                  defaultValue: LocaleConstants.LANG_LT,
                )
                .getValue(),
            LocaleConstants.LANG_EN,
          );
        },
      );
    },
    variant: TargetPlatformVariant.mobile(),
  );

  testWidgets(
    'should change language to [lt] '
    'when tapping on [lt] language radio tile',
    (WidgetTester tester) async {
      await tester.runAsync(
        () async {
          await getIt<StreamingSharedPreferences>().setString(
            LocaleConstants.PREFERENCE_LANGUAGE,
            LocaleConstants.LANG_EN,
          );

          await pumpPage(
            tester,
          );

          final BuildContext context =
              tester.element(find.byType(LanguagePage));

          expect(
            EzLocalization.of(context)!.locale,
            isNot(
              const Locale(LocaleConstants.LANG_LT),
            ),
          );

          await tester.tap(LanguagePageFinders.radioTileLanguageLt);
          await tester.pump();

          expect(
            EzLocalization.of(context)!.locale,
            const Locale(LocaleConstants.LANG_LT),
          );
          expect(
            getIt<StreamingSharedPreferences>()
                .getString(
                  LocaleConstants.PREFERENCE_LANGUAGE,
                  defaultValue: LocaleConstants.LANG_EN,
                )
                .getValue(),
            LocaleConstants.LANG_LT,
          );
        },
      );
    },
    variant: TargetPlatformVariant.mobile(),
  );

  testWidgets(
    'should change language to the first system locale '
    'and language preference to [device] in StreamingSharedPreferences '
    'when tapping on [device] language radio tile',
    (WidgetTester tester) async {
      await tester.runAsync(
        () async {
          await getIt<StreamingSharedPreferences>().setString(
            LocaleConstants.PREFERENCE_LANGUAGE,
            LocaleConstants.LANG_LT,
          );

          await pumpPage(
            tester,
            initialLocale: const Locale(LocaleConstants.LANG_LT),
          );

          final BuildContext context =
              tester.element(find.byType(LanguagePage));

          expect(
            EzLocalization.of(context)!.locale,
            isNot(
              const Locale(LocaleConstants.LANG_EN),
            ),
          );

          await tester.tap(LanguagePageFinders.radioTileLanguageDevice);
          await tester.pump();

          expect(
            EzLocalization.of(context)!.locale,
            TestWidgetsFlutterBinding.ensureInitialized().window.locales[0],
          );
          expect(
            getIt<StreamingSharedPreferences>()
                .getString(
                  LocaleConstants.PREFERENCE_LANGUAGE,
                  defaultValue: LocaleConstants.LANG_EN,
                )
                .getValue(),
            LocaleConstants.LANG_DEVICE,
          );
        },
      );
    },
    variant: TargetPlatformVariant.mobile(),
  );
}
