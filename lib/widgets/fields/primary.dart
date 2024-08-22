import 'package:flutter/material.dart';

class MyPrimaryTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;

  const MyPrimaryTextField({
    this.controller,
    this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
