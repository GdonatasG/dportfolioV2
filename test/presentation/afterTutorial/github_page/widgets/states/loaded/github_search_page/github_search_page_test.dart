import 'package:another_flushbar/flushbar.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dportfolio_v2/application/github_bloc/github_bloc.dart';
import 'package:dportfolio_v2/application/github_search_bloc/github_search_bloc.dart';
import 'package:dportfolio_v2/domain/github/github_failure.dart';
import 'package:dportfolio_v2/domain/github/github_repo.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/widgets/states/loaded/github_search_page/github_search_page.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/widgets/states/loaded/widgets/github_repo_item.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/widgets/states/loaded/widgets/sticky_header_widget.dart';
import 'package:dportfolio_v2/presentation/core/locale_constants.dart';
import 'package:dportfolio_v2/presentation/core/locale_keys.dart';
import 'package:dportfolio_v2/presentation/routes/router.gr.dart';
import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import '../../../../../../../application/github_bloc/core/github_bloc_fetched_results.dart';
import '../../../../../../../utils/general_mocks/mock_github_bloc.dart';
import '../../../../../../../utils/general_mocks/mock_github_search_bloc.dart';
import '../../../../../../../utils/general_mocks/mock_value_notifier.dart';
import 'github_search_page_finders.dart';

void main() {
  MockGithubBloc? mockGithubBloc;
  MockGithubSearchBloc? mockGithubSearchBloc;
  late AppRouter router;
  late MockValueNotifier<int> mockLanguageNotifier;

  Future<void> pumpPage(WidgetTester tester) async {
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
          home: const GithubSearchPage(
            username: 'testUser',
          ),
        ),
      ),
    );
    await tester.pump();
  }

  Future<void> setUpNeededDependencies() async {
    final getIt = GetIt.instance;

    getIt.registerLazySingleton<GithubBloc>(() => mockGithubBloc!);
    getIt.registerFactoryParam<GithubSearchBloc, String?, dynamic>(
      (username, _) => mockGithubSearchBloc!,
    );
    getIt.registerLazySingletonAsync<StreamingSharedPreferences>(
      () async => StreamingSharedPreferences.instance,
    );
    await GetIt.I.isReady<StreamingSharedPreferences>();
  }

  void resetInitBlocs() {
    mockGithubBloc = MockGithubBloc();
    mockGithubSearchBloc = MockGithubSearchBloc();
  }

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    router = AppRouter();
    mockLanguageNotifier = MockValueNotifier<int>(0);
    resetInitBlocs();
    when(() => mockGithubBloc!.state).thenReturn(const GithubState.initial());
    when(() => mockGithubSearchBloc!.state).thenAnswer(
      (invocation) => const GithubSearchState.initial(),
    );
    when(() => mockGithubSearchBloc!.languageIndexNotifier)
        .thenReturn(mockLanguageNotifier);
    await setUpNeededDependencies();
  });

  tearDown(() async {
    final getIt = GetIt.instance;
    await getIt.reset();
    await mockGithubBloc!.close();
    await mockGithubSearchBloc!.close();
    router.dispose();
    mockLanguageNotifier.dispose();
  });

  group(
    'search_text_field',
    () {
      testWidgets(
        'should be initially (auto) focused ',
        (WidgetTester tester) async {
          await tester.runAsync(() async {
            await pumpPage(tester);

            final TextField searchTextField =
                tester.firstWidget(GithubSearchPageFinders.searchTextField);

            expect(searchTextField.focusNode!.hasFocus, true);
            expect(searchTextField.autofocus, true);
          });
        },
        variant: TargetPlatformVariant.mobile(),
      );

      testWidgets(
        'should add [GithubSearchEvent.queryChanged] '
        'when entering text',
        (WidgetTester tester) async {
          await tester.runAsync(() async {
            await pumpPage(tester);

            await tester.enterText(
              GithubSearchPageFinders.searchTextField,
              'testQuery',
            );
            await tester.pump();

            // debouncing
            await Future.delayed(githubSearchDebounceDuration);

            verify(
              () => mockGithubSearchBloc!.add(
                const GithubSearchEvent.queryChanged(query: 'testQuery'),
              ),
            ).called(1);
          });
        },
        variant: TargetPlatformVariant.mobile(),
      );

      testWidgets(
        'should NOT show clear button '
        'when search field is empty',
        (WidgetTester tester) async {
          await tester.runAsync(
            () async {
              await pumpPage(tester);

              final TextField searchTextField =
                  tester.firstWidget(GithubSearchPageFinders.searchTextField);

              expect(searchTextField.controller!.text.isEmpty, true);
              expect(GithubSearchPageFinders.searchClearButton, findsNothing);
            },
          );
        },
        variant: TargetPlatformVariant.mobile(),
      );

      testWidgets(
        'should show clear button '
        'when search field is NOT empty',
        (WidgetTester tester) async {
          await tester.runAsync(
            () async {
              await pumpPage(tester);

              final TextField searchTextField =
                  tester.firstWidget(GithubSearchPageFinders.searchTextField);

              await tester.enterText(
                GithubSearchPageFinders.searchTextField,
                'testQuery',
              );
              await tester.pump();

              expect(searchTextField.controller!.text, 'testQuery');
              expect(GithubSearchPageFinders.searchClearButton, findsOneWidget);
            },
          );
        },
        variant: TargetPlatformVariant.mobile(),
      );

      testWidgets(
        'should clear text field text '
        'and add [GithubSearchEvent.queryChanged] with empty query '
        'when tapping on clear button',
        (WidgetTester tester) async {
          await tester.runAsync(
            () async {
              await pumpPage(tester);

              final TextField searchTextField =
                  tester.firstWidget(GithubSearchPageFinders.searchTextField);

              await tester.enterText(
                GithubSearchPageFinders.searchTextField,
                'testQuery',
              );
              await tester.pump();

              await tester.tap(GithubSearchPageFinders.searchClearButton);
              await tester.pump();

              expect(searchTextField.controller!.text.isEmpty, true);
              verify(
                () => mockGithubSearchBloc!
                    .add(const GithubSearchEvent.queryChanged(query: '')),
              ).called(1);
            },
          );
        },
        variant: TargetPlatformVariant.mobile(),
      );
    },
  );

  group(
    'language_selector',
    () {
      testWidgets(
        'should show selected icon '
        'when language index is > 0',
        (WidgetTester tester) async {
          await tester.runAsync(() async {
            mockLanguageNotifier = MockValueNotifier<int>(1);
            when(() => mockGithubSearchBloc!.languageIndexNotifier)
                .thenReturn(mockLanguageNotifier);

            await pumpPage(tester);

            expect(
              GithubSearchPageFinders.languageSelectorIconSelected,
              findsOneWidget,
            );
            expect(
              GithubSearchPageFinders.languageSelectorIconUnselected,
              findsNothing,
            );
          });
        },
        variant: TargetPlatformVariant.mobile(),
      );

      testWidgets(
        'should show unselected icon '
        'when language index is 0',
        (WidgetTester tester) async {
          await tester.runAsync(() async {
            mockLanguageNotifier = MockValueNotifier<int>(0);
            when(() => mockGithubSearchBloc!.languageIndexNotifier)
                .thenReturn(mockLanguageNotifier);

            await pumpPage(tester);

            expect(
              GithubSearchPageFinders.languageSelectorIconSelected,
              findsNothing,
            );
            expect(
              GithubSearchPageFinders.languageSelectorIconUnselected,
              findsOneWidget,
            );
          });
        },
        variant: TargetPlatformVariant.mobile(),
      );

      testWidgets(
        'should open bottom sheet '
        'when tapping on language selector button',
        (WidgetTester tester) async {
          await tester.runAsync(
            () async {
              await pumpPage(tester);

              expect(find.byType(BottomSheet), findsNothing);

              await tester.tap(GithubSearchPageFinders.languageSelectorButton);
              await tester.pumpAndSettle();

              expect(find.byType(BottomSheet), findsOneWidget);
            },
          );
        },
        variant: TargetPlatformVariant.mobile(),
      );

      testWidgets(
        'should close bottom sheet '
        'when tapping on bottom sheet item',
        (WidgetTester tester) async {
          await tester.runAsync(
            () async {
              await pumpPage(tester);

              await tester.tap(GithubSearchPageFinders.languageSelectorButton);
              await tester.pumpAndSettle();

              expect(find.byType(BottomSheet), findsOneWidget);

              await tester
                  .tap(find.text(mockGithubSearchBloc!.getFilterOptions[1]));
              await tester.pumpAndSettle();

              expect(find.byType(BottomSheet), findsNothing);
            },
          );
        },
        variant: TargetPlatformVariant.mobile(),
      );

      testWidgets(
        'should add [GithubSearchEvent.languageChanged] '
        'when tapping on bottom sheet item',
        (WidgetTester tester) async {
          await tester.runAsync(
            () async {
              await pumpPage(tester);

              await tester.tap(GithubSearchPageFinders.languageSelectorButton);
              await tester.pumpAndSettle();

              await tester
                  .tap(find.text(mockGithubSearchBloc!.getFilterOptions[1]));
              await tester.pumpAndSettle();

              verify(
                () => mockGithubSearchBloc!
                    .add(const GithubSearchEvent.languageChanged(index: 1)),
              ).called(1);
            },
          );
        },
        variant: TargetPlatformVariant.mobile(),
      );
    },
  );

  group(
    'global_search_switch',
    () {
      testWidgets(
        'default value should be false',
        (WidgetTester tester) async {
          await tester.runAsync(
            () async {
              await pumpPage(tester);

              final Switch globalSearchSwitch = tester
                  .firstWidget(GithubSearchPageFinders.globalSearchSwitch);

              expect(globalSearchSwitch.value, false);
            },
          );
        },
        variant: TargetPlatformVariant.mobile(),
      );

      testWidgets(
        'should change value to true '
        'and call [GithubSearchEvent.searchTypeChanged] with concrete value '
        'when tapping on [Switch]',
        (WidgetTester tester) async {
          await tester.runAsync(() async {
            await pumpPage(tester);

            await tester.tap(GithubSearchPageFinders.globalSearchSwitch);
            await tester.pump();

            final Switch globalSearchSwitch =
                tester.firstWidget(GithubSearchPageFinders.globalSearchSwitch);

            expect(globalSearchSwitch.value, true);
            verify(
              () => mockGithubSearchBloc!.add(
                const GithubSearchEvent.searchTypeChanged(isGlobal: true),
              ),
            ).called(1);
          });
        },
        variant: TargetPlatformVariant.mobile(),
      );

      testWidgets(
        'should change value to false '
        'and call [GithubSearchEvent.searchTypeChanged] with concrete value '
        'when current [Switch] value is true and '
        'when tapping on [Switch]',
        (WidgetTester tester) async {
          await tester.runAsync(() async {
            await pumpPage(tester);

            await tester.tap(GithubSearchPageFinders.globalSearchSwitch);
            await tester.pump();

            await tester.tap(GithubSearchPageFinders.globalSearchSwitch);
            await tester.pump();

            final Switch globalSearchSwitch =
                tester.firstWidget(GithubSearchPageFinders.globalSearchSwitch);

            expect(globalSearchSwitch.value, false);
            verify(
              () => mockGithubSearchBloc!.add(
                const GithubSearchEvent.searchTypeChanged(isGlobal: false),
              ),
            ).called(1);
          });
        },
        variant: TargetPlatformVariant.mobile(),
      );
    },
  );

  group(
    'github_search_bloc_states',
    () {
      final initialSearchWidgetFinder = find.byType(InitialSearchWidget);
      final searchingWidgetFinder = find.byType(SearchingWidget);
      final loadedSearchWidgetFinder = find.byType(LoadedSearchWidget);
      final emptySearchWidgetFinder = find.byType(EmptySearchWidget);
      final searchErrorWidgetFinder = find.byType(SearchErrorWidget);

      testWidgets(
        'should build [InitialSearchWidget] '
        'when [GithubBloc] state is [initial]',
        (WidgetTester tester) async {
          await tester.runAsync(
            () async {
              when(() => mockGithubSearchBloc!.state)
                  .thenReturn(const GithubSearchState.initial());
              await pumpPage(tester);

              // expected
              expect(initialSearchWidgetFinder, findsOneWidget);

              expect(searchingWidgetFinder, findsNothing);
              expect(loadedSearchWidgetFinder, findsNothing);
              expect(emptySearchWidgetFinder, findsNothing);
              expect(searchErrorWidgetFinder, findsNothing);
            },
          );
        },
        variant: TargetPlatformVariant.mobile(),
      );

      testWidgets(
        'should build [SearchingWidget] '
        'when [GithubBloc] state is [searching]',
        (WidgetTester tester) async {
          await tester.runAsync(
            () async {
              when(() => mockGithubSearchBloc!.state)
                  .thenReturn(const GithubSearchState.searching());
              await pumpPage(tester);

              expect(initialSearchWidgetFinder, findsNothing);

              // expected
              expect(searchingWidgetFinder, findsOneWidget);

              expect(loadedSearchWidgetFinder, findsNothing);
              expect(emptySearchWidgetFinder, findsNothing);
              expect(searchErrorWidgetFinder, findsNothing);
            },
          );
        },
        variant: TargetPlatformVariant.mobile(),
      );

      testWidgets(
        'should build [LoadedSearchWidget] with concrete params '
        'when [GithubBloc] state is [searched] with non-empty repo list',
        (WidgetTester tester) async {
          await tester.runAsync(
            () async {
              when(() => mockGithubSearchBloc!.state).thenReturn(
                const GithubSearchState.searched(
                  fetchedSearchReposThatCanLoadMore,
                  true,
                ),
              );
              await pumpPage(tester);

              expect(initialSearchWidgetFinder, findsNothing);
              expect(searchingWidgetFinder, findsNothing);

              // expected
              expect(
                find.byWidgetPredicate(
                  (widget) =>
                      widget is LoadedSearchWidget &&
                      widget.githubSearchRepos ==
                          fetchedSearchReposThatCanLoadMore &&
                      widget.canLoadMore == true,
                ),
                findsOneWidget,
              );

              expect(emptySearchWidgetFinder, findsNothing);
              expect(searchErrorWidgetFinder, findsNothing);
            },
          );
        },
        variant: TargetPlatformVariant.mobile(),
      );

      testWidgets(
        'should build [EmptySearchWidget]  '
        'when [GithubBloc] state is [searched] with empty repo list',
        (WidgetTester tester) async {
          await tester.runAsync(
            () async {
              when(() => mockGithubSearchBloc!.state).thenReturn(
                const GithubSearchState.searched(
                  fetchedEmptySearchRepos,
                  false,
                ),
              );
              await pumpPage(tester);

              expect(initialSearchWidgetFinder, findsNothing);
              expect(searchingWidgetFinder, findsNothing);
              expect(loadedSearchWidgetFinder, findsNothing);

              // expected
              expect(emptySearchWidgetFinder, findsOneWidget);

              expect(searchErrorWidgetFinder, findsNothing);
            },
          );
        },
        variant: TargetPlatformVariant.mobile(),
      );

      testWidgets(
        'should build [SearchErrorWidget] with concrete failure  '
        'when [GithubBloc] state is [searchingError]',
        (WidgetTester tester) async {
          await tester.runAsync(
            () async {
              when(() => mockGithubSearchBloc!.state).thenReturn(
                const GithubSearchState.searchingError(
                  GithubFailure.reposLoadingFailure(),
                ),
              );
              await pumpPage(tester);

              expect(initialSearchWidgetFinder, findsNothing);
              expect(searchingWidgetFinder, findsNothing);
              expect(loadedSearchWidgetFinder, findsNothing);
              expect(emptySearchWidgetFinder, findsNothing);

              // expected
              expect(
                find.byWidgetPredicate(
                  (widget) =>
                      widget is SearchErrorWidget &&
                      widget.failure ==
                          const GithubFailure.reposLoadingFailure(),
                ),
                findsOneWidget,
              );
            },
          );
        },
        variant: TargetPlatformVariant.mobile(),
      );

      testWidgets(
        'should NOT re(build) '
        'when [GithubBloc] state is [loadingMoreError]',
        (WidgetTester tester) async {
          await tester.runAsync(
            () async {
              whenListen(
                mockGithubSearchBloc!,
                Stream.value(
                  const GithubSearchState.loadingMoreError(
                    GithubFailure.reposLoadingFailure(),
                  ),
                ),
                initialState: const GithubSearchState.searching(),
              );

              await pumpPage(tester);

              await tester.pump();

              expect(initialSearchWidgetFinder, findsNothing);

              // expected
              expect(searchingWidgetFinder, findsOneWidget);

              expect(loadedSearchWidgetFinder, findsNothing);
              expect(emptySearchWidgetFinder, findsNothing);
              expect(searchErrorWidgetFinder, findsNothing);
            },
          );
        },
        variant: TargetPlatformVariant.mobile(),
      );
    },
  );

  group(
    'search_error_widget',
    () {
      setUp(
        () {
          when(() => mockGithubSearchBloc!.state).thenReturn(
            const GithubSearchState.searchingError(
              GithubFailure.reposLoadingFailure(),
            ),
          );
        },
      );

      testWidgets(
        'should add [GithubSearchEvent.retrySearch] event to [GithubSearchBloc] '
        'when tapping on retry button',
        (WidgetTester tester) async {
          await tester.runAsync(
            () async {
              await pumpPage(tester);

              await tester
                  .tap(GithubSearchPageFinders.searchErrorWidgetRetryButton);
              await tester.pump();

              verify(
                () => mockGithubSearchBloc!
                    .add(const GithubSearchEvent.retrySearch()),
              ).called(1);
            },
          );
        },
        variant: TargetPlatformVariant.mobile(),
      );
    },
  );

  group(
    'loaded_search_widget',
    () {
      setUp(
        () {
          when(() => mockGithubSearchBloc!.state).thenReturn(
            const GithubSearchState.searched(
              fetchedSearchReposThatCanLoadMore,
              true,
            ),
          );
        },
      );

      group(
        'github_search_bloc_listener',
        () {
          testWidgets(
            'should show [FlushBar] error with concrete message '
            'when state is [loadingMoreError]',
            (WidgetTester tester) async {
              await tester.runAsync(
                () async {
                  whenListen(
                    mockGithubSearchBloc!,
                    Stream.value(
                      const GithubSearchState.loadingMoreError(
                        GithubFailure.reposLoadingFailure(),
                      ),
                    ),
                  );

                  await pumpPage(tester);

                  final expectedMessage = tester
                      .firstElement(find.byType(GithubSearchPage))
                      .getString(LocaleKeys.ERROR_TRY_AGAIN);

                  await tester.pump();

                  expect(
                    find.byWidgetPredicate(
                      (widget) =>
                          widget is Flushbar &&
                          widget.message == expectedMessage,
                    ),
                    findsOneWidget,
                  );
                },
              );
            },
            variant: TargetPlatformVariant.mobile(),
          );
        },
      );

      testWidgets(
        'should display [StickyHeaderWidget] '
        'with concrete title that represents repos count',
        (WidgetTester tester) async {
          await tester.runAsync(
            () async {
              await pumpPage(tester);

              final BuildContext context =
                  tester.firstElement(find.byType(GithubSearchPage));

              final expectedTitle = context.getString(
                LocaleKeys.REPOS_TITLE,
                {'repos': fetchedSearchReposThatCanLoadMore.total_count!},
              );

              expect(
                find.byWidgetPredicate(
                  (widget) =>
                      widget is StickyHeaderWidget &&
                      widget.title == expectedTitle,
                ),
                findsOneWidget,
              );
            },
          );
        },
        variant: TargetPlatformVariant.mobile(),
      );

      testWidgets(
        'should display repos [ListView] '
        'with concrete [GithubRepoItem]s ',
        (WidgetTester tester) async {
          await tester.runAsync(
            () async {
              await pumpPage(tester);

              expect(GithubSearchPageFinders.reposListView, findsOneWidget);

              for (final GithubRepo expected
                  in fetchedSearchReposThatCanLoadMore.items!) {
                expect(
                  find.byWidgetPredicate(
                    (widget) =>
                        widget is GithubRepoItem && widget.repo == expected,
                  ),
                  findsOneWidget,
                );
              }
            },
          );
        },
        variant: TargetPlatformVariant.mobile(),
      );

      group(
        'pagination_widget',
        () {
          testWidgets(
            'should display paginate widget '
            'when fetched repos is not empty and can load more',
            (WidgetTester tester) async {
              await tester.runAsync(() async {
                when(() => mockGithubSearchBloc!.state).thenAnswer(
                  (invocation) => const GithubSearchState.searched(
                    fetchedSearchReposThatCanLoadMore,
                    true,
                  ),
                );

                await pumpPage(tester);

                expect(GithubSearchPageFinders.paginateWidget, findsOneWidget);
              });
            },
            variant: TargetPlatformVariant.mobile(),
          );

          testWidgets(
            'should NOT display paginate widget '
            'when fetched repos can NOT load more',
            (WidgetTester tester) async {
              await tester.runAsync(() async {
                when(() => mockGithubSearchBloc!.state).thenAnswer(
                  (invocation) => const GithubSearchState.searched(
                    fetchedSearchReposThatCanNotLoadMore,
                    false,
                  ),
                );

                await pumpPage(tester);

                expect(GithubSearchPageFinders.paginateWidget, findsNothing);
              });
            },
            variant: TargetPlatformVariant.mobile(),
          );

          testWidgets(
            'should display paginate button '
            'when [GithubSearchBloc] state is not [GithubSearchState.loadingMore]',
            (WidgetTester tester) async {
              await tester.runAsync(
                () async {
                  await pumpPage(tester);

                  // verifying that current state is not [loadingMore]
                  expect(
                    mockGithubSearchBloc!.state,
                    const GithubSearchState.searched(
                      fetchedSearchReposThatCanLoadMore,
                      true,
                    ),
                  );

                  expect(
                    GithubSearchPageFinders.paginateButton,
                    findsOneWidget,
                  );
                  expect(
                    GithubSearchPageFinders.paginationIndicator,
                    findsNothing,
                  );
                },
              );
            },
            variant: TargetPlatformVariant.mobile(),
          );

          testWidgets(
            'should display pagination indicator '
            'when [GithubSearchBloc] state is [GithubSearchState.loadingMore]',
            (WidgetTester tester) async {
              await tester.runAsync(
                () async {
                  whenListen(
                    mockGithubSearchBloc!,
                    Stream.value(const GithubSearchState.loadingMore()),
                  );

                  await pumpPage(tester);
                  await tester.pump();

                  expect(
                    GithubSearchPageFinders.paginateButton,
                    findsNothing,
                  );
                  expect(
                    GithubSearchPageFinders.paginationIndicator,
                    findsOneWidget,
                  );
                },
              );
            },
            variant: TargetPlatformVariant.mobile(),
          );

          testWidgets(
            'should add [GithubSearchEvent.paginate] '
            'when tapping on paginate button',
            (WidgetTester tester) async {
              await tester.runAsync(
                () async {
                  await pumpPage(tester);

                  await tester.tap(GithubSearchPageFinders.paginateButton);
                  await tester.pump();

                  verify(
                    () => mockGithubSearchBloc!
                        .add(const GithubSearchEvent.paginate()),
                  ).called(1);
                },
              );
            },
            variant: TargetPlatformVariant.mobile(),
          );
        },
      );
    },
  );
}
