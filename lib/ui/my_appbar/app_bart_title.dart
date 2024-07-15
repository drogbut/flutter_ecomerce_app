import 'package:flutter/material.dart';

class TwAppBarTitle extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final double? customHeight;

  const TwAppBarTitle({
    required this.title,
    this.leading,
    this.actions,
    this.bottom,
    this.customHeight,
    super.key,
  });

  @override
  Size get preferredSize => Size.fromHeight(customHeight ?? kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      titleSpacing: 0,
      title: Text(title),
      actions: actions ??
          [
            const SizedBox(width: 15),
          ],
      bottom: bottom,
    );
  }
}
