import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:collection/src/list_extensions.dart';
import 'package:dportfolio_v2/application/github_search_bloc/github_search_bloc.dart';
import 'package:dportfolio_v2/domain/github/github_failure.dart';
import 'package:dportfolio_v2/domain/github/github_search_repos.dart';
import 'package:dportfolio_v2/injection.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/widgets/states/loaded/github_repo_item.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/widgets/states/loaded/sticky_header_widget.dart';
import 'package:dportfolio_v2/presentation/core/app_dimensions.dart';
import 'package:dportfolio_v2/presentation/core/debouncer.dart';
import 'package:dportfolio_v2/presentation/core/locale_keys.dart';
import 'package:ez_localization/src/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class GithubSearchPage extends StatelessWidget {
  final String username;

  const GithubSearchPage({
    Key? key,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GithubSearchBloc>(
      create: (c) => getIt<GithubSearchBloc>(param1: 'GdonatasG'),
      child: const GithubSearchView(),
    );
  }
}

class GithubSearchView extends StatefulHookWidget {
  const GithubSearchView({Key? key}) : super(key: key);

  @override
  _GithubSearchViewState createState() => _GithubSearchViewState();
}

class _GithubSearchViewState extends State<GithubSearchView> {
  final TextEditingController _searchController = TextEditingController();
  final Debounce _debounce = Debounce(const Duration(milliseconds: 500));

  @override
  void dispose() {
    _searchController.dispose();
    _debounce.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isGlobalSearch = useState(false);
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: _searchTextField(context),
            actions: [
              IconButton(
                icon: ValueListenableBuilder<int>(
                  valueListenable: BlocProvider.of<GithubSearchBloc>(context)
                      .languageIndexNotifier,
                  builder: (ctx, ind, _) => ind > 0
                      ? Icon(
                          Icons.filter_alt,
                          color: Theme.of(context).colorScheme.secondary,
                        )
                      : const Icon(
                          Icons.filter_alt,
                        ),
                ),
                onPressed: () {
                  _showLanguageSelector(context);
                },
              ),
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                ),
                child: Row(
                  children: [
                    Text(
                      context.getString(LocaleKeys.SEARCH_THROUGH_ALL_GITHUB),
                    ),
                    const SizedBox(
                      width: 3.0,
                    ),
                    Switch(
                      value: isGlobalSearch.value,
                      activeColor: Theme.of(context).colorScheme.secondary,
                      onChanged: (isGlobal) {
                        isGlobalSearch.value = isGlobal;
                        BlocProvider.of<GithubSearchBloc>(context).add(
                          GithubSearchEvent.searchTypeChanged(
                            isGlobal: isGlobal,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 1.0,
              ),
              Expanded(
                child: BlocBuilder<GithubSearchBloc, GithubSearchState>(
                  buildWhen: (p, c) => c.maybeMap(
                    initial: (_) => true,
                    searching: (_) => true,
                    searched: (_) => true,
                    searchingError: (_) => true,
                    orElse: () => false,
                  ),
                  builder: (ctx, state) => state.maybeMap(
                    initial: (_) => const InitialSearchWidget(),
                    searching: (_) => const Center(
                      child: CircularProgressIndicator(
                        strokeWidth:
                            AppDimensions.CIRCULAR_PROGRESS_INDICATOR_STROKE,
                      ),
                    ),
                    searched: (s) {
                      if (s.githubSearchRepos.items?.isNotEmpty ?? false) {
                        return LoadedSearchWidget(
                          canLoadMore: s.canLoadMore,
                          githubSearchRepos: s.githubSearchRepos,
                        );
                      } else {
                        return const EmptySearchWidget();
                      }
                    },
                    searchingError: (s) => SearchErrorWidget(
                      failure: s.failure,
                    ),
                    orElse: () => const InitialSearchWidget(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLanguageSelector(
    BuildContext context,
  ) {
    showAdaptiveActionSheet(
      context: context,
      title: Text(
        context.getString(LocaleKeys.TITLE_SELECT_LANGUAGE),
        style: Theme.of(context).textTheme.headline6,
      ),
      actions: BlocProvider.of<GithubSearchBloc>(context)
          .getFilterOptions
          .mapIndexed(
            (index, language) => BottomSheetAction(
              trailing: ValueListenableBuilder<int>(
                valueListenable: BlocProvider.of<GithubSearchBloc>(context)
                    .languageIndexNotifier,
                builder: (ctx, ind, _) {
                  return ind == index
                      ? const Icon(Icons.check)
                      : const SizedBox.shrink();
                },
              ),
              title: Text(
                index == 0 ? context.getString(language) : language,
                style: Theme.of(context).textTheme.headline4,
              ),
              onPressed: () {
                BlocProvider.of<GithubSearchBloc>(context).add(
                  GithubSearchEvent.languageChanged(
                    index: index,
                  ),
                );
                context.router.pop();
              },
            ),
          )
          .toList(),
      cancelAction: CancelAction(
        title: Text(
          context.getString(LocaleKeys.BTN_CANCEL),
        ),
      ), // onPressed parameter is optional by default will dismiss the ActionSheet
    );
  }

  TextField _searchTextField(BuildContext context) => TextField(
        controller: _searchController,
        autofocus: true,
        onChanged: (val) {
          setState(() {});
          _debounce(() {
            BlocProvider.of<GithubSearchBloc>(context).add(
              GithubSearchEvent.queryChanged(query: val),
            );
          });
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    _searchController.clear();
                    setState(() {});
                    BlocProvider.of<GithubSearchBloc>(context).add(
                      const GithubSearchEvent.queryChanged(query: ''),
                    );
                  },
                  icon: const Icon(Icons.clear),
                )
              : null,
          hintText: context.getString(LocaleKeys.GITHUB_SEARCH_HINT),
          fillColor: Theme.of(context).primaryColorDark,
          filled: true,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide.none,
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide.none,
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
        ),
      );
}

class SearchErrorWidget extends StatelessWidget {
  final GithubFailure failure;

  const SearchErrorWidget({
    Key? key,
    required this.failure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Icon(
              Icons.error_outline,
              size: 40.0,
            ),
            Text(
              context.getString(LocaleKeys.ERROR_TRY_AGAIN),
            ),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<GithubSearchBloc>(context)
                    .add(const GithubSearchEvent.retrySearch());
              },
              child: Text(context.getString(LocaleKeys.TRY_AGAIN)),
            )
          ],
        ),
      ),
    );
  }
}

class InitialSearchWidget extends StatelessWidget {
  const InitialSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Icon(
              Icons.library_books_rounded,
              size: 40.0,
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              context.getString(LocaleKeys.GITHUB_SEARCH_PAGE_INITIAL),
            )
          ],
        ),
      ),
    );
  }
}

class EmptySearchWidget extends StatelessWidget {
  const EmptySearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${context.getString(LocaleKeys.NOTHING_FOUND)} 🙁',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            // data reload button
          ],
        ),
      ),
    );
  }
}

class LoadedSearchWidget extends StatefulWidget {
  final bool canLoadMore;
  final GithubSearchRepos githubSearchRepos;

  const LoadedSearchWidget({
    Key? key,
    required this.canLoadMore,
    required this.githubSearchRepos,
  }) : super(key: key);

  @override
  State<LoadedSearchWidget> createState() => _LoadedSearchWidgetState();
}

class _LoadedSearchWidgetState extends State<LoadedSearchWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GithubSearchBloc, GithubSearchState>(
      listener: (ctx, state) {
        state.maybeMap(
          loadingMoreError: (_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  context.getString(LocaleKeys.ERROR_TRY_AGAIN),
                ),
              ),
            );
          },
          orElse: () {},
        );
      },
      child: Column(
        children: [
          StickyHeaderWidget(
            title: context.getString(
              LocaleKeys.REPOS_TITLE,
              {
                'repos': widget.githubSearchRepos.total_count ??
                    widget.githubSearchRepos.items?.length ??
                    0
              },
            ),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                height: 1.0,
              ),
              itemCount: widget.canLoadMore
                  ? widget.githubSearchRepos.items!.length + 1
                  : widget.githubSearchRepos.items!.length,
              itemBuilder: (context, i) => i ==
                          widget.githubSearchRepos.items!.length &&
                      widget.canLoadMore
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(
                          10.0,
                        ),
                        child: BlocBuilder<GithubSearchBloc, GithubSearchState>(
                          builder: (ctx, state) => state.maybeMap(
                            loadingMore: (_) => const CircularProgressIndicator(
                              strokeWidth: AppDimensions
                                  .CIRCULAR_PROGRESS_INDICATOR_STROKE,
                            ),
                            orElse: () => OutlinedButton(
                              onPressed: () {
                                BlocProvider.of<GithubSearchBloc>(context)
                                    .add(const GithubSearchEvent.paginate());
                              },
                              child: Text(
                                context
                                    .getString(LocaleKeys.LOAD_MORE)
                                    .toUpperCase(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : GithubRepoItem(
                      repo: widget.githubSearchRepos.items![i],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
