import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../core/extensions/context.dart';

class MyRichText extends StatelessWidget {
  final String? firstText;
  final String? secondText;
  final GestureRecognizer? firstRecognizer;
  final GestureRecognizer? secondRecognizer;

  const MyRichText({
    required this.firstText,
    required this.secondText,
    this.firstRecognizer,
    this.secondRecognizer,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: '$firstText ',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        TextSpan(
          text: secondText,
          recognizer: secondRecognizer,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: context.isDarkMode ? Colors.white : context.colorScheme.primary,
            decoration: TextDecoration.underline,
            decorationColor: context.isDarkMode ? Colors.white : context.colorScheme.primary,
          ),
        )
      ]),
    );
  }
}
