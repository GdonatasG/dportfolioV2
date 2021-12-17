import 'package:dportfolio_v2/application/github_bloc/github_bloc.dart';
import 'package:dportfolio_v2/domain/github/github_search_repos.dart';
import 'package:dportfolio_v2/domain/github/github_user.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/widgets/states/loaded/empty_list_widget.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/widgets/states/loaded/github_loaded_repos.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/widgets/states/loaded/sticky_header_widget.dart';
import 'package:dportfolio_v2/presentation/core/locale_keys.dart';
import 'package:dportfolio_v2/presentation/core/utils/always_disabled_focus_node.dart';
import 'package:dportfolio_v2/presentation/routes/router.gr.dart';
import 'package:ez_localization/src/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import 'loaded_sliver_app_bar.dart';

class LoadedGithubPage extends StatefulWidget {
  const LoadedGithubPage({
    Key? key,
  }) : super(key: key);

  @override
  _LoadedGithubPageState createState() => _LoadedGithubPageState();
}

class _LoadedGithubPageState extends State<LoadedGithubPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GithubBloc, GithubState>(
      listenWhen: (previous, current) => current.maybeWhen(
        userWithReposLoaded: (u, r, f, _) => f != null,
        loadingMoreError: (_) => true,
        orElse: () => false,
      ),
      listener: (ctx, state) {
        state.maybeMap(
          userWithReposLoaded: (s) {
            if (s.failure != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    context.getString(LocaleKeys.ERROR_TRY_AGAIN),
                  ),
                ),
              );
            }
          },
          loadingMoreError: (s) {
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
      buildWhen: (previous, current) => current.maybeWhen(
        userWithReposLoaded: (u, r, f, _) => true,
        orElse: () => false,
      ),
      builder: (ctx, state) => state.maybeMap(
        userWithReposLoaded: (s) => Container(
          color: Theme.of(context).primaryColor,
          child: SafeArea(
            child: Scaffold(
              body: _body(
                  context, s.githubSearchRepos, s.githubUser, s.canLoadMore),
            ),
          ),
        ),
        orElse: () => Container(),
      ),
    );
  }

  Widget _body(
    BuildContext context,
    GithubSearchRepos githubSearchRepos,
    GithubUser githubUser,
    bool canLoadMore,
  ) =>
      RefreshIndicator(
        onRefresh: () {
          BlocProvider.of<GithubBloc>(context).add(
            const GithubEvent.getUserAndRepos(
              name: 'GdonatasG',
              isRefresh: true,
            ),
          );

          return BlocProvider.of<GithubBloc>(context).stream.firstWhere(
                (element) => element.maybeMap(
                  userWithReposLoaded: (_) => true,
                  orElse: () => false,
                ),
              );
        },
        child: CustomScrollView(
          slivers: [
            LoadedSliverAppBar(
              githubUser: githubUser,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 10.0,
                ),
                child: _searchTextField(context),
              ),
            ),
            if (githubSearchRepos.items?.isNotEmpty ?? false)
              SliverStickyHeader(
                header: StickyHeaderWidget(
                  title: context.getString(
                    LocaleKeys.REPOS_TITLE,
                    {
                      'repos': githubSearchRepos.total_count ??
                          githubSearchRepos.items?.length ??
                          0
                    },
                  ),
                ),
                sliver: GithubLoadedRepos(
                  githubSearchRepos: githubSearchRepos,
                  canLoadMore: canLoadMore,
                ),
              )
            else
              SliverFillRemaining(
                hasScrollBody: false,
                child: EmptyListWidget(),
              )
          ],
        ),
      );

  TextField _searchTextField(BuildContext context) => TextField(
        focusNode: AlwaysDisabledFocusNode(),
        onTap: () {
          context.router.push(GithubSearchPageRoute(username: 'GdonatasG'));
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          hintText: context.getString(LocaleKeys.GITHUB_SEARCH_HINT),
          fillColor: Theme.of(context).brightness == Brightness.dark
              ? Theme.of(context).primaryColor
              : Theme.of(context).primaryColorDark,
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
