import 'package:bloc_test/bloc_test.dart';
import 'package:dportfolio_v2/application/github_bloc/github_bloc.dart';
import 'package:dportfolio_v2/domain/github/github_failure.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/github_page.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/widgets/states/error/github_error_state_widget.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/widgets/states/loaded/loaded_github_page.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/widgets/states/loading/github_loading_widget.dart';
import 'package:dportfolio_v2/presentation/core/locale_constants.dart';
import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import '../../../application/github_bloc/core/github_bloc_fetched_results.dart';
import '../../../utils/general_mocks/mock_github_bloc.dart';

void main() {
  MockGithubBloc? mockGithubBloc;

  Future<void> pumpGithubPage(WidgetTester tester) async {
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
          home: const GithubPage(),
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
    'should add [GithubEvent.getUserAndRepos] initially '
    'when providing bloc',
    (WidgetTester tester) async {
      await tester.runAsync(() async {
        await pumpGithubPage(tester);
        await tester.pump();

        verify(
          () => mockGithubBloc!.add(
            const GithubEvent.getUserAndRepos(name: 'GdonatasG'),
          ),
        ).called(1);
      });
    },
    variant: TargetPlatformVariant.mobile(),
  );

  testWidgets(
    'should return [GithubLoadingWidget] '
    'when [GithubBloc] state is [GithubState.initial]',
    (WidgetTester tester) async {
      await tester.runAsync(() async {
        whenListen(
          mockGithubBloc!,
          Stream.fromIterable(
            [
              const GithubState.initial(),
            ],
          ),
        );

        await pumpGithubPage(tester);
        await tester.pump();

        expect(find.byType(GithubLoadingWidget), findsOneWidget);
        expect(find.byType(GithubErrorStateWidget), findsNothing);
        expect(find.byType(LoadedGithubPage), findsNothing);
      });
    },
    variant: TargetPlatformVariant.mobile(),
  );

  testWidgets(
    'should return [GithubLoadingWidget] '
    'when [GithubBloc] state is [GithubState.loading]',
    (WidgetTester tester) async {
      await tester.runAsync(() async {
        whenListen(
          mockGithubBloc!,
          Stream.fromIterable(
            [
              const GithubState.loading(),
            ],
          ),
        );

        await pumpGithubPage(tester);
        await tester.pump();

        expect(find.byType(GithubLoadingWidget), findsOneWidget);
        expect(find.byType(GithubErrorStateWidget), findsNothing);
        expect(find.byType(LoadedGithubPage), findsNothing);
      });
    },
    variant: TargetPlatformVariant.mobile(),
  );

  testWidgets(
    'should return [LoadedGithubPage] '
    'when [GithubBloc] state is [GithubState.userWithReposLoaded]',
    (WidgetTester tester) async {
      await tester.runAsync(() async {
        whenListen(
          mockGithubBloc!,
          Stream.fromIterable(
            [
              const GithubState.userWithReposLoaded(
                fetchedUser,
                fetchedSearchReposThatCanLoadMore,
                canLoadMore: true,
              ),
            ],
          ),
        );

        await mockNetworkImages(() async {
          await pumpGithubPage(tester);
          await tester.pumpAndSettle();

          expect(find.byType(GithubLoadingWidget), findsNothing);
          expect(find.byType(GithubErrorStateWidget), findsNothing);
          expect(find.byType(LoadedGithubPage), findsOneWidget);
        });
      });
    },
    variant: TargetPlatformVariant.mobile(),
  );

  testWidgets(
    'should return [GithubErrorStateWidget] '
    'when [GithubBloc] state is [GithubState.initialLoadingError]',
    (WidgetTester tester) async {
      await tester.runAsync(() async {
        whenListen(
          mockGithubBloc!,
          Stream.fromIterable(
            [
              const GithubState.initialLoadingError(
                GithubFailure.userLoadingFailure(),
              ),
            ],
          ),
        );

        await pumpGithubPage(tester);
        await tester.pumpAndSettle();

        expect(find.byType(GithubLoadingWidget), findsNothing);
        expect(find.byType(GithubErrorStateWidget), findsOneWidget);
        expect(find.byType(LoadedGithubPage), findsNothing);
      });
    },
    variant: TargetPlatformVariant.mobile(),
  );

  testWidgets(
    'should NOT build '
    'when [GithubBloc] state is [GithubState.refreshing]',
    (WidgetTester tester) async {
      await tester.runAsync(() async {
        whenListen(
          mockGithubBloc!,
          Stream.fromIterable(
            [
              // should build when this state
              const GithubState.initialLoadingError(
                GithubFailure.userLoadingFailure(),
              ),

              // should not re(build) when this state
              const GithubState.refreshing()
            ],
          ),
        );

        await pumpGithubPage(tester);
        await tester.pumpAndSettle();

        expect(find.byType(GithubLoadingWidget), findsNothing);
        expect(find.byType(GithubErrorStateWidget), findsOneWidget);
        expect(find.byType(LoadedGithubPage), findsNothing);
      });
    },
    variant: TargetPlatformVariant.mobile(),
  );

  testWidgets(
    'should NOT build '
    'when [GithubBloc] state is [GithubState.loadingMore]',
    (WidgetTester tester) async {
      await tester.runAsync(() async {
        whenListen(
          mockGithubBloc!,
          Stream.fromIterable(
            [
              // should build when this state
              const GithubState.initialLoadingError(
                GithubFailure.userLoadingFailure(),
              ),

              // should not re(build) when this state
              const GithubState.loadingMore()
            ],
          ),
        );

        await pumpGithubPage(tester);
        await tester.pumpAndSettle();

        expect(find.byType(GithubLoadingWidget), findsNothing);
        expect(find.byType(GithubErrorStateWidget), findsOneWidget);
        expect(find.byType(LoadedGithubPage), findsNothing);
      });
    },
    variant: TargetPlatformVariant.mobile(),
  );

  testWidgets(
    'should NOT build '
    'when [GithubBloc] state is [GithubState.loadingMoreError]',
    (WidgetTester tester) async {
      await tester.runAsync(() async {
        whenListen(
          mockGithubBloc!,
          Stream.fromIterable(
            [
              // should build when this state
              const GithubState.initialLoadingError(
                GithubFailure.userLoadingFailure(),
              ),

              // should not re(build) when this state
              const GithubState.loadingMoreError(
                GithubFailure.reposLoadingFailure(),
              )
            ],
          ),
        );

        await pumpGithubPage(tester);
        await tester.pumpAndSettle();

        expect(find.byType(GithubLoadingWidget), findsNothing);

        // current widget
        expect(find.byType(GithubErrorStateWidget), findsOneWidget);

        expect(find.byType(LoadedGithubPage), findsNothing);
      });
    },
    variant: TargetPlatformVariant.mobile(),
  );
}
