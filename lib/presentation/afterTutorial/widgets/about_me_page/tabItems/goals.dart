import 'package:dportfolio_v2/presentation/afterTutorial/widgets/about_me_page/tabItems/widgets/content_text_widget.dart';
import 'package:dportfolio_v2/presentation/core/locale_keys.dart';
import 'package:flutter/material.dart';
import 'package:dportfolio_v2/presentation/core/extensions/app_data_extensions.dart';

class Goals extends StatefulWidget {
  const Goals({
    Key? key,
  }) : super(key: key);

  @override
  _GoalsState createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) => CustomScrollView(
        key: widget.key,
        slivers: [
          SliverOverlapInjector(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                ContentTextWidget(
                  content: context.getString(LocaleKeys.GOALS_CONTENT1) ?? '',
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
