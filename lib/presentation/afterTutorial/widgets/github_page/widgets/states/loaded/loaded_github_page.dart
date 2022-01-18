import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dportfolio_v2/application/github_bloc/github_bloc.dart';
import 'package:dportfolio_v2/domain/github/github_search_repos.dart';
import 'package:dportfolio_v2/domain/github/github_user.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/widgets/states/loaded/core/loaded_github_page_keys.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/widgets/states/loaded/widgets/empty_list_widget.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/widgets/states/loaded/widgets/github_loaded_repos.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/widgets/states/loaded/widgets/sticky_header_widget.dart';
import 'package:dportfolio_v2/presentation/core/locale_keys.dart';
import 'package:dportfolio_v2/presentation/core/utils/always_disabled_focus_node.dart';
import 'package:dportfolio_v2/presentation/routes/router.gr.dart';
import 'package:ez_localization/src/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import 'widgets/loaded_sliver_app_bar.dart';

class LoadedGithubPage extends StatelessWidget {
  final GithubUser githubUser;
  final GithubSearchRepos githubSearchRepos;
  final bool canLoadMore;

  const LoadedGithubPage({
    Key? key,
    required this.githubUser,
    required this.githubSearchRepos,
    required this.canLoadMore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<GithubBloc, GithubState>(
      listenWhen: (previous, current) => current.maybeWhen(
        userWithReposLoaded: (u, r, f, _) => f != null,
        loadingMoreError: (_) => true,
        orElse: () => false,
      ),
      listener: (ctx, state) {
        state.maybeMap(
          userWithReposLoaded: (s) {
            if (s.failure != null) {
              FlushbarHelper.createError(
                message: context.getString(LocaleKeys.ERROR_TRY_AGAIN),
              ).show(context);
            }
          },
          loadingMoreError: (s) {
            FlushbarHelper.createError(
              message: context.getString(LocaleKeys.ERROR_TRY_AGAIN),
            ).show(context);
          },
          orElse: () {},
        );
      },
      child: Container(
        color: Theme.of(context).primaryColor,
        child: SafeArea(
          child: Scaffold(
            body: LoadedGithubPageBody(
              githubUser: githubUser,
              githubSearchRepos: githubSearchRepos,
              canLoadMore: canLoadMore,
            ),
          ),
        ),
      ),
    );
  }
}

class LoadedGithubPageBody extends StatelessWidget {
  final GithubUser githubUser;
  final GithubSearchRepos githubSearchRepos;
  final bool canLoadMore;

  const LoadedGithubPageBody({
    Key? key,
    required this.githubUser,
    required this.githubSearchRepos,
    required this.canLoadMore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: const ValueKey(LoadedGithubPageKeys.REFRESH_INDICATOR),
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
                loadingMore: (_) => true,
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
              key: const ValueKey(
                LoadedGithubPageKeys.REPOS_COUNT_STICKY_HEADER,
              ),
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
              key:
                  const ValueKey(LoadedGithubPageKeys.EMPTY_LIST_WIDGET_SLIVER),
              hasScrollBody: false,
              child: EmptyListWidget(),
            )
        ],
      ),
    );
  }

  TextField _searchTextField(BuildContext context) {
    return TextField(
      key: const ValueKey(LoadedGithubPageKeys.SEARCH_TEXT_FIELD),
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
}
