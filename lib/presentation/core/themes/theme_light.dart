import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_dimensions.dart';

/* Theme Light
  - Grey
  - Black
  - White
  - Red
 */

Color PRIMARY_COLOR = Colors.white;
Color? PRIMARY_TEXT_COLOR = Colors.grey[800];
Color SELECTED_COLOR = Colors.redAccent;
Color FOCUSED_COLOR = Colors.black;
Color UNSELECTED_COLOR = Colors.grey[600]!;

final typography = Typography(platform: TargetPlatform.iOS).black;

final ThemeData themeLight = ThemeData.light().copyWith(
  primaryColor: PRIMARY_COLOR,
  primaryColorDark: Colors.grey[200],
  indicatorColor: SELECTED_COLOR,
  colorScheme: ColorScheme.light(
    primary: SELECTED_COLOR,
    onPrimary: Colors.black,
    secondary: SELECTED_COLOR,
    onSecondary: SELECTED_COLOR,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: PRIMARY_COLOR,
  ),
  checkboxTheme: CheckboxThemeData(
    overlayColor: MaterialStateProperty.all(SELECTED_COLOR),
  ),
  scaffoldBackgroundColor: Colors.grey.shade50,
  unselectedWidgetColor: UNSELECTED_COLOR,
  cupertinoOverrideTheme: CupertinoThemeData(
    barBackgroundColor: SELECTED_COLOR,
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: UNSELECTED_COLOR,
  ),
  iconTheme: IconThemeData(
    color: PRIMARY_TEXT_COLOR,
    size: AppDimensions.UNSELECTED_ICON_SIZE,
  ),
  dividerTheme: DividerThemeData(
    color: UNSELECTED_COLOR,
    space: 1.0,
  ),
  textTheme: typography.copyWith(
    headline2: TextStyle(fontSize: 22.0, color: UNSELECTED_COLOR),
    bodyText1: TextStyle(
      fontSize: 13.0,
      color: PRIMARY_TEXT_COLOR,
      fontWeight: FontWeight.normal,
    ),
    headline4: TextStyle(
      fontSize: 18.0,
      color: PRIMARY_TEXT_COLOR,
    ),
    headline5: TextStyle(
      fontSize: 15.0,
      color: PRIMARY_TEXT_COLOR,
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
        color: UNSELECTED_COLOR,
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
    labelColor: FOCUSED_COLOR,
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
      primary: PRIMARY_TEXT_COLOR,
      onPrimary: PRIMARY_COLOR,
    ),
  ),
);
