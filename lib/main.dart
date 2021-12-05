import 'dart:async';
import 'dart:developer';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:dportfolio_v2/injection.dart';
import 'package:dportfolio_v2/presentation/core/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  await configureInjection(Environment.prod);
  runZonedGuarded(
    () => runApp(
      AppWidget(
        savedThemeMode: savedThemeMode,
      ),
    ),
    (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
    },
  );
}
