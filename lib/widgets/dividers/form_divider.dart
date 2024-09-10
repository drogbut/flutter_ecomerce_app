import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/colors.dart';

class TFormDivider extends StatelessWidget {
  final String? label;

  const TFormDivider({this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// Left
        Flexible(
          child: Divider(
            color: context.isDarkMode ? TColors.darkGrey : TColors.grey,
            thickness: 0.5,
            indent: 5,
            endIndent: 60,
          ),
        ),

        /// Label
        Text(label?.capitalize ?? ''),

        /// Right
        Flexible(
          child: Divider(
              color: context.isDarkMode ? TColors.darkGrey : TColors.grey, thickness: 0.5, indent: 60, endIndent: 5),
        ),
      ],
    );
  }
}
