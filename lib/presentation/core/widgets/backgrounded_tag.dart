import 'package:flutter/material.dart';

class BackgroundedTag extends StatelessWidget {
  final Color bgColor;
  final Text text;

  const BackgroundedTag({
    Key? key,
    required this.text,
    required this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: bgColor,
        boxShadow: [
          if (Theme.of(context).brightness == Brightness.light)
            BoxShadow(
              color: Theme.of(context).unselectedWidgetColor,
              offset: const Offset(1.5, 1.5), //(x,y)
              blurRadius: 1.0,
            )
          else
            const BoxShadow(),
        ],
      ),
      child: text,
    );
  }
}
