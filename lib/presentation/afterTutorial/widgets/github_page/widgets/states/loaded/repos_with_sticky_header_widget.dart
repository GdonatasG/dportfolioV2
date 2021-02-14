import 'package:dportfolio_v2/application/github_bloc/github_bloc.dart';
import 'package:dportfolio_v2/domain/github/github_repo.dart';
import 'package:dportfolio_v2/presentation/core/locale_keys.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:dportfolio_v2/presentation/core/extensions/app_data_extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'github_repo_item.dart';
import 'sticky_header_widget.dart';

class ReposWithStickyHeaderWidget extends StatefulWidget {
  final List<GithubRepo> listOfRepos;

  const ReposWithStickyHeaderWidget({Key key, @required this.listOfRepos})
      : super(key: key);

  @override
  _ReposWithStickyHeaderWidgetState createState() =>
      _ReposWithStickyHeaderWidgetState();
}

class _ReposWithStickyHeaderWidgetState
    extends State<ReposWithStickyHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return StickyHeader(
      overlapHeaders: true,
      header: StickyHeaderWidget(
        title: context.getString(
            LocaleKeys.REPOS_TITLE, {'repos': widget.listOfRepos.length}),
      ),
      content: RefreshIndicator(
        onRefresh: () {
          context
              .bloc<GithubBloc>()
              .add(const GithubEvent.getUserDataByName('GdonatasG', true));

          return context
              .bloc<GithubBloc>()
              .firstWhere((element) => element.maybeMap(
                    refreshError: (_) => true,
                    listFiltered: (_) => true,
                    orElse: () => false,
                  ));
        },
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          // adding const (equals to [StickyHeader] height) top padding, because [StickyHeader] has overlap
          padding: const EdgeInsets.only(top: STICKY_HEADER_HEIGHT),
          separatorBuilder: (context, index) => const Divider(
            height: 1.0,
          ),
          itemCount: widget.listOfRepos.length,
          itemBuilder: (context, i) =>
              GithubRepoItem(repo: widget.listOfRepos[i]),
        ),
      ),
    );
  }
}
