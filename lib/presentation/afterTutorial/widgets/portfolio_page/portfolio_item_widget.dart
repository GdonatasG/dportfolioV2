import 'package:auto_route/auto_route.dart';
import 'package:dportfolio_v2/presentation/core/widgets/backgrounded_tag.dart';
import 'package:dportfolio_v2/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:platform_info/platform_info.dart';
import 'package:dportfolio_v2/presentation/core/extensions/url_extensions.dart';
import 'package:ez_localization/src/extension.dart';

import 'portfolio_data.dart';

class PortfolioItemWidget extends StatefulWidget {
  final PortfolioItem item;

  const PortfolioItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  _PortfolioItemWidgetState createState() => _PortfolioItemWidgetState();
}

class _PortfolioItemWidgetState extends State<PortfolioItemWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            widget.item.coverUrl ?? '',
            height: 230.0,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 10.0,
          ),
          UrlIcons(
            item: widget.item,
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Divider(
            height: 1.0,
            endIndent: 15.0,
            indent: 15.0,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              widget.item.about != null
                  ? (widget.item.isAboutTranslated
                      ? context.getString(widget.item.about ?? '')
                      : widget.item.about ?? '')
                  : '',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          PlatformsAndTechnologies(
            platformItems: widget.item.platformsAndTechnologies ?? [],
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class UrlIcons extends StatefulWidget {
  final PortfolioItem item;

  const UrlIcons({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  _UrlIconsState createState() => _UrlIconsState();
}

class _UrlIconsState extends State<UrlIcons>
    with AutomaticKeepAliveClientMixin {
  int _currentPicture = 0;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Wrap(
      alignment: WrapAlignment.center,
      runSpacing: 8.0,
      spacing: 8.0,
      children: [
        if (widget.item.listOfImagesUrl != null)
          CustomIconButton(
              icon: const Icon(FontAwesome.picture),
              action: () {
                _openGallery(widget.item.listOfImagesUrl ?? [], context);
              })
        else
          const SizedBox(),
        if (widget.item.htmlUrl != null)
          CustomIconButton(
            icon: const Icon(Icons.web),
            action: () {
              context.router
                  .push(CustomWebViewRoute(url: widget.item.htmlUrl ?? ''));
            },
          )
        else
          const SizedBox(),
        if (widget.item.googlePlayUrl != null)
          CustomIconButton(
            icon: const Icon(FontAwesome5.google_play),
            action: () {
              if (Platform.I.isAndroid) {
                context.openAppOrBrowser(widget.item.googlePlayUrl!);
              } else {
                context.router.push(
                    CustomWebViewRoute(url: widget.item.googlePlayUrl ?? ''));
              }
            },
          )
        else
          const SizedBox(),
        if (widget.item.appStoreUrl != null)
          CustomIconButton(
            icon: const Icon(FontAwesome5.app_store_ios),
            action: () {
              if (Platform.I.isIOS) {
                context.openAppOrBrowser(widget.item.appStoreUrl!);
              } else {
                context.router.push(
                    CustomWebViewRoute(url: widget.item.appStoreUrl ?? ''));
              }
            },
          )
        else
          const SizedBox(),
        if (widget.item.githubUrl != null)
          CustomIconButton(
            icon: const Icon(FontAwesome5.github),
            action: () {
              context.router
                  .push(CustomWebViewRoute(url: widget.item.githubUrl ?? ''));
            },
          )
        else
          const SizedBox(),
      ],
    );
  }

  // ignore: always_declare_return_types
  _openGallery(List<String> pictures, BuildContext context) {
    final pageController = PageController(initialPage: _currentPicture);
    showDialog(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (BuildContext context, setState) {
          // ignore: avoid_unnecessary_containers
          return Container(
            child: Material(
              type: MaterialType.transparency,
              child: Flex(direction: Axis.vertical, children: [
                // ***CLOSE BUTTON**
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(
                          Icons.cancel,
                          color: Colors.white,
                          size: 27.0,
                        ),
                      ),
                    ],
                  ),
                ),
                // ***PICTURES***
                Flexible(
                  flex: 8,
                  child: PhotoViewGallery.builder(
                    scrollPhysics: const BouncingScrollPhysics(),
                    builder: (BuildContext context, int index) {
                      return PhotoViewGalleryPageOptions(
                        imageProvider: AssetImage(pictures[index]),
                        minScale: PhotoViewComputedScale.contained * 0.8,
                        initialScale: PhotoViewComputedScale.contained * 0.8,
                      );
                    },
                    itemCount: pictures.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPicture = index;
                      });
                    },
                    loadingBuilder: (context, event) => Center(
                      // ignore: sized_box_for_whitespace
                      child: Container(
                        width: 20.0,
                        height: 20.0,
                        child: CircularProgressIndicator(
                          value:
                              event == null || event.expectedTotalBytes == null
                                  ? 0
                                  : event.cumulativeBytesLoaded /
                                      event.expectedTotalBytes!,
                        ),
                      ),
                    ),
                    backgroundDecoration:
                        const BoxDecoration(color: Colors.transparent),
                    pageController: pageController,
                  ),
                ),
                // ***CLICKABLE DOTS TO SHOW IMAGES LENGTH***
                Flexible(
                    child: Wrap(
                  alignment: WrapAlignment.center,
                  children: pictures.map((url) {
                    final int index = pictures.indexOf(url);
                    return GestureDetector(
                      onTap: () => pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      ),
                      child: Container(
                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(
                          vertical: 3.0,
                          horizontal: 3.0,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPicture == index
                              ? Theme.of(context).colorScheme.secondary
                              : Colors.grey[100],
                        ),
                      ),
                    );
                  }).toList(),
                )),
              ]),
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class PlatformsAndTechnologies extends StatelessWidget {
  final List<String> platformItems;

  const PlatformsAndTechnologies({
    Key? key,
    required this.platformItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 4.0,
      children: platformItems
          .map(
            (e) => BackgroundedTag(
              text: Text(
                e,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              bgColor: Theme.of(context).primaryColor,
            ),
          )
          .toList(),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback action;

  const CustomIconButton({
    Key? key,
    required this.icon,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: ShapeDecoration(
        color: Theme.of(context).primaryColor,
        shape: CircleBorder(
          side: BorderSide(
              color: Theme.of(context).unselectedWidgetColor, width: 0.25),
        ),
      ),
      child: IconButton(
        padding: const EdgeInsets.all(0.0),
        icon: IconTheme(
          data: Theme.of(context).iconTheme.copyWith(size: 18.5),
          child: icon,
        ),
        onPressed: action,
        splashRadius: 24.0,
      ),
    );
  }
}
