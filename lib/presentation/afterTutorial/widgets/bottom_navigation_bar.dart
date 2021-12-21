import 'package:auto_route/auto_route.dart';
import 'package:dportfolio_v2/presentation/core/locale_keys.dart';
import 'package:flutter/material.dart';
import 'package:ez_localization/src/extension.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class BottomNavBar extends StatelessWidget {
  final TabsRouter _tabsRouter;

  const BottomNavBar(
    this._tabsRouter, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedFontSize: 0.0,
      selectedFontSize: 0.0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: _tabsRouter.activeIndex,
      onTap: _tabsRouter.setActiveIndex,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(FontAwesome5.user),
          label: context.getString(LocaleKeys.BOTTOM_LABEL_ABOUT_ME),
        ),
        BottomNavigationBarItem(
          icon: const Icon(FontAwesome5.file_code),
          label: context.getString(LocaleKeys.BOTTOM_LABEL_PORTFOLIO),
        ),
        BottomNavigationBarItem(
          icon: const Icon(FontAwesome5.envelope),
          label: context.getString(LocaleKeys.BOTTOM_LABEL_CONTACTS),
        ),
        BottomNavigationBarItem(
          icon: const Icon(FontAwesome5.github),
          label: context.getString(LocaleKeys.BOTTOM_LABEL_GITHUB),
        ),
        BottomNavigationBarItem(
          icon: const Icon(FontAwesome5.cog),
          label: context.getString(LocaleKeys.BOTTOM_LABEL_SETTINGS),
        ),
      ],
    );
  }
}
