import 'package:dportfolio_v2/application/github_bloc/github_bloc.dart';
import 'package:dportfolio_v2/presentation/core/app_dimensions.dart';
import 'package:dportfolio_v2/presentation/core/locale_keys.dart';
import "package:ez_localization/src/extension.dart";
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmptyListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<GithubBloc, GithubState>(
        builder: (context, state) {
          return state.maybeMap(
            refreshing: (_) => RefreshingEmptyWidget(),
            orElse: () => LoadedEmptyWidget(),
          );
        },
      ),
    );
  }
}

class RefreshingEmptyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      strokeWidth: AppDimensions.CIRCULAR_PROGRESS_INDICATOR_STROKE,
    );
  }
}

class LoadedEmptyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${context.getString(LocaleKeys.NOTHING_FOUND)} 🙁',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        const SizedBox(
          height: 10,
        ),
        // data reload button
        ElevatedButton(
          onPressed: () {
            BlocProvider.of<GithubBloc>(context).add(
              const GithubEvent.getUserAndRepos(
                name: 'GdonatasG',
                isRefresh: true,
              ),
            );
          },
          child: Text(
            context.getString(LocaleKeys.REFRESH),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
