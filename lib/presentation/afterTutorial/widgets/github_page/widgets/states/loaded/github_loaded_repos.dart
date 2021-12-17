import 'package:dportfolio_v2/application/github_bloc/github_bloc.dart';
import 'package:dportfolio_v2/domain/github/github_search_repos.dart';
import 'package:dportfolio_v2/presentation/core/app_dimensions.dart';
import 'package:dportfolio_v2/presentation/core/locale_keys.dart';
import 'package:flutter/material.dart';
import 'package:ez_localization/src/extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'github_repo_item.dart';

class GithubLoadedRepos extends StatefulWidget {
  final GithubSearchRepos githubSearchRepos;
  final bool canLoadMore;

  const GithubLoadedRepos({
    Key? key,
    required this.githubSearchRepos,
    required this.canLoadMore,
  }) : super(key: key);

  @override
  _GithubLoadedReposState createState() => _GithubLoadedReposState();
}

class _GithubLoadedReposState extends State<GithubLoadedRepos> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (ctx, i) => i == widget.githubSearchRepos.items!.length &&
                widget.canLoadMore
            ? Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(
                    10.0,
                  ),
                  child: BlocBuilder<GithubBloc, GithubState>(
                    builder: (ctx, state) => state.maybeMap(
                      loadingMore: (_) => const CircularProgressIndicator(
                        strokeWidth:
                            AppDimensions.CIRCULAR_PROGRESS_INDICATOR_STROKE,
                      ),
                      orElse: () => OutlinedButton(
                        onPressed: () {
                          BlocProvider.of<GithubBloc>(context)
                              .add(const GithubEvent.paginate());
                        },
                        child: Text(
                          context.getString(LocaleKeys.LOAD_MORE).toUpperCase(),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : i <
                    (widget.canLoadMore
                        ? widget.githubSearchRepos.items!.length
                        : widget.githubSearchRepos.items!.length - 1)
                ? Column(
                    children: [
                      GithubRepoItem(repo: widget.githubSearchRepos.items![i]),
                      const Divider(
                        height: 1.0,
                      )
                    ],
                  )
                : GithubRepoItem(repo: widget.githubSearchRepos.items![i]),
        childCount: widget.canLoadMore
            ? widget.githubSearchRepos.items!.length + 1
            : widget.githubSearchRepos.items!.length,
      ),
    );
  }
}
