import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class GithubLoadingWidget extends StatelessWidget {
  const GithubLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    children: [
                      LoadingShimmer(
                        baseColor: Theme.of(context).primaryColor,
                        highlightColor: Theme.of(context).primaryColorDark,
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      LoadingShimmer(
                        baseColor: Theme.of(context).primaryColor,
                        highlightColor: Theme.of(context).primaryColorDark,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 80.0),
                          height: 20.0,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4.0)),
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      LoadingShimmer(
                        baseColor: Theme.of(context).primaryColor,
                        highlightColor: Theme.of(context).primaryColorDark,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 120.0),
                          height: 20.0,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4.0)),
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  padding: const EdgeInsets.only(
                    top: 20.0,
                    bottom: 20.0,
                  ),
                  separatorBuilder: (ctx, i) => const SizedBox(
                    height: 20.0,
                  ),
                  itemBuilder: (ctx, i) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LoadingShimmer(
                                baseColor: Theme.of(context).primaryColor,
                                highlightColor:
                                    Theme.of(context).primaryColorDark,
                                child: Container(
                                  color: Theme.of(context).primaryColor,
                                  width: double.infinity,
                                  height: 12.0,
                                ),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              LoadingShimmer(
                                baseColor: Theme.of(context).primaryColor,
                                highlightColor:
                                    Theme.of(context).primaryColorDark,
                                child: Container(
                                  color: Theme.of(context).primaryColor,
                                  width: 70,
                                  height: 12.0,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        LoadingShimmer(
                          baseColor: Theme.of(context).primaryColor,
                          highlightColor: Theme.of(context).primaryColorDark,
                          child: Container(
                            color: Theme.of(context).primaryColor,
                            width: Theme.of(context).iconTheme.size,
                            height: Theme.of(context).iconTheme.size,
                          ),
                        )
                      ],
                    ),
                  ),
                  itemCount: 15,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoadingShimmer extends StatelessWidget {
  final Widget child;
  final Color baseColor;
  final Color highlightColor;

  const LoadingShimmer({
    Key? key,
    required this.child,
    required this.baseColor,
    required this.highlightColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: child,
    );
  }
}
