import 'package:another_flushbar/flushbar.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dportfolio_v2/application/github_bloc/github_bloc.dart';
import 'package:dportfolio_v2/application/github_search_bloc/github_search_bloc.dart';
import 'package:dportfolio_v2/domain/github/github_failure.dart';
import 'package:dportfolio_v2/domain/github/github_repo.dart';
import 'package:dportfolio_v2/domain/github/github_search_repos.dart';
import 'package:dportfolio_v2/domain/github/github_user.dart';
import 'package:dportfolio_v2/injection.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/widgets/states/loaded/github_search_page/github_search_page.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/widgets/states/loaded/loaded_github_page.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/widgets/states/loaded/widgets/empty_list_widget.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/widgets/states/loaded/widgets/github_loaded_repos.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/widgets/states/loaded/widgets/github_repo_item.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/widgets/states/loaded/widgets/sticky_header_widget.dart';
import 'package:dportfolio_v2/presentation/core/locale_constants.dart';
import 'package:dportfolio_v2/presentation/core/locale_keys.dart';
import 'package:dportfolio_v2/presentation/routes/router.gr.dart';
import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import '../../../../../../application/github_bloc/core/github_bloc_fetched_results.dart';
import '../../../../../../utils/general_mocks/mock_auto_router_observer.dart';
import '../../../../../../utils/general_mocks/mock_github_bloc.dart';
import '../../../../../../utils/general_mocks/mock_github_search_bloc.dart';
import '../../../../../../utils/general_mocks/mock_value_notifier.dart';
import 'loaded_github_page_finders.dart';

void main() {
  final MockAutoRouterObserver mockNavigatorObserver = MockAutoRouterObserver();
  MockGithubBloc? mockGithubBloc;
  MockGithubSearchBloc? mockGithubSearchBloc;
  late AppRouter router;

  // For GithubSearchBloc
  late MockValueNotifier<int> mockLanguageNotifier;

  Future<void> pumpLoadedGithubPage(
    WidgetTester tester, {
    GithubUser githubUser = fetchedUser,
    GithubSearchRepos githubSearchRepos = fetchedSearchReposThatCanLoadMore,
    bool canLoadMore = true,
  }) async {
    await mockNetworkImages(
      () async {
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
              localizationsDelegates:
                  localizationDelegate.localizationDelegates,
              supportedLocales: localizationDelegate.supportedLocales,
              localeResolutionCallback:
                  localizationDelegate.localeResolutionCallback,
              home: BlocProvider(
                create: (_) => getIt<GithubBloc>(),
                child: LoadedGithubPage(
                  githubUser: githubUser,
                  githubSearchRepos: githubSearchRepos,
                  canLoadMore: canLoadMore,
                ),
              ),
            ),
          ),
        );
        await tester.pump();
      },
    );
  }

  Future<void> pumpLoadedGithubPageRouted(WidgetTester tester) async {
    await mockNetworkImages(
      () async {
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
              localizationsDelegates:
                  localizationDelegate.localizationDelegates,
              supportedLocales: localizationDelegate.supportedLocales,
              localeResolutionCallback:
                  localizationDelegate.localeResolutionCallback,
              routeInformationParser: router.defaultRouteParser(),
              routerDelegate: router.delegate(
                initialRoutes: [
                  const AfterTutorialPageRoute(),
                ],
                navigatorObservers: () => [
                  mockNavigatorObserver,
                ],
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();
        router.navigate(const GithubPageWrapperRouter());
        await tester.pumpAndSettle();
        expect(find.byType(LoadedGithubPage), findsOneWidget);
      },
    );
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

  void resetInitMocks() {
    reset(mockNavigatorObserver);
    mockGithubBloc = MockGithubBloc();
    mockGithubSearchBloc = MockGithubSearchBloc();
  }

  setUpAll(
    () {
      registerFallbackValue(FakeRoute());
    },
  );

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    router = AppRouter();
    mockLanguageNotifier = MockValueNotifier<int>(0);
    resetInitMocks();
    when(() => mockGithubBloc!.state).thenAnswer(
      (invocation) => const GithubState.userWithReposLoaded(
        fetchedUser,
        fetchedSearchReposThatCanLoadMore,
        canLoadMore: true,
      ),
    );
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
    'github_bloc_listener',
    () {
      testWidgets(
        'should show concrete Flushbar error message '
        'when state is [GithubState.userWithReposLoaded] with specified failure',
        (WidgetTester tester) async {
          await tester.runAsync(() async {
            whenListen(
              mockGithubBloc!,
              Stream.value(
                const GithubState.userWithReposLoaded(
                  fetchedUser,
                  fetchedSearchReposThatCanLoadMore,
                  failure: GithubFailure.reposLoadingFailure(),
                  canLoadMore: true,
                ),
              ),
            );

            await pumpLoadedGithubPage(tester);

            final BuildContext context =
                tester.firstElement(find.byType(LoadedGithubPage));

            await tester.pump();

            expect(
              find.byWidgetPredicate(
                (widget) =>
                    widget is Flushbar &&
                    widget.message ==
                        context.getString(LocaleKeys.ERROR_TRY_AGAIN),
              ),
              findsOneWidget,
            );
          });
        },
        variant: TargetPlatformVariant.mobile(),
      );

      testWidgets(
        'should show concrete Flushbar error message '
        'when state is [GithubState.loadingMoreError] with specified failure',
        (WidgetTester tester) async {
          await tester.runAsync(() async {
            whenListen(
              mockGithubBloc!,
              Stream.value(
                const GithubState.loadingMoreError(
                  GithubFailure.reposLoadingFailure(),
                ),
              ),
            );

            await pumpLoadedGithubPage(tester);

            final BuildContext context =
                tester.firstElement(find.byType(LoadedGithubPage));

            await tester.pump();

            expect(
              find.byWidgetPredicate(
                (widget) =>
                    widget is Flushbar &&
                    widget.message ==
                        context.getString(LocaleKeys.ERROR_TRY_AGAIN),
              ),
              findsOneWidget,
            );
          });
        },
        variant: TargetPlatformVariant.mobile(),
      );
    },
  );

  group(
    'refresh_indicator',
    () {
      testWidgets(
        'should add [GithubEvent.getUserAndRepos] '
        'when refreshing',
        (WidgetTester tester) async {
          await tester.runAsync(() async {
            await pumpLoadedGithubPage(tester);

            whenListen(
              mockGithubBloc!,
              Stream.value(
                const GithubState.userWithReposLoaded(
                  fetchedUser,
                  fetchedSearchReposThatCanLoadMore,
                  canLoadMore: true,
                ),
              ),
            );

            verifyNever(
              () => mockGithubBloc!.add(
                const GithubEvent.getUserAndRepos(
                  name: 'GdonatasG',
                  isRefresh: true,
                ),
              ),
            );

            tester
                .state<RefreshIndicatorState>(
                  LoadedGithubPageFinders.refreshIndicator,
                )
                .show();

            await tester.pump(const Duration(seconds: 1));
            await tester.pump(const Duration(seconds: 1));
            await tester.pump(const Duration(seconds: 1));

            verify(
              () => mockGithubBloc!.add(
                const GithubEvent.getUserAndRepos(
                  name: 'GdonatasG',
                  isRefresh: true,
                ),
              ),
            ).called(1);
          });
        },
        variant: TargetPlatformVariant.mobile(),
      );

      testWidgets(
        'should finish refresh '
        'when emitted GithubBloc state from [onRefresh] is [GithubState.userWithReposLoaded]',
        (WidgetTester tester) async {
          await tester.runAsync(() async {
            await pumpLoadedGithubPage(tester);

            whenListen(
              mockGithubBloc!,
              Stream.value(
                const GithubState.userWithReposLoaded(
                  fetchedUser,
                  fetchedSearchReposThatCanLoadMore,
                  canLoadMore: true,
                ),
              ),
            );
            bool isFinished = false;

            tester
                .state<RefreshIndicatorState>(
                  LoadedGithubPageFinders.refreshIndicator,
                )
                .show()
                .then((value) {
              isFinished = true;
            });

            await tester.pump(const Duration(seconds: 1));
            await tester.pump(const Duration(seconds: 1));
            await tester.pump(const Duration(seconds: 1));

            expect(isFinished, true);
          });
        },
        variant: TargetPlatformVariant.mobile(),
      );

      testWidgets(
        'should finish refresh '
        'when emitted GithubBloc state from [onRefresh] is [GithubState.loadingMore]',
        (WidgetTester tester) async {
          await tester.runAsync(() async {
            await pumpLoadedGithubPage(tester);

            whenListen(
              mockGithubBloc!,
              Stream.value(
                const GithubState.loadingMore(),
              ),
            );
            bool isFinished = false;

            tester
                .state<RefreshIndicatorState>(
                  LoadedGithubPageFinders.refreshIndicator,
                )
                .show()
                .then((value) {
              isFinished = true;
            });

            await tester.pump(const Duration(seconds: 1));
            await tester.pump(const Duration(seconds: 1));
            await tester.pump(const Duration(seconds: 1));

            expect(isFinished, true);
          });
        },
        variant: TargetPlatformVariant.mobile(),
      );
    },
  );

  group(
    'loaded_sliver_app_bar',
    () {
      testWidgets(
        'router should push a [CustomWebViewRoute] '
        'when tapping on visit profile button',
        (WidgetTester tester) async {
          await tester.runAsync(() async {
            await pumpLoadedGithubPageRouted(tester);

            await tester.tap(LoadedGithubPageFinders.visitProfileButton);
            await tester.pump();

            verify(() => mockNavigatorObserver.didPush(any(), any()))
                .called(3); // 1st [didPush] pushes [AfterTutorialPageRoute],
            // 2nd pushes [GithubPageRoute], 3rd pushes [CustomWebViewRoute]
            verifyNever(() => mockNavigatorObserver.didRemove(any(), any()));

            expect(router.current.name, CustomWebViewRoute.name);
          });
        },
        variant: TargetPlatformVariant.mobile(),
      );
    },
  );

  group(
    'search_text_field',
    () {
      testWidgets(
        '[TextField.focusNode.hasFocus] should be false after entering text',
        (WidgetTester tester) async {
          await tester.runAsync(() async {
            await pumpLoadedGithubPage(tester);

            final TextField searchTextField = tester.firstWidget(
              LoadedGithubPageFinders.searchTextField,
            );

            // user should not be able to focus and enter any text
            await tester.enterText(
              LoadedGithubPageFinders.searchTextField,
              'test',
            );
            await tester.pump();

            expect(searchTextField.focusNode!.hasFocus, false);
          });
        },
        variant: TargetPlatformVariant.mobile(),
      );

      testWidgets(
        'router should push a [GithubSearchPageRoute] with concrete username '
        'to inner [GithubPageWrapperRoute] router '
        'when tapping on search TextField',
        (WidgetTester tester) async {
          await tester.runAsync(() async {
            await pumpLoadedGithubPageRouted(tester);

            await tester.tap(LoadedGithubPageFinders.searchTextField);
            await tester.pump();

            verify(() => mockNavigatorObserver.didPush(any(), any()))
                .called(3); // 1st [didPush] pushes [AfterTutorialPageRoute],
            // 2nd pushes [GithubPageRoute], 3rd pushes [GithubSearchPageRoute]
            verifyNever(() => mockNavigatorObserver.didRemove(any(), any()));

            expect(
              router
                  .innerRouterOf(AfterTutorialPageRoute.name)!
                  .innerRouterOf(GithubPageWrapperRouter.name)!
                  .current
                  .name,
              GithubSearchPageRoute.name,
            );
            expect(
              router.innerRouterOf(AfterTutorialPageRoute.name)!.current.name,
              GithubPageWrapperRouter.name,
            );

            // concrete username
            expect(
              find.byWidgetPredicate(
                (widget) =>
                    widget is GithubSearchPage &&
                    widget.username == 'GdonatasG',
              ),
              findsOneWidget,
            );
          });
        },
        variant: TargetPlatformVariant.mobile(),
      );
    },
  );

  group(
    'repos_list',
    () {
      testWidgets(
        'should create [SliverStickyHeader] '
        'with header: [StickyHeaderWidget] which has concrete title '
        'and sliver: [GithubLoadedRepos] which has concrete arguments '
        'when [GithubSearchRepos.items.isNotEmpty] ',
        (WidgetTester tester) async {
          await tester.runAsync(() async {
            await pumpLoadedGithubPage(tester);

            final SliverStickyHeader sliverStickyHeader = tester.firstWidget(
              LoadedGithubPageFinders.reposCountStickyHeader,
            );
            final BuildContext context = tester.firstElement(
              LoadedGithubPageFinders.reposCountStickyHeader,
            );

            final StickyHeaderWidget stickyHeaderWidget =
                sliverStickyHeader.header! as StickyHeaderWidget;

            final GithubLoadedRepos githubLoadedRepos =
                sliverStickyHeader.sliver! as GithubLoadedRepos;

            expect(
              stickyHeaderWidget.title,
              context.getString(
                LocaleKeys.REPOS_TITLE,
                {'repos': fetchedSearchReposThatCanLoadMore.total_count!},
              ),
            );
            expect(
              githubLoadedRepos.githubSearchRepos,
              fetchedSearchReposThatCanLoadMore,
            );
            expect(githubLoadedRepos.canLoadMore, true);
          });
        },
        variant: TargetPlatformVariant.mobile(),
      );

      testWidgets(
        'should create [EmptyListWidget] '
        'with surrounded [SliverFillRemaining] which does not have scrollable body '
        'when [GithubSearchRepos.items.isEmpty]',
        (WidgetTester tester) async {
          await tester.runAsync(() async {
            await pumpLoadedGithubPage(
              tester,
              githubSearchRepos: fetchedEmptySearchRepos,
            );

            final SliverFillRemaining emptyListWidgetSliver =
                tester.firstWidget(
              LoadedGithubPageFinders.emptyListWidgetSliver,
            );

            expect(emptyListWidgetSliver.hasScrollBody, false);
            expect(emptyListWidgetSliver.child, isA<EmptyListWidget>());
          });
        },
        variant: TargetPlatformVariant.mobile(),
      );

      group(
        'github_loaded_repos',
        () {
          testWidgets(
            'should display repos list '
            'when fetched repos is not empty',
            (WidgetTester tester) async {
              await tester.runAsync(() async {
                when(() => mockGithubBloc!.state).thenAnswer(
                  (invocation) => const GithubState.userWithReposLoaded(
                    fetchedUser,
                    fetchedSearchReposThatCanLoadMore,
                    canLoadMore: true,
                  ),
                );

                await pumpLoadedGithubPage(tester);

                expect(LoadedGithubPageFinders.repoList, findsOneWidget);
              });
            },
            variant: TargetPlatformVariant.mobile(),
          );

          testWidgets(
            'should display paginate widget '
            'when fetched repos is not empty and can load more',
            (WidgetTester tester) async {
              await tester.runAsync(() async {
                when(() => mockGithubBloc!.state).thenAnswer(
                  (invocation) => const GithubState.userWithReposLoaded(
                    fetchedUser,
                    fetchedSearchReposThatCanLoadMore,
                    canLoadMore: true,
                  ),
                );

                await pumpLoadedGithubPage(tester);

                expect(LoadedGithubPageFinders.paginateWidget, findsOneWidget);
              });
            },
            variant: TargetPlatformVariant.mobile(),
          );

          testWidgets(
            'should NOT display paginate widget '
            'when fetched repos is not empty but can NOT load more',
            (WidgetTester tester) async {
              await tester.runAsync(() async {
                await pumpLoadedGithubPage(
                  tester,
                  githubSearchRepos: fetchedSearchReposThatCanNotLoadMore,
                  canLoadMore: false,
                );

                expect(LoadedGithubPageFinders.paginateWidget, findsNothing);
              });
            },
            variant: TargetPlatformVariant.mobile(),
          );

          testWidgets(
            'should display concrete [GithubRepoItem] list '
            'when fetched repos is not empty',
            (WidgetTester tester) async {
              await tester.runAsync(() async {
                await pumpLoadedGithubPage(tester);

                for (final GithubRepo repo
                    in fetchedSearchReposThatCanLoadMore.items!) {
                  expect(
                    find.byWidgetPredicate(
                      (widget) =>
                          widget is GithubRepoItem && widget.repo == repo,
                    ),
                    findsOneWidget,
                  );
                }
              });
            },
            variant: TargetPlatformVariant.mobile(),
          );

          group(
            'pagination_widget',
            () {
              testWidgets(
                'should display paginate button '
                'when [GithubBloc] state is not [GithubState.loadingMore]',
                (WidgetTester tester) async {
                  await tester.runAsync(
                    () async {
                      await pumpLoadedGithubPage(tester);

                      expect(
                        mockGithubBloc!.state,
                        isNot(const GithubState.loadingMore()),
                      );

                      expect(
                        LoadedGithubPageFinders.paginateButton,
                        findsOneWidget,
                      );
                      expect(
                        LoadedGithubPageFinders.paginationIndicator,
                        findsNothing,
                      );
                    },
                  );
                },
                variant: TargetPlatformVariant.mobile(),
              );

              testWidgets(
                'should display pagination indicator '
                'when [GithubBloc] state is [GithubState.loadingMore]',
                (WidgetTester tester) async {
                  await tester.runAsync(
                    () async {
                      whenListen(
                        mockGithubBloc!,
                        Stream.value(const GithubState.loadingMore()),
                        initialState: const GithubState.userWithReposLoaded(
                          fetchedUser,
                          fetchedSearchReposThatCanLoadMore,
                          canLoadMore: true,
                        ),
                      );

                      await pumpLoadedGithubPage(tester);
                      await tester.pump();

                      expect(
                        LoadedGithubPageFinders.paginateButton,
                        findsNothing,
                      );
                      expect(
                        LoadedGithubPageFinders.paginationIndicator,
                        findsOneWidget,
                      );
                    },
                  );
                },
                variant: TargetPlatformVariant.mobile(),
              );

              testWidgets(
                'should add [GithubEvent.paginate] '
                'when tapping on paginate button',
                (WidgetTester tester) async {
                  await tester.runAsync(
                    () async {
                      await pumpLoadedGithubPage(tester);

                      await tester.tap(LoadedGithubPageFinders.paginateButton);
                      await tester.pump();

                      verify(
                        () => mockGithubBloc!.add(const GithubEvent.paginate()),
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

      group(
        'empty_list_widget',
        () {
          testWidgets(
            'should display [RefreshingEmptyWidget] '
            'when [GithubBloc] state is [GithubState.refreshing]',
            (WidgetTester tester) async {
              await tester.runAsync(() async {
                whenListen(
                  mockGithubBloc!,
                  Stream.value(const GithubState.refreshing()),
                );

                await pumpLoadedGithubPage(
                  tester,
                  githubSearchRepos: fetchedEmptySearchRepos,
                  canLoadMore: false,
                );
                await tester.pump();

                expect(find.byType(RefreshingEmptyWidget), findsOneWidget);
                expect(find.byType(LoadedEmptyWidget), findsNothing);
              });
            },
            variant: TargetPlatformVariant.mobile(),
          );

          testWidgets(
            'should display [LoadedEmptyWidget] '
            'when [GithubBloc] state is NOT [GithubState.refreshing]',
            (WidgetTester tester) async {
              await tester.runAsync(() async {
                await pumpLoadedGithubPage(
                  tester,
                  githubSearchRepos: fetchedEmptySearchRepos,
                  canLoadMore: false,
                );

                expect(
                  mockGithubBloc!.state,
                  isNot(const GithubState.refreshing()),
                );

                expect(find.byType(RefreshingEmptyWidget), findsNothing);
                expect(find.byType(LoadedEmptyWidget), findsOneWidget);
              });
            },
            variant: TargetPlatformVariant.mobile(),
          );

          testWidgets(
            'should add [GithubEvent.getUserAndRepos] '
            'when [LoadedEmptyWidget] is displayed '
            'and tapping on refresh button',
            (WidgetTester tester) async {
              await tester.runAsync(() async {
                await pumpLoadedGithubPage(
                  tester,
                  githubSearchRepos: fetchedEmptySearchRepos,
                  canLoadMore: false,
                );

                await tester
                    .tap(LoadedGithubPageFinders.emptyListRefreshButton);
                await tester.pump();

                verify(
                  () => mockGithubBloc!.add(
                    const GithubEvent.getUserAndRepos(
                      name: 'GdonatasG',
                      isRefresh: true,
                    ),
                  ),
                ).called(1);
              });
            },
            variant: TargetPlatformVariant.mobile(),
          );
        },
      );
    },
  );
}
