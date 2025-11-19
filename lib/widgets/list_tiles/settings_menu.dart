import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';

class TSettingsMenuTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData? iconData;
  final Widget? trailing;
  final VoidCallback? onTap;

  const TSettingsMenuTile({
    super.key,
    required this.title,
    required this.subTitle,
    this.iconData,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      onTap: onTap,
      leading: Icon(
        iconData,
        size: 28,
        color: TColors.primary,
      ),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      trailing: trailing,
    );
  }
}
