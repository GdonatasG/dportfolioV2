import 'package:dportfolio_v2/application/github_bloc/github_bloc.dart';
import 'package:dportfolio_v2/presentation/core/app_dimensions.dart';
import 'package:dportfolio_v2/presentation/core/extensions/app_data_extensions.dart';
import 'package:dportfolio_v2/presentation/core/locale_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmptyListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<GithubBloc, GithubState>(
        buildWhen: (previous, current) => current.maybeWhen(
          loading: () => true,
          refreshing: () => true,
          listFiltered: (_) => true,
          refreshError: (_) => true,
          orElse: () => false,
        ),
        builder: (context, state) {
          return state.maybeMap(
            loading: (_) => RefreshingEmptyWidget(),
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
        Text('${context.getString(LocaleKeys.NOTHING_FOUND)} 🙁',
            style: Theme.of(context).textTheme.bodyText1),
        const SizedBox(
          height: 10,
        ),
        // data reload button
        RaisedButton(
          onPressed: () {
            context
                .bloc<GithubBloc>()
                .add(const GithubEvent.getUserDataByName('GdonatasG', true));
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
