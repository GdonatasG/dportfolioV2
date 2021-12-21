import 'package:auto_route/auto_route.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/bottom_navigation_bar.dart';
import 'package:dportfolio_v2/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AfterTutorialPage extends StatefulWidget {
  @override
  _AfterTutorialPageState createState() => _AfterTutorialPageState();
}

class _AfterTutorialPageState extends State<AfterTutorialPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).primaryColor,
        statusBarIconBrightness:
            Theme.of(context).brightness == Brightness.light
                ? Brightness.dark
                : Brightness.light,
        statusBarBrightness: Theme.of(context).brightness,
      ),
      child: AutoTabsRouter(
        routes: const [
          AboutMePageRoute(),
          PortfolioPageRoute(),
          ContactPageRoute(),
          GithubPageWrapperRouter(),
          SettingsPageWrapperRouter(),
        ],
        builder: (routerContext, child, animation) {
          final tabsRouter = routerContext.tabsRouter;
          return WillPopScope(
            onWillPop: () async {
              if (tabsRouter.activeIndex > 0) {
                tabsRouter.setActiveIndex(0);
                return false;
              }
              return true;
            },
            child: Scaffold(
              body: FadeTransition(
                opacity: animation,
                child: child,
              ),
              bottomNavigationBar: BottomNavBar(tabsRouter),
            ),
          );
        },
      ),
    );
  }
}
