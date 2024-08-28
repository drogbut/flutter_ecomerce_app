import 'package:flutter/material.dart';

import '../../core/constants/sizes.dart';
import '../../core/extensions/widget.dart';

class TPrimaryTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final IconData? prefixIcon;
  final Widget? suffixIcon;

  const TPrimaryTextField({
    this.controller,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        label: Text(label ?? ''),
        suffixIcon: suffixIcon,
      ),
    ).withPadding(TSizes.spaceBtwInputFields.bottomPadding);
  }
}
