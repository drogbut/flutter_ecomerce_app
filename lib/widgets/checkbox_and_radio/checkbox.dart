import 'package:flutter/material.dart';

import '../../core/constants/sizes.dart';
import '../../core/extensions/context.dart';

class TCheckBoxListTile extends StatelessWidget {
  final bool? value;
  final Function(bool?)? onChanged;
  final String? title;

  const TCheckBoxListTile({
    required this.value,
    required this.onChanged,
    this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListTileTheme(
        horizontalTitleGap: TSizes.xs,
        child: CheckboxListTile(
          value: value,
          contentPadding: EdgeInsets.zero,
          title: Text(title ?? '', style: context.textTheme.bodyMedium),
          controlAffinity: ListTileControlAffinity.leading,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
