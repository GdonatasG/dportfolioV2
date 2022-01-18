import 'package:dportfolio_v2/presentation/afterTutorial/widgets/about_me_page/tabItems/widgets/content_text_widget.dart';
import 'package:dportfolio_v2/presentation/core/locale_keys.dart';
import 'package:flutter/material.dart';
import 'package:ez_localization/src/extension.dart';

class University extends StatefulWidget {
  const University({
    Key? key,
  }) : super(key: key);

  @override
  _UniversityState createState() => _UniversityState();
}

class _UniversityState extends State<University> {
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
                  content: context.getString(LocaleKeys.UNIVERSITY_CONTENT1),
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
