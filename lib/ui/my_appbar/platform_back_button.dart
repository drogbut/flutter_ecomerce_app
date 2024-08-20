import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/extensions/context.dart';
import '../../core/extensions/widget.dart';
import '../../locator.dart';
import '../../utilities/platform.dart';

class MyAppBarBackButton extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget? title;
  final Widget? action;
  final Color? backgroundColor;
  final bool hideBack;
  final double? customHeight;
  final Function()? onPressed;

  const MyAppBarBackButton({
    this.title,
    this.hideBack = false,
    this.action,
    this.backgroundColor,
    this.customHeight,
    this.onPressed,
    super.key,
  });

  @override
  Size get preferredSize => Size.fromHeight(customHeight ?? kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,
      title: title ?? const Text(''),
      actions: [action ?? 0.sbs],
      leading: hideBack
          ? null
          : IconButton(
              icon: Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: context.colorScheme.primaryContainer.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: getIcon(),
              ),
              tooltip: MaterialLocalizations.of(context).backButtonTooltip,
              onPressed: onPressed ??
                  () {
                    Navigator.maybePop(context);
                  },
            ),
    );
  }

  Widget getIcon() {
    UtilityPlatform platformUtil = sl.get<UtilityPlatform>();
    if (!platformUtil.isIOS) {
      return const FaIcon(FontAwesomeIcons.arrowLeft);
    }

    return const FaIcon(FontAwesomeIcons.chevronLeft);
  }
}
