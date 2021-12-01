import 'package:dportfolio_v2/presentation/core/extensions/app_data_extensions.dart';
import 'package:dportfolio_v2/presentation/core/locale_keys.dart';
import 'package:flutter/material.dart';

import 'widgets/content_text_widget.dart';

class TheBeginning extends StatefulWidget {
  const TheBeginning({
    Key? key,
  }) : super(key: key);

  @override
  _TheBeginningState createState() => _TheBeginningState();
}

class _TheBeginningState extends State<TheBeginning> {
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
                    content:
                        context.getString(LocaleKeys.THE_BEGINNING_CONTENT1) ??
                            '')
              ]),
            ),
          )
        ],
      ),
    );
  }
}
