import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
        TextSpan(text: "$firstText "),
        TextSpan(
            text: secondText,
            recognizer: secondRecognizer,
            style: const TextStyle(fontWeight: FontWeight.bold))
      ]),
    );
  }
}
