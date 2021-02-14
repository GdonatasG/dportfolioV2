import 'package:dportfolio_v2/presentation/afterTutorial/widgets/contact_page/contact_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformWidget extends StatelessWidget {
  final Widget icon;
  final Color iconColor;
  final String description;
  final String buttonText;
  final Function action;

  const PlatformWidget(
      {Key key,
      @required this.icon,
      @required this.iconColor,
      @required this.description,
      @required this.buttonText,
      @required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 160.0,
        maxWidth: 160.0,
        minHeight: 160.0,
      ),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.5,
            color: Theme.of(context).unselectedWidgetColor,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconTheme(
              data: IconThemeData(color: iconColor, size: PLATFORM_ICON_SIZE),
              child: icon,
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyText1,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 5.0,
            ),
            DividerTheme(
              data: Theme.of(context).dividerTheme,
              child: const Divider(
                height: 10.0,
              ),
            ),
            // ignore: sized_box_for_whitespace
            Container(
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
                onPressed: action,
                child: Text(
                  buttonText.toUpperCase(),
                  style: const TextStyle(fontSize: 11.5),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
