import 'package:dportfolio_v2/application/github_bloc/github_bloc.dart';
import 'package:ez_localization/src/extension.dart';
import 'package:dportfolio_v2/presentation/core/locale_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GithubErrorStateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.getString(LocaleKeys.ERROR_TRY_AGAIN),
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
                      ),
                    );
                  },
                  child: Text(
                    context.getString(LocaleKeys.TRY_AGAIN),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
