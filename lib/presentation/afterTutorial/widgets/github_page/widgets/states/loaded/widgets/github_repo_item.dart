import 'package:auto_route/auto_route.dart';
import 'package:dportfolio_v2/domain/github/github_repo.dart';
import 'package:dportfolio_v2/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class GithubRepoItem extends StatelessWidget {
  final GithubRepo repo;

  const GithubRepoItem({
    Key? key,
    required this.repo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
      leading: SizedBox(
        height: double.infinity,
        child: IconTheme(
          data: Theme.of(context).iconTheme,
          child: const Icon(
            FontAwesome5.file_archive,
          ),
        ),
      ),
      title: Text(
        repo.name ?? '',
        style: Theme.of(context)
            .textTheme
            .headline4
            ?.copyWith(fontWeight: FontWeight.w500, fontSize: 15.5),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      subtitle: Text(
        repo.language ?? '',
        style: Theme.of(context).textTheme.subtitle2?.copyWith(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w400,
            ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: IconTheme(
        data: Theme.of(context).iconTheme,
        child: const Icon(
          Icons.arrow_forward,
        ),
      ),
      onTap: () {
        context.router.push(CustomWebViewRoute(url: repo.html_url ?? ''));
      },
    );
  }
}
