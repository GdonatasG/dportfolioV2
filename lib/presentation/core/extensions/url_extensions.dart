import 'package:dportfolio_v2/presentation/core/locale_keys.dart';
import 'package:ez_localization/src/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

extension UrlExtensions on BuildContext {
  Future<void> openAppOrBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        enableJavaScript: true,
      );
    } else {
      final message = getString(LocaleKeys.ERROR_TRY_AGAIN);
      ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    }
  }
}
