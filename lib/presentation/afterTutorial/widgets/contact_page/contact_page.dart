import 'package:auto_route/auto_route.dart';
import 'package:dportfolio_v2/presentation/afterTutorial/widgets/contact_page/widgets/platform_widget.dart';
import 'package:dportfolio_v2/presentation/core/widgets/custom_webview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dportfolio_v2/presentation/core/extensions/app_data_extensions.dart';
import 'package:dportfolio_v2/presentation/core/locale_keys.dart';
import 'package:dportfolio_v2/presentation/routes/router.gr.dart';
import 'package:dportfolio_v2/presentation/core/extensions/url_extensions.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';

// ignore: constant_identifier_names
const double PLATFORM_ICON_SIZE = 35.0;

class PlatformItem {
  final Widget icon;
  final Color iconColor;
  final VoidCallback action;
  final String description;
  final String btnText;

  PlatformItem({
    required this.icon,
    required this.iconColor,
    required this.action,
    required this.description,
    required this.btnText,
  });
}

class ContactPage extends StatefulWidget {
  const ContactPage();

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage>
    with AutomaticKeepAliveClientMixin {
  late List<PlatformItem> listOfPlatformItems;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _initListOfPlatforms();
    super.didChangeDependencies();
  }

  // ignore: always_declare_return_types
  _initListOfPlatforms() {
    listOfPlatformItems = [
      PlatformItem(
        icon: const Icon(FontAwesome5.envelope),
        iconColor: Theme.of(context).colorScheme.secondary,
        action: () {
          final Uri uri = Uri(scheme: 'mailto', path: 'zitkusd@gmail.com');
          context.openAppOrBrowser(uri.toString());
        },
        description: context.getString(LocaleKeys.EMAIL_DESC) ?? '',
        btnText: context.getString(LocaleKeys.EMAIL_BTN) ?? '',
      ),
      PlatformItem(
        icon: const Icon(FontAwesome5.linkedin),
        iconColor: const Color.fromRGBO(40, 103, 178, 1.0),
        action: () {
          const String url =
              'https://www.linkedin.com/in/donatas-%C5%BEitkus-50a4b6163/';
          context.openAppOrBrowser(url);
        },
        description: context.getString(LocaleKeys.LINKEDIN_DESC) ?? '',
        btnText: context.getString(LocaleKeys.LINKEDIN_BTN) ?? '',
      ),
      PlatformItem(
        icon: Image.asset(
          'assets/images/upwork.png',
          width: PLATFORM_ICON_SIZE,
          height: PLATFORM_ICON_SIZE,
        ),
        iconColor: const Color.fromRGBO(255, 255, 255, 0.0),
        action: () {
          const String url =
              'https://www.upwork.com/freelancers/~01d46d21775488abb6';
          _openWebView(url);
        },
        description: context.getString(LocaleKeys.UPWORK_DESC) ?? '',
        btnText: context.getString(LocaleKeys.UPWORK_BTN) ?? '',
      ),
      PlatformItem(
        icon: Image.asset(
          'assets/images/freelancer.jpg',
          width: PLATFORM_ICON_SIZE,
          height: PLATFORM_ICON_SIZE,
        ),
        iconColor: const Color.fromRGBO(255, 255, 255, 0.0),
        action: () {
          const String url = 'https://www.freelancer.com/u/zitkusd';
          _openWebView(url);
        },
        description: context.getString(LocaleKeys.FREELANCER_DESC) ?? '',
        btnText: context.getString(LocaleKeys.FREELANCER_BTN) ?? '',
      ),
    ];
  }

  // ignore: always_declare_return_types
  _openWebView(String url) {
    context.router.push(
      CustomWebViewRoute(url: url),
    );
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
              context.getString(LocaleKeys.GET_IN_TOUCH) ?? '',
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 40.0,
                  horizontal: 10.0,
                ),
                child: Wrap(
                  spacing: 5.0,
                  runSpacing: 5.0,
                  alignment: WrapAlignment.center,
                  children: listOfPlatformItems
                      .map(
                        (p) => PlatformWidget(
                          icon: p.icon,
                          iconColor: p.iconColor,
                          description: p.description,
                          buttonText: p.btnText,
                          action: p.action,
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
