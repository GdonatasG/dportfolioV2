import 'package:dportfolio_v2/presentation/core/app_dimensions.dart';
import 'package:flutter/material.dart';

import 'loading_sliver_app_bar.dart';

class GithubLoadingStateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) => [
              const LoadingSliverAppBar(),
            ],
            body: const CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(
                      strokeWidth:
                          AppDimensions.CIRCULAR_PROGRESS_INDICATOR_STROKE,
                    ),
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
