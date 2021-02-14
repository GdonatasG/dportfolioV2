import 'package:flutter/material.dart';

class ContentTextWidget extends StatelessWidget {
  final String content;

  const ContentTextWidget({Key key, @required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Text(
        content,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
