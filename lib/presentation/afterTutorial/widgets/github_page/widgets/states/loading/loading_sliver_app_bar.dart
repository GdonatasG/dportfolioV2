import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/github_page.dart';
import 'package:dportfolio_v2/presentation/core/widgets/sabt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingSliverAppBar extends StatefulWidget {
  const LoadingSliverAppBar({Key? key}) : super(key: key);

  @override
  _LoadingSliverAppBarState createState() => _LoadingSliverAppBarState();
}

class _LoadingSliverAppBarState extends State<LoadingSliverAppBar>
    with TickerProviderStateMixin {
  late AnimationController animation;

  @override
  void initState() {
    animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animation.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animation.forward();
      }
    });
    animation.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: GITHUB_PAGE_APP_BAR_HEIGHT,
      centerTitle: true,
      pinned: true,
      forceElevated: true,
      title: SABT(
        child: Text(
          'Github',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: animation.drive(CurveTween(curve: Curves.easeOut)),
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            FadeTransition(
              opacity: animation.drive(CurveTween(curve: Curves.easeOut)),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 80.0),
                height: 20.0,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            FadeTransition(
              opacity: animation.drive(CurveTween(curve: Curves.easeOut)),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 120.0),
                height: 20.0,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }
}
