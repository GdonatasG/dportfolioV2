import 'package:dportfolio_v2/presentation/afterTutorial/widgets/github_page/widgets/states/error/github_error_state_widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

mixin GithubErrorStateWidgetFinders {
  static final tryAgainButton = find.byKey(
    const ValueKey(GithubErrorStateWidgetKeys.tryAgainButton),
  );
}
