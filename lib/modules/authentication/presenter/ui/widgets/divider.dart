import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/extensions/context.dart';

class LoginDivider extends StatelessWidget {
  const LoginDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// Left
        Flexible(
          child: Divider(
            color: context.isDarkMode ? DColors.darkGrey : DColors.grey,
            thickness: 0.5,
            indent: 5,
            endIndent: 60,
          ),
        ),

        /// OR
        Text(
          context.translate.or.capitalize!,
        ),

        /// Right
        Flexible(
          child: Divider(
            color: context.isDarkMode ? DColors.darkGrey : DColors.grey,
            thickness: 0.5,
            indent: 60,
            endIndent: 5,
          ),
        ),
      ],
    );
  }
}
