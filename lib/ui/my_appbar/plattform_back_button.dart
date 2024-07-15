import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/utilities/platform.dart';
import '../../locator.dart';

class MyAppBarBackButton extends StatelessWidget {
  final Function()? onPressed;

  const MyAppBarBackButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: getIcon(),
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      onPressed: onPressed ??
          () {
            Navigator.maybePop(context);
          },
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
