import 'package:auto_route/auto_route.dart';
import 'package:dportfolio_v2/domain/github/github_user.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/github_page.dart';
import 'package:ez_localization/src/extension.dart';
import 'package:dportfolio_v2/presentation/core/locale_keys.dart';
import 'package:dportfolio_v2/presentation/core/widgets/sabt.dart';
import 'package:dportfolio_v2/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';

class LoadedSliverAppBar extends StatefulWidget {
  final GithubUser githubUser;

  const LoadedSliverAppBar({
    Key? key,
    required this.githubUser,
  }) : super(key: key);

  @override
  _LoadedSliverAppBarState createState() => _LoadedSliverAppBarState();
}

class _LoadedSliverAppBarState extends State<LoadedSliverAppBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: GITHUB_PAGE_APP_BAR_HEIGHT,
      centerTitle: true,
      pinned: true,
      forceElevated: true,
      title: const SABT(
        child: Text(
          'Github',
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60.0,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              backgroundImage: NetworkImage(widget.githubUser.avatar_url ?? ''),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              widget.githubUser.login ?? '',
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    fontFamily: "ComicSansMs",
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                context.router.push(
                  CustomWebViewRoute(url: widget.githubUser.html_url ?? ''),
                );
              },
              child: Text(
                context.getString(LocaleKeys.VISIT_PROFILE),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
