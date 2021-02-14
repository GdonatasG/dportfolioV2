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
Color PRIMARY_TEXT_COLOR = Colors.grey[800];
Color SELECTED_COLOR = Colors.redAccent;
Color FOCUSED_COLOR = Colors.black;
Color UNSELECTED_COLOR = Colors.grey[600];

final ThemeData themeLight = ThemeData(
  primaryColor: PRIMARY_COLOR,
  accentColor: SELECTED_COLOR,
  // for [CircularProgressIndicator]
  scaffoldBackgroundColor: Colors.grey.shade50,
  unselectedWidgetColor: UNSELECTED_COLOR,
  cupertinoOverrideTheme: CupertinoThemeData(
    barBackgroundColor: SELECTED_COLOR,
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: UNSELECTED_COLOR,
  ),
  iconTheme: IconThemeData(
    color: FOCUSED_COLOR,
    size: AppDimensions.UNSELECTED_ICON_SIZE,
  ),
  dividerTheme: DividerThemeData(thickness: 0.25, color: UNSELECTED_COLOR),
  textTheme: TextTheme(
    headline2: TextStyle(fontSize: 22.0, color: UNSELECTED_COLOR),
    bodyText1: TextStyle(
        fontSize: 13.0,
        color: PRIMARY_TEXT_COLOR,
        fontWeight: FontWeight.normal),
    headline4: TextStyle(
      fontSize: 18.0,
      color: PRIMARY_TEXT_COLOR,
    ),
    headline5: TextStyle(
      fontSize: 15.0,
      color: PRIMARY_TEXT_COLOR,
    ),
  ),
  appBarTheme: AppBarTheme(
    brightness: Brightness.light,
    centerTitle: true,
    textTheme: TextTheme(
      subtitle1: TextStyle(
        color: PRIMARY_TEXT_COLOR,
      ),
      headline6: TextStyle(
        color: PRIMARY_TEXT_COLOR,
        fontSize: 19.0,
        fontWeight: FontWeight.w500,
        fontFamily: "ComicSansMs",
      ),
    ),
    iconTheme: IconThemeData(
      color: FOCUSED_COLOR,
      size: AppDimensions.APP_BAR_ICON_SIZE,
    ),
    actionsIconTheme: IconThemeData(
      color: FOCUSED_COLOR,
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
  buttonTheme: ButtonThemeData(
    buttonColor: PRIMARY_TEXT_COLOR,
    textTheme: ButtonTextTheme.primary,
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
    labelColor: FOCUSED_COLOR,
    unselectedLabelColor: UNSELECTED_COLOR,
  ),
);
