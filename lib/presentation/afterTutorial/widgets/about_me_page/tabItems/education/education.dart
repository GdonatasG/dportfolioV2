import 'package:ez_localization/src/extension.dart';
import 'package:flutter/material.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

import 'education_data.dart';

class Education extends StatefulWidget {
  const Education({
    Key? key,
  }) : super(key: key);

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
          SliverToBoxAdapter(
            child: Timeline.builder(
              lineColor: Theme.of(context).dividerTheme.color,
              lineWidth: Theme.of(context).dividerTheme.space,
              itemBuilder: _centerTimelineBuilder,
              itemCount: educations.length,
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }

  TimelineModel _centerTimelineBuilder(BuildContext context, int i) {
    final education = educations[i];
    return TimelineModel(
      LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).primaryColor,
              boxShadow: [
                if (Theme.of(context).brightness == Brightness.light)
                  BoxShadow(
                    color: Theme.of(context).unselectedWidgetColor,
                    offset: const Offset(1.5, 1.5), //(x,y)
                    blurRadius: 1.0,
                  )
                else
                  const BoxShadow(),
              ],
            ),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            width: constraints.maxWidth,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  IconTheme(
                    data: IconThemeData(
                      color: Theme.of(context).colorScheme.secondary,
                      size: 28,
                    ),
                    child: education.icon,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    context.getString(education.time),
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(fontStyle: FontStyle.italic, fontSize: 16.5),
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
                        ?.copyWith(fontWeight: FontWeight.bold, fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  const Icon(Icons.location_on),
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
      iconBackground: Theme.of(context).colorScheme.secondary,
    );
    //icon: doodle.icon);
  }
}
