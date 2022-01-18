import 'package:auto_route/auto_route.dart';
import 'package:dportfolio_v2/application/wrapper_bloc/wrapper_bloc.dart';
import 'package:dportfolio_v2/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WrapperPage extends StatelessWidget {
  const WrapperPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<WrapperBloc, WrapperState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          tutorial: (_) => context.router.replace(const TutorialPageRoute()),
          afterTutorial: (_) =>
              context.router.replace(const AfterTutorialPageRoute()),
        );
      },
      child: Scaffold(
        body: Container(),
      ),
    );
  }
}
