import 'package:dportfolio_v2/presentation/core/locale_keys.dart';
import 'package:dportfolio_v2/presentation/core/themes/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:dportfolio_v2/presentation/core/extensions/app_data_extensions.dart';

class WhatToFindView extends StatelessWidget {
  const WhatToFindView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/code_icon.png',
              width: 150,
              height: 220,
            ),
            Text(
              context.getString(LocaleKeys.TUTORIAL_WHAT_TO_FIND_MESSAGE),
              style: themeLight.textTheme.headline2,
            ),
          ],
        ),
      ),
    );
  }
}
