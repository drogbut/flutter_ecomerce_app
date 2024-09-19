import 'package:flutter/material.dart';

import '../../core/constants/sizes.dart';
import '../../core/extensions/widget.dart';

class TPrimaryTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool expands;
  final bool isObscureText;
  final String? Function(String?)? validator;

  const TPrimaryTextField({
    this.controller,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.expands = false,
    this.isObscureText = false,
    this.validator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      expands: expands,
      obscureText: isObscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        labelText: label,
        suffixIcon: suffixIcon,
      ),
    ).withPadding(TSizes.spaceBtwInputFields.bottomPadding);
  }
}
