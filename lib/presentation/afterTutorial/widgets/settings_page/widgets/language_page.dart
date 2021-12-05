import 'package:dportfolio_v2/injection.dart';
import 'package:dportfolio_v2/presentation/core/locale_constants.dart';
import 'package:dportfolio_v2/presentation/core/locale_keys.dart';
import 'package:ez_localization/ez_localization.dart';
import 'package:ez_localization/src/extension.dart';
import 'package:flutter/material.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class LanguagePage extends StatefulWidget {
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  List<Widget> _rebuildChoices(BuildContext context, String lang) => [
        RadioListTile(
          title: Text(context.getString(LocaleKeys.LANGUAGE_EN)),
          activeColor: Theme.of(context).colorScheme.secondary,
          value: LocaleConstants.LANG_EN,
          groupValue: lang,
          onChanged: (value) async {
            await _updateLocale(
              context,
              const Locale(LocaleConstants.LANG_EN),
              LocaleConstants.LANG_EN,
            );
          },
        ),
        RadioListTile(
          title: Text(context.getString(LocaleKeys.LANGUAGE_LT)),
          activeColor: Theme.of(context).colorScheme.secondary,
          value: LocaleConstants.LANG_LT,
          groupValue: lang,
          onChanged: (value) async {
            await _updateLocale(
              context,
              const Locale(LocaleConstants.LANG_LT),
              LocaleConstants.LANG_LT,
            );
          },
        ),
        RadioListTile(
          title: Text(context.getString(LocaleKeys.LANGUAGE_DEVICE)),
          activeColor: Theme.of(context).colorScheme.secondary,
          value: LocaleConstants.LANG_DEVICE,
          groupValue: lang,
          onChanged: (value) async {
            final List<Locale>? systemLocales =
                WidgetsBinding.instance?.window.locales;

            await _updateLocale(
              context,
              systemLocales?[0] ?? const Locale(LocaleConstants.LANG_EN),
              LocaleConstants.LANG_DEVICE,
            );
          },
        ),
      ];

  Future<void> _updateLocale(
    BuildContext context,
    Locale locale,
    String prefValue,
  ) async {
    if (prefValue == LocaleConstants.LANG_LT ||
        prefValue == LocaleConstants.LANG_EN ||
        prefValue == LocaleConstants.LANG_DEVICE) {
      await getIt<StreamingSharedPreferences>().setString(
        LocaleConstants.PREFERENCE_LANGUAGE,
        prefValue,
      );
      if (mounted) EzLocalizationBuilder.of(context)!.changeLocale(locale);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              context.getString(LocaleKeys.LANGUAGE_TITLE),
            ),
            centerTitle: true,
          ),
          body: PreferenceBuilder<String>(
            preference: getIt<StreamingSharedPreferences>().getString(
              LocaleConstants.PREFERENCE_LANGUAGE,
              defaultValue: LocaleConstants.LANG_DEVICE,
            ),
            builder: (ctx, lang) {
              final List<Widget> widgets = _rebuildChoices(context, lang);
              return ListView.separated(
                itemBuilder: (ctx, i) => widgets[i],
                separatorBuilder: (ctx, i) => const Divider(
                  height: 1.0,
                ),
                itemCount: widgets.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
