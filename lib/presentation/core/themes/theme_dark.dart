import 'package:flutter/material.dart';

import '../app_dimensions.dart';

/* Theme Dark
  - Dark Grey
  - Blue
  - White
 */

Color? PRIMARY_COLOR = Colors.grey[800];
Color PRIMARY_TEXT_COLOR = Colors.white;
Color SELECTED_COLOR = Colors.blue.shade600;
Color FOCUSED_COLOR = Colors.blue.shade900;
Color UNSELECTED_COLOR = Colors.white;

final ThemeData themeDark = ThemeData.dark().copyWith(
  primaryColor: PRIMARY_COLOR,
  primaryColorDark: Colors.grey[900],
  scaffoldBackgroundColor: Colors.grey[900],
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: UNSELECTED_COLOR,
  ),
  colorScheme: ColorScheme.dark(
    primary: FOCUSED_COLOR,
    onPrimary: PRIMARY_TEXT_COLOR,
    secondary: SELECTED_COLOR,
  ),
  iconTheme: IconThemeData(
    color: UNSELECTED_COLOR,
    size: AppDimensions.UNSELECTED_ICON_SIZE,
  ),
  dividerTheme: DividerThemeData(
    color: UNSELECTED_COLOR,
    space: 1.0,
  ),
  textTheme: TextTheme(
    headline2: TextStyle(fontSize: 22.0, color: UNSELECTED_COLOR),
    bodyText1: TextStyle(
      fontSize: 13.0,
      color: PRIMARY_TEXT_COLOR,
      fontWeight: FontWeight.normal,
    ),
    headline4: TextStyle(
      fontSize: 20.0,
      color: PRIMARY_TEXT_COLOR,
    ),
    headline5: TextStyle(
      fontSize: 15.0,
      color: PRIMARY_TEXT_COLOR,
    ),
  ),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    backgroundColor: PRIMARY_COLOR,
    iconTheme: IconThemeData(
      color: UNSELECTED_COLOR,
      size: AppDimensions.APP_BAR_ICON_SIZE,
    ),
    actionsIconTheme: IconThemeData(
      color: UNSELECTED_COLOR,
      size: AppDimensions.APP_BAR_ICON_SIZE,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: PRIMARY_COLOR,
    selectedIconTheme: IconThemeData(
      color: SELECTED_COLOR,
      size: AppDimensions.SELECTED_ICON_SIZE,
    ),
    unselectedIconTheme: IconThemeData(
      color: UNSELECTED_COLOR,
      size: AppDimensions.UNSELECTED_ICON_SIZE,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: UNSELECTED_COLOR,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: FOCUSED_COLOR,
      ),
    ),
    labelStyle: TextStyle(color: UNSELECTED_COLOR),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: SELECTED_COLOR,
      ),
    ),
  ),
  tabBarTheme: TabBarTheme(
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(
        color: SELECTED_COLOR,
        width: 2.0,
      ),
    ),
    labelColor: SELECTED_COLOR,
    unselectedLabelColor: UNSELECTED_COLOR,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: SELECTED_COLOR,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      primary: PRIMARY_TEXT_COLOR,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: FOCUSED_COLOR,
      onPrimary: PRIMARY_TEXT_COLOR,
    ),
  ),
);
