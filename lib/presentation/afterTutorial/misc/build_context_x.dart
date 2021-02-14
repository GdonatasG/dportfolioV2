import 'package:dportfolio_v2/presentation/afterTutorial/misc/current_bottom_bar_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension CurrentPageX on BuildContext {
  int get currentPage =>
      Provider.of<CurrentBottomBarPage>(this, listen: false).value;

  set currentPage(int page) =>
      Provider.of<CurrentBottomBarPage>(this, listen: false).value = page;
}
