import 'package:ez_localization/src/extension.dart';
import 'package:dportfolio_v2/presentation/core/locale_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'tabItems/items_export.dart';
import 'tabItems/road_to_programming.dart';
import 'widgets/about_sliver_app_bar.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage();

  @override
  _AboutMePageState createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage>
    with SingleTickerProviderStateMixin {
  late List<Widget> tabItems;
  late List<Widget> tabContentItems;
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _initTabTitles();
    _initTabContent();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) => [
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: AboutSliverAppBar(
                  tabItems: tabItems,
                  tabController: _controller,
                ),
              ),
            ],
            body: TabBarView(
              controller: _controller,
              children: tabContentItems,
            ),
          ),
        ),
      ),
    );
  }

  // ignore: always_declare_return_types
  _initTabTitles() {
    final titleTab1 = context.getString(LocaleKeys.TITLE_ROAD_TO_PROGRAMMING);
    final titleTab2 = context.getString(LocaleKeys.TITLE_THE_BEGINNING);
    final titleTab3 = context.getString(LocaleKeys.TITLE_UNIVERSITY);
    final titleTab4 = context.getString(LocaleKeys.TITLE_GOALS);
    final titleTab5 = context.getString(LocaleKeys.TITLE_SKILLS);
    final titleTab6 = context.getString(LocaleKeys.TITLE_EDUCATION);
    tabItems = [
      if (titleTab1 != null)
        Tab(
          child: Text(titleTab1),
        ),
      if (titleTab2 != null)
        Tab(
          child: Text(titleTab2),
        ),
      if (titleTab3 != null)
        Tab(
          child: Text(titleTab3),
        ),
      if (titleTab4 != null)
        Tab(
          child: Text(titleTab4),
        ),
      if (titleTab5 != null)
        Tab(
          child: Text(titleTab5),
        ),
      if (titleTab6 != null)
        Tab(
          child: Text(titleTab6),
        ),
    ];
  }

  // ignore: always_declare_return_types
  _initTabContent() {
    tabContentItems = [
      const RoadToProgramming(
        key: PageStorageKey<String>('tab_road_to_programming'),
      ),
      const TheBeginning(
        key: PageStorageKey<String>('tab_the_beginning'),
      ),
      const University(
        key: PageStorageKey<String>('tab_university'),
      ),
      const Goals(
        key: PageStorageKey<String>('tab_goals'),
      ),
      const Skills(
        key: PageStorageKey<String>('tab_skills'),
      ),
      const Education(
        key: PageStorageKey<String>('tab_education'),
      ),
    ];
  }
}
