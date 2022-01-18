import 'package:dportfolio_v2/application/github_bloc/github_bloc.dart';
import 'package:dportfolio_v2/injection.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/widgets/states/error/github_error_state_widget.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/widgets/states/loading/github_loading_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/states/loaded/loaded_github_page.dart';

const GITHUB_PAGE_APP_BAR_HEIGHT = 260.0;

class GithubPage extends StatelessWidget {
  const GithubPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (c) => getIt<GithubBloc>()
        ..add(
          const GithubEvent.getUserAndRepos(name: 'GdonatasG'),
        ),
      child: BlocBuilder<GithubBloc, GithubState>(
        buildWhen: (p, c) => c.maybeMap(
          initial: (_) => true,
          loading: (_) => true,
          userWithReposLoaded: (_) => true,
          initialLoadingError: (_) => true,
          orElse: () => false,
        ),
        builder: (ctx, s) => s.maybeMap(
          initial: (_) => const GithubLoadingWidget(),
          loading: (_) => const GithubLoadingWidget(),
          userWithReposLoaded: (s) => LoadedGithubPage(
            githubUser: s.githubUser,
            githubSearchRepos: s.githubSearchRepos,
            canLoadMore: s.canLoadMore,
          ),
          initialLoadingError: (_) => GithubErrorStateWidget(),
          orElse: () => Container(),
        ),
      ),
    );
  }
}
