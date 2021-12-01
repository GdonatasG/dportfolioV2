import 'package:dportfolio_v2/presentation/core/locale_keys.dart';
import 'package:dportfolio_v2/presentation/core/themes/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:dportfolio_v2/presentation/core/extensions/app_data_extensions.dart';

class EndingView extends StatelessWidget {
  const EndingView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/message_happy.png',
              width: 120,
              height: 200,
            ),
            Text(
              context.getString(LocaleKeys.TUTORIAL_ENDING_PAGE_MESSAGE) ?? '',
              style: Theme.of(context).textTheme.headline2,
            ),
          ],
        ),
      ),
    );
  }
}
