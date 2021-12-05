import 'dart:ui';

import 'package:ez_localization/src/extension.dart';
import 'package:dportfolio_v2/presentation/core/locale_keys.dart';
import 'package:dportfolio_v2/presentation/core/widgets/backgrounded_tag.dart';
import 'package:flutter/material.dart';

class Skills extends StatefulWidget {
  const Skills({
    Key? key,
  }) : super(key: key);

  @override
  _SkillsState createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  final List<String> listOfSkills = [
    "Flutter",
    "Dart",
    "Kotlin",
    "Java",
    "Google Maps API",
    "Google Firebase",
    "SQL",
    "Github",
    "Android",
    "Android Studio",
  ];

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
            sliver: SliverToBoxAdapter(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 4.0,
                children: listOfSkills
                    .map(
                      (skill) => BackgroundedTag(
                        text: Text(
                          skill,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                        bgColor: Theme.of(context).primaryColor,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          SliverPadding(
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Text(
                  context.getString(LocaleKeys.ADDITIONAL_SKILLS_CONTENT1),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
