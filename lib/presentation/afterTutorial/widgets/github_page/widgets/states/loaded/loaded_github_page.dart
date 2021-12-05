import 'package:dportfolio_v2/application/github_bloc/github_bloc.dart';
import 'package:dportfolio_v2/domain/github/github_user_data.dart';
import 'package:dportfolio_v2/presentation/core/app_dimensions.dart';
import 'package:dportfolio_v2/presentation/core/locale_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ez_localization/src/extension.dart';

import 'empty_list_widget.dart';
import 'loaded_sliver_app_bar.dart';
import 'repos_with_sticky_header_widget.dart';

class LoadedGithubPage extends StatefulWidget {
  final GithubUserData githubUserData;

  const LoadedGithubPage({
    Key? key,
    required this.githubUserData,
  }) : super(key: key);

  @override
  _LoadedGithubPageState createState() => _LoadedGithubPageState();
}

class _LoadedGithubPageState extends State<LoadedGithubPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GithubBloc, GithubState>(
      listenWhen: (previous, current) => current.maybeWhen(
        refreshError: (_) => true,
        orElse: () => false,
      ),
      listener: (ctx, state) {
        state.maybeMap(
          refreshError: (s) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(context.getString(LocaleKeys.ERROR_TRY_AGAIN)),
              ),
            );
          },
          orElse: () {},
        );
      },
      child: Container(
        color: Theme.of(context).primaryColor,
        child: SafeArea(
          child: Scaffold(
            body: NestedScrollView(
              physics: const BouncingScrollPhysics(),
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverSafeArea(
                    top: false,
                    sliver: LoadedSliverAppBar(
                      githubUser: widget.githubUserData.user,
                    ),
                  ),
                ),
              ],
              body: BlocBuilder<GithubBloc, GithubState>(
                buildWhen: (previous, current) => current.maybeWhen(
                  listFiltered: (_) => true,
                  orElse: () => false,
                ),
                builder: (context, state) {
                  return state.maybeMap(
                    listFiltered: (s) {
                      return s.listOfFilteredRepos.isNotEmpty
                          ? ReposWithStickyHeaderWidget(
                              listOfRepos: s.listOfFilteredRepos,
                            )
                          : EmptyListWidget();
                    },
                    orElse: () => const Center(
                      child: CircularProgressIndicator(
                        strokeWidth:
                            AppDimensions.CIRCULAR_PROGRESS_INDICATOR_STROKE,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
