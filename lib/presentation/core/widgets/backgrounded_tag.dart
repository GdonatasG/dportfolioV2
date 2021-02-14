import 'package:dportfolio_v2/presentation/core/themes/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:dportfolio_v2/presentation/core/extensions/theme_extensions.dart';

class BackgroundedTag extends StatelessWidget {
  final Color bgColor;
  final Text text;

  const BackgroundedTag({Key key, @required this.text, @required this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: bgColor,
          boxShadow: [
            context.getCurrentTheme == themeLight
                ? BoxShadow(
                    color: Theme.of(context).unselectedWidgetColor,
                    offset: Offset(1.5, 1.5), //(x,y)
                    blurRadius: 1.0,
                  )
                : BoxShadow(),
          ]),
      child: text,
    );
  }
}
