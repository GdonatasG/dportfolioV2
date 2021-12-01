import 'package:dportfolio_v2/presentation/afterTutorial/misc/current_bottom_bar_page.dart';
import 'package:dportfolio_v2/presentation/core/locale_keys.dart';
import 'package:flutter/material.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/misc/build_context_x.dart';
import 'package:dportfolio_v2/presentation/core/extensions/app_data_extensions.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CurrentBottomBarPage>(
        builder: (context, currentPage, child) {
      return BottomNavigationBar(
        elevation: 0.0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: context.currentPage,
        onTap: (ind) {
          context.currentPage = ind;
        },
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
    });
  }
}
