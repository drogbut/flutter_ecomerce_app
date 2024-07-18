import 'package:flutter/material.dart';

class MyPrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;

  const MyPrimaryButton({
    required this.title,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        title,
        //style: context.textTheme.,
      ),
    );
  }
}
