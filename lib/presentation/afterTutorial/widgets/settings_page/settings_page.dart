import 'package:auto_route/auto_route.dart';
import 'package:dportfolio_v2/presentation/core/locale_keys.dart';
import 'package:dportfolio_v2/presentation/routes/router.gr.dart';
import 'package:ez_localization/src/extension.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:package_info/package_info.dart';

import 'widgets/text_tile.dart';
import 'widgets/title_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage();

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String appVersion = "";

  @override
  void initState() {
    _getAppVersion();
    super.initState();
  }

  // ignore: always_declare_return_types
  _getAppVersion() {
    PackageInfo.fromPlatform().then((PackageInfo info) {
      setState(() {
        appVersion = info.version;
      });
    });
  }

  List<Widget> _initWidgets(BuildContext context) => [
        TitleWidget(
          title: context.getString(LocaleKeys.ABOUT_APPLICATION),
        ),
        TextTile(
          leading: const Icon(FontAwesome5.info_circle),
          title: context.getString(LocaleKeys.VERSION, {'version': appVersion}),
          isSingleLine: true,
        ),
        TextTile(
          leading: const Icon(Icons.person),
          title: context.getString(
            LocaleKeys.CREATORS,
            {'creators': 'Donatas Žitkus'},
          ),
          isSingleLine: true,
        ),
        TextTile(
          leading: const Icon(Icons.phone_android),
          title: context.getString(LocaleKeys.BUILT_WITH),
          isSingleLine: true,
        ),
        TitleWidget(
          title: context.getString(LocaleKeys.PERSONALIZATION),
        ),
        TextTile(
          leading: const Icon(Icons.color_lens_outlined),
          trailing: const Icon(Icons.arrow_forward),
          title: context.getString(LocaleKeys.THEME),
          onTap: () {
            context.router.push(const ThemePageRoute());
          },
          isSingleLine: true,
        ),
        TextTile(
          leading: const Icon(Icons.language),
          trailing: const Icon(Icons.arrow_forward),
          title: context.getString(LocaleKeys.LANGUAGE_TITLE),
          onTap: () {
            context.router.push(const LanguagePageRoute());
          },
          isSingleLine: true,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final listOfWidgets = _initWidgets(context);
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              context.getString(LocaleKeys.SETTINGS_TITLE),
            ),
            centerTitle: true,
          ),
          body: ListView.separated(
            itemBuilder: (ctx, i) => listOfWidgets[i],
            separatorBuilder: (ctx, i) => const Divider(
              height: 1.0,
            ),
            itemCount: listOfWidgets.length,
          ),
        ),
      ),
    );
  }
}
