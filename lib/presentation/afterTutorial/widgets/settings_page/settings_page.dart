import 'package:dportfolio_v2/application/app_data_builder/app_data_export.dart';
import 'package:dportfolio_v2/presentation/core/locale_keys.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage();

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with AutomaticKeepAliveClientMixin {
  late String appVersion;

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

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              context.getString(LocaleKeys.SETTINGS_TITLE) ?? '',
            ),
            centerTitle: true,
          ),
          body:
              Container(), /*PreferencePage(
            [
              TitleWidget(
                title: context.getString(LocaleKeys.ABOUT_APPLICATION),
              ),
              const Divider(
                height: 1.0,
              ),
              TextTile(
                leading: const Icon(FontAwesome.info_circle),
                title: context
                    .getString(LocaleKeys.VERSION, {'version': appVersion}),
                isSingleLine: true,
              ),
              const Divider(
                height: 1.0,
              ),
              TextTile(
                leading: const Icon(Ionicons.ios_person),
                title: context.getString(
                    LocaleKeys.CREATORS, {'creators': 'Donatas Žitkus'}),
                isSingleLine: true,
              ),
              const Divider(
                height: 1.0,
              ),
              TextTile(
                leading: const Icon(Icons.phone_android),
                title: context.getString(LocaleKeys.BUILT_WITH),
                isSingleLine: true,
              ),
              const Divider(
                height: 1.0,
              ),
              TitleWidget(
                title: context.getString(LocaleKeys.PERSONALIZATION),
              ),
              const Divider(
                height: 1.0,
              ),
              EditedSwitchPreference(
                Text(
                  context.getString(LocaleKeys.DARK_THEME),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                ThemeConstants.IS_THEME_DARK,
                onEnable: () {
                  AppDataBuilder.of(context).changeTheme(themeDark);
                },
                onDisable: () {
                  AppDataBuilder.of(context).changeTheme(themeLight);
                },
              ),
              const Divider(
                height: 1.0,
              ),
              TextTile(
                leading: const Icon(Icons.language),
                trailing: const Icon(Icons.arrow_forward),
                title: context.getString(LocaleKeys.LANGUAGE_TITLE),
                onTap: () {
                  ExtendedNavigator.of(context).push(Routes.languagePage);
                },
                isSingleLine: true,
              ),
              const Divider(
                height: 1.0,
              ),
            ],
          ),*/
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
