import 'package:flutter/material.dart';
import 'package:preferences/preference_title.dart';

class TitleWidget extends StatelessWidget {
  final String title;

  const TitleWidget({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: PreferenceTitle(
        title,
      ),
    );
  }
}
