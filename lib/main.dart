import 'package:dportfolio_v2/injection.dart';
import 'package:dportfolio_v2/presentation/core/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:preferences/preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefService.init(prefix: 'pref_');
  configureInjection(Environment.prod);
  runApp(AppWidget());
}
