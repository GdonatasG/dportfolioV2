import 'package:dportfolio_v2/presentation/core/extensions/app_data_extensions.dart';
import 'package:dportfolio_v2/presentation/core/extensions/theme_extensions.dart';
import 'package:dportfolio_v2/presentation/core/themes/theme_light.dart';
import 'package:flutter/material.dart';

import 'education_data.dart';
import 'widgets/timeline/timeline.dart';
import 'widgets/timeline/timeline_model.dart';

class Education extends StatefulWidget {
  const Education({Key key}) : super(key: key);

  @override
  _EducationState createState() => _EducationState();
}

class _EducationState extends State<Education> {
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
            padding: const EdgeInsets.all(4.0),
            sliver: Timeline.builder(
                isSliverList: true,
                itemBuilder: centerTimelineBuilder,
                itemCount: educations.length,
                position: TimelinePosition.Center),
          )
        ],
      ),
    );
  }

  TimelineModel centerTimelineBuilder(BuildContext context, int i) {
    final education = educations[i];
    return TimelineModel(LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).primaryColor,
              boxShadow: [
                context.getCurrentTheme == themeLight
                    ? BoxShadow(
                        color: Theme.of(context).unselectedWidgetColor,
                        offset: Offset(1.5, 1.5), //(x,y)
                        blurRadius: 1.0,
                      )
                    : BoxShadow(),
              ]),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          width: constraints.maxWidth,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                IconTheme(
                    data: IconThemeData(
                        color: Theme.of(context).accentColor, size: 28),
                    child: education.icon),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  context.getString(education.time),
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(fontStyle: FontStyle.italic, fontSize: 16.5),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                DividerTheme(
                  data: Theme.of(context).dividerTheme,
                  child: const Divider(
                    height: 1.0,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  context.getString(education.name),
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                IconTheme(
                    data: IconThemeData(color: Theme.of(context).accentColor),
                    child: const Icon(Icons.location_on)),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  context.getString(education.location),
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        );
      },
    ),
        position:
            i % 2 == 0 ? TimelineItemPosition.right : TimelineItemPosition.left,
        isFirst: i == 0,
        isLast: i == educations.length,
        iconBackground: Theme.of(context).accentColor);
    //icon: doodle.icon);
  }
}
