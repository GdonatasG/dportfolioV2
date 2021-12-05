import 'package:dportfolio_v2/presentation/core/app_dimensions.dart';
import 'package:dportfolio_v2/presentation/core/global_constants.dart';
import 'package:dportfolio_v2/presentation/core/locale_keys.dart';
import 'package:dportfolio_v2/presentation/core/themes/theme_dark.dart';
import 'package:ez_localization/src/extension.dart';
import 'package:dportfolio_v2/presentation/core/themes/theme_light.dart';
import 'package:dportfolio_v2/presentation/core/widgets/sabt.dart';
import 'package:flutter/material.dart';

class AboutSliverAppBar extends StatelessWidget {
  final TabController tabController;
  final List<Widget> tabItems;

  const AboutSliverAppBar({
    Key? key,
    required this.tabController,
    required this.tabItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: 300.0,
      centerTitle: true,
      pinned: true,
      forceElevated: true,
      title: const SABT(
        child: Text(
          GlobalConst.APP_NAME,
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              _getImageAssetSrcByTheme(context),
              width: AppDimensions.LOGO_FACE_WIDTH,
              height: AppDimensions.LOGO_FACE_HEIGHT,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Donatas Žitkus",
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    fontFamily: "ComicSansMs",
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              context.getString(LocaleKeys.TITLE_MOBILE_DEVELOPER),
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  color: Theme.of(context).textTheme.headline5?.color,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "Kaunas, ${context.getString(LocaleKeys.COUNTRY_LITHUANIA)}",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(fontSize: 14),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      bottom: TabBar(
        tabs: tabItems,
        controller: tabController,
        isScrollable: true,
      ),
    );
  }

  String _getImageAssetSrcByTheme(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return GlobalConst.SRC_FACE_WHITE;
    } else {
      return GlobalConst.SRC_FACE_BLACK;
    }
  }
}
