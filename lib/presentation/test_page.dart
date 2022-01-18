import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  final Widget body;

  const TestPage({
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return body;
  }
}
