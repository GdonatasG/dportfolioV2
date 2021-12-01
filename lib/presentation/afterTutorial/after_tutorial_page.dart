import 'package:dportfolio_v2/presentation/afterTutorial/misc/current_bottom_bar_page.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/about_me_page/about_me_page.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/bottom_navigation_bar.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/contact_page/contact_page.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/github_page.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/portfolio_page/portfolio_page.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/settings_page/settings_page.dart';
import 'package:dportfolio_v2/presentation/core/themes/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/misc/build_context_x.dart';
import 'package:dportfolio_v2/presentation/core/extensions/theme_extensions.dart';

class AfterTutorialPage extends StatefulWidget {
  @override
  _AfterTutorialPageState createState() => _AfterTutorialPageState();
}

class _AfterTutorialPageState extends State<AfterTutorialPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Widget> _pages = [
    const AboutMePage(),
    const PortfolioPage(),
    const ContactPage(),
    const GithubPage(),
    const SettingsPage()
  ];

  @override
  void initState() {
    _tabController = TabController(length: _pages.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = context.getCurrentTheme;
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).primaryColor,
          statusBarIconBrightness:
              Theme.of(context).brightness == Brightness.light
                  ? Brightness.dark
                  : Brightness.light,
          /*currentTheme == themeLight ? Brightness.dark : Brightness.light,*/
          statusBarBrightness: Theme.of(context).brightness,
        ),
        child: Scaffold(
          bottomNavigationBar: BottomBar(),
          body: Consumer<CurrentBottomBarPage>(
              builder: (context, currentPage, child) {
            _tabController.index = context.currentPage;
            return TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: _pages,
            );
          }),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() async {
    if (context.currentPage != 0) {
      setState(() {
        context.currentPage = 0;
      });
      return false;
    }
    return true;
  }
}
