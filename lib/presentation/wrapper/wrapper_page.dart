import 'package:auto_route/auto_route.dart';
import 'package:dportfolio_v2/application/wrapper_bloc/wrapper_bloc.dart';
import 'package:dportfolio_v2/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WrapperPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<WrapperBloc, WrapperState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          tutorial: (_) =>
              ExtendedNavigator.of(context).replace(Routes.tutorialPage),
          afterTutorial: (_) =>
              ExtendedNavigator.of(context).replace(Routes.afterTutorialPage),
        );
      },
      child: Scaffold(
        body: Container(),
      ),
    );
  }
}
