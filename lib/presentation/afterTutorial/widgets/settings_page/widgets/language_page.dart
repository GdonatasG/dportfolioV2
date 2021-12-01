import 'package:dportfolio_v2/application/app_data_builder/app_data_export.dart';
import 'package:dportfolio_v2/application/app_data_builder/locale_constants.dart';
import 'package:dportfolio_v2/presentation/core/locale_keys.dart';
import 'package:dportfolio_v2/presentation/core/widgets/custom_radio_preference.dart';
import 'package:flutter/material.dart';

class LanguagePage extends StatefulWidget {
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              context.getString(LocaleKeys.LANGUAGE_TITLE) ?? '',
              style: Theme.of(context).textTheme.headline6,
            ),
            centerTitle: true,
          ),
          body:
              Container() /*PreferencePage([
            const Divider(
              height: 1.0,
            ),
            CustomRadioPreference(
              Text(
                context.getString(LocaleKeys.LANGUAGE_EN),
                style: Theme.of(context).textTheme.bodyText1,
              ),
              LocaleConstants.LANG_EN,
              LocaleConstants.PREFERENCE_LANGUAGE,
              isDefault: context.getCurrentLocale?.languageCode ==
                  LocaleConstants.LANG_EN,
              onSelect: () {
                WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
                  AppDataBuilder.of(context)
                      ?.changeLocale(const Locale(LocaleConstants.LANG_EN));
                });
              },
            ),
            const Divider(
              height: 1.0,
            ),
            CustomRadioPreference(
              Text(
                context.getString(LocaleKeys.LANGUAGE_LT),
                style: Theme.of(context).textTheme.bodyText1,
              ),
              LocaleConstants.LANG_LT,
              LocaleConstants.PREFERENCE_LANGUAGE,
              isDefault: context.getCurrentLocale.languageCode ==
                  LocaleConstants.LANG_LT,
              onSelect: () {
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  AppDataBuilder.of(context)
                      .changeLocale(const Locale(LocaleConstants.LANG_LT));
                });
              },
            ),
            const Divider(
              height: 1.0,
            ),
          ])*/
          ,
        ),
      ),
    );
  }
}
