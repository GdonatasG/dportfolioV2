import 'package:dportfolio_v2/presentation/core/extensions/app_data_extensions.dart';
import 'package:dportfolio_v2/presentation/core/locale_keys.dart';
import 'package:flutter/material.dart';

import 'portfolio_data.dart';
import 'portfolio_item_widget.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage();

  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  late List<Widget> tabItems;
  late List<Widget> tabContentItems;
  late TabController _controller;

  @override
  void initState() {
    _controller =
        TabController(length: listOfPortfolioItems.length, vsync: this);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _initTabTitles();
    _initTabContent();
    super.didChangeDependencies();
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
            centerTitle: true,
            title: Text(
              context.getString(LocaleKeys.PORTFOLIO_PAGE_TITLE) ?? '',
            ),
            bottom: TabBar(
              tabs: tabItems,
              controller: _controller,
            ),
          ),
          body: TabBarView(controller: _controller, children: tabContentItems),
        ),
      ),
    );
  }

  // ignore: always_declare_return_types
  _initTabTitles() {
    tabItems = listOfPortfolioItems
        .map((i) => Tab(
              child: Text(i.title),
            ))
        .toList();
  }

  // ignore: always_declare_return_types
  _initTabContent() {
    tabContentItems = listOfPortfolioItems
        .map(
          (i) => PortfolioItemWidget(item: i),
        )
        .toList();
  }

  @override
  bool get wantKeepAlive => true;
}
