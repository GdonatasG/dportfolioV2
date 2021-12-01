import 'package:flutter/material.dart';

class TextTile extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final bool? isSingleLine;

  final Icon? leading;
  final Icon? trailing;

  final VoidCallback? onTap;

  const TextTile({
    Key? key,
    this.title,
    this.subtitle,
    this.isSingleLine,
    this.leading,
    this.trailing,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: leading != null
            ? IconTheme(
                data: Theme.of(context).iconTheme,
                child: leading!,
              )
            : null,
        trailing: trailing != null
            ? IconTheme(
                data: Theme.of(context).iconTheme,
                child: trailing!,
              )
            : null,
        onTap: onTap,
        title: Text(
          title ?? '',
          overflow: (isSingleLine ?? false)
              ? TextOverflow.ellipsis
              : TextOverflow.visible,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        subtitle: subtitle != null
            ? Text(
                subtitle ?? '',
                style: Theme.of(context).textTheme.bodyText1,
              )
            : null,
      ),
    );
  }
}
