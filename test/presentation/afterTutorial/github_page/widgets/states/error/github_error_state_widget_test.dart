import 'package:dportfolio_v2/application/github_bloc/github_bloc.dart';
import 'package:dportfolio_v2/injection.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/widgets/states/error/github_error_state_widget.dart';
import 'package:dportfolio_v2/presentation/core/locale_constants.dart';
import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import '../../../../../../utils/general_mocks/mock_github_bloc.dart';
import 'github_error_state_widget_finders.dart';

void main() {
  MockGithubBloc? mockGithubBloc;

  Future<void> pumpWidget(WidgetTester tester) async {
    await tester.pumpWidget(
      EzLocalizationBuilder(
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
          home: BlocProvider(
            create: (_) => getIt<GithubBloc>(),
            child: GithubErrorStateWidget(),
          ),
        ),
      ),
    );
  }

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
    resetInitBlocs();
    when(() => mockGithubBloc!.state)
        .thenAnswer((invocation) => const GithubState.initial());
    await setUpNeededDependencies();
  });

  tearDown(() async {
    final getIt = GetIt.instance;
    await getIt.reset();
    await mockGithubBloc!.close();
  });

  testWidgets(
    'should add [GithubEvent.getUserAndRepos] with concrete params '
    'when tapping on try again button',
    (WidgetTester tester) async {
      await tester.runAsync(
        () async {
          await pumpWidget(tester);
          await tester.pump();

          await tester.tap(GithubErrorStateWidgetFinders.tryAgainButton);
          await tester.pump();

          verify(
            () => mockGithubBloc!
                .add(const GithubEvent.getUserAndRepos(name: 'GdonatasG')),
          ).called(1);
        },
      );
    },
    variant: TargetPlatformVariant.mobile(),
  );
}
