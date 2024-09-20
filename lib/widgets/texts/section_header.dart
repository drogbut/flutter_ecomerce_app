import 'package:flutter/material.dart';

import '../../core/extensions/context.dart';
import '../../core/extensions/widget.dart';

class TSectionHeader extends StatelessWidget {
  final String title, buttonTitle;
  final Color? textColor;
  final VoidCallback? onPressed;
  final bool showActionButton;
  final Widget? actionButton;

  const TSectionHeader({
    required this.title,
    this.textColor,
    this.buttonTitle = 'View all',
    this.onPressed,
    this.showActionButton = false,
    this.actionButton,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.headlineSmall?.copyWith(color: textColor, fontSize: 16),
        ),
        (showActionButton)
            ? TextButton(
                onPressed: onPressed,
                child: Text(buttonTitle),
              )
            : actionButton ?? 0.sbs,
      ],
    );
  }
}
