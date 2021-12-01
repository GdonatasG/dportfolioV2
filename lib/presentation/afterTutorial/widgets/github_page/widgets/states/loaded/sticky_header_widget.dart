import 'package:flutter/material.dart';

// ignore: constant_identifier_names
const double STICKY_HEADER_HEIGHT = 30.0;

class StickyHeaderWidget extends StatelessWidget {
  final String title;
  final bool isCenteredVertically;

  const StickyHeaderWidget({
    Key? key,
    required this.title,
    this.isCenteredVertically = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: STICKY_HEADER_HEIGHT,
        alignment:
            isCenteredVertically ? Alignment.center : Alignment.centerLeft,
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Text(
          title,
          style:
              Theme.of(context).textTheme.headline4?.copyWith(fontSize: 17.0),
        ));
  }
}
