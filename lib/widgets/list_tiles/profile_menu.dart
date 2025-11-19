import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../core/constants/colors.dart';

class TProfileMenuTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData? iconData;
  final VoidCallback? onPressed;

  const TProfileMenuTile({
    super.key,
    required this.title,
    required this.subTitle,
    this.iconData = Iconsax.arrow_right_34,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      contentPadding: EdgeInsets.zero,
      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
      dense: true,
      minLeadingWidth: 100,
      leading: Text(title, style: Theme.of(context).textTheme.bodySmall),
      title: Text(
        subTitle,
        style: Theme.of(context).textTheme.bodyMedium,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Icon(iconData, size: 18, color: TColors.darkGrey),
    );
  }
}
