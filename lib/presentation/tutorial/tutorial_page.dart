import 'package:auto_route/auto_route.dart';
import 'package:dportfolio_v2/application/wrapper_bloc/wrapper_bloc.dart';
import 'package:dportfolio_v2/injection.dart';
import 'package:dportfolio_v2/presentation/core/locale_keys.dart';
import 'package:dportfolio_v2/presentation/core/themes/theme_light.dart';
import 'package:dportfolio_v2/presentation/routes/router.gr.dart';
import 'package:dportfolio_v2/presentation/tutorial/widgets/ending_view.dart';
import 'package:dportfolio_v2/presentation/tutorial/widgets/greeting_view.dart';
import 'package:dportfolio_v2/presentation/tutorial/widgets/what_to_find_view.dart';
import 'package:flutter/material.dart';
import 'package:dportfolio_v2/presentation/core/extensions/app_data_extensions.dart';
import 'package:flutter/services.dart';

class TutorialPage extends StatefulWidget {
  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  int currentPage = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  final listOfPages = [
    const GreetingView(),
    const WhatToFindView(),
    const EndingView(),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: themeLight.primaryColor,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light));
    return Container(
      color: themeLight.primaryColor,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (page) {
                    setState(() {
                      currentPage = page;
                    });
                  },
                  children: listOfPages,
                ),
              ),
              FooterControls(
                pageController: _pageController,
                currentPage: currentPage,
                maxPages: listOfPages.length,
              ), // arrow controls
            ],
          ),
        ),
      ),
    );
  }
}

class FooterControls extends StatelessWidget {
  final PageController pageController;
  final int currentPage;
  final int maxPages;

  const FooterControls(
      {Key key,
      @required this.pageController,
      @required this.maxPages,
      @required this.currentPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.all(7.0),
      constraints: const BoxConstraints(
        minHeight: 40.0,
        maxHeight: 60.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: setFooterControls(context),
      ),
    );
  }

  List<Widget> setFooterControls(BuildContext context) {
    if (currentPage == 0) {
      // only forward icon, first page
      return [
        IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              secondPage();
            }),
      ];
    } else if (currentPage > 0 && currentPage < maxPages - 1) {
      // not first page, but also not last, forward and back icons
      return [
        IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              previousPage();
            }),
        IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              secondPage();
            }),
      ];
    } else {
      return [
        IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              previousPage();
            }),
        IconButton(
          icon: const Icon(Icons.done),
          onPressed: () {
            closeTutorialDialog(context);
          },
        ),
      ];
    }
  }

  previousPage() {
    pageController.animateToPage(currentPage - 1,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  secondPage() {
    pageController.animateToPage(currentPage + 1,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  closeTutorialDialog(BuildContext context) => showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(context.getString(LocaleKeys.CONFIRMATION)),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: new Text(context.getString(LocaleKeys.BTN_CANCEL)),
              ), // cancel button
              FlatButton(
                onPressed: () async {
                  getIt<WrapperBloc>()
                      .add(const WrapperEvent.tutorialCompleted());
                  await ExtendedNavigator.of(context)
                      .replace(Routes.afterTutorialPage);
                },
                child: Text(
                  context.getString(LocaleKeys.BTN_CONFIRM),
                ),
              ), // confirm button
            ],
          );
        },
      );
}
