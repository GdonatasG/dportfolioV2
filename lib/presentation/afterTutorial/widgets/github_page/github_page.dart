import 'package:dportfolio_v2/application/github_bloc/github_bloc.dart';
import 'package:dportfolio_v2/injection.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/widgets/states/error/github_error_state_widget.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/widgets/states/loading/github_loading_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/states/loaded/loaded_github_page.dart';

// ignore: constant_identifier_names
const GITHUB_PAGE_APP_BAR_HEIGHT = 260.0;

class GithubPage extends StatefulWidget {
  const GithubPage();

  @override
  _GithubPageState createState() => _GithubPageState();
}

class _GithubPageState extends State<GithubPage>
    with AutomaticKeepAliveClientMixin {
  @override
  // ignore: avoid_void_async
  void didChangeDependencies() async {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (c) => getIt<GithubBloc>()
        ..add(const GithubEvent.getUserDataByName('GdonatasG', false)),
      child: BlocBuilder<GithubBloc, GithubState>(
        buildWhen: (p, c) => c.maybeWhen(
          initial: () => true,
          loading: () => true,
          userDataLoaded: (_) => true,
          userDataLoadingError: (_) => true,
          orElse: () => false,
        ),
        builder: (ctx, state) {
          return state.maybeMap(
            initial: (_) => GithubLoadingStateWidget(),
            loading: (_) => GithubLoadingStateWidget(),
            userDataLoaded: (state) {
              return LoadedGithubPage(
                githubUserData: state.githubUserData,
              );
            },
            userDataLoadingError: (_) => GithubErrorStateWidget(),
            orElse: () => Container(),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
