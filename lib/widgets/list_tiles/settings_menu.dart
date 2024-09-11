import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/colors.dart';

class TSettingsMenuTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData? iconData;
  final Widget? trailing;

  const TSettingsMenuTile({
    super.key,
    required this.title,
    required this.subTitle,
    this.iconData,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: Icon(
        iconData,
        size: 28,
        color: TColors.primary,
      ),
      title: Text(title, style: context.textTheme.titleMedium),
      subtitle: Text(
        subTitle,
        style: context.textTheme.labelMedium,
      ),
      trailing: trailing,
    );
  }
}
