import 'package:dportfolio_v2/presentation/core/locale_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dportfolio_v2/presentation/core/extensions/app_data_extensions.dart';

extension UrlExtensions on BuildContext {
  openAppOrBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        enableJavaScript: true,
      );
    } else {
      final message = getString(LocaleKeys.ERROR_TRY_AGAIN);
      if (message != null) {
        ScaffoldMessenger.of(this).showSnackBar(
          SnackBar(
            content: Text(message),
          ),
        );
      }
    }
  }
}
