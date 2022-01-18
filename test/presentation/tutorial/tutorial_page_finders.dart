import 'package:dportfolio_v2/presentation/tutorial/tutorial_page_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

mixin TutorialPageFinders {
  static final pageView = find.byKey(
    const ValueKey(TutorialPageKeys.KEY_PAGE_VIEW),
  );
  static final arrowForward = find.byKey(
    const ValueKey(TutorialPageKeys.KEY_FOOTER_ARROW_FORWARD),
  );
  static final arrowBack = find.byKey(
    const ValueKey(TutorialPageKeys.KEY_FOOTER_ARROW_BACK),
  );
  static final done = find.byKey(
    const ValueKey(TutorialPageKeys.KEY_FOOTER_DONE),
  );

  static final tutorialCloseDialog = find.byKey(
    const ValueKey(TutorialPageKeys.KEY_CLOSE_TUTORIAL_DIALOG),
  );
  static final dialogCancelButton = find.byKey(
    const ValueKey(TutorialPageKeys.KEY_DIALOG_CANCEL),
  );
  static final dialogConfirmButton = find.byKey(
    const ValueKey(TutorialPageKeys.KEY_DIALOG_CONFIRM),
  );
}
