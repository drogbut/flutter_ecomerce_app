import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/sizes.dart';

class TSearchBar extends StatelessWidget {
  final String title;
  final IconData? icon;
  final bool showBackground, showBorder;

  const TSearchBar({
    super.key,
    required this.title,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          filled: showBackground ? true : false,
          fillColor: showBackground
              ? context.isDarkMode
                  ? TColors.dark
                  : TColors.light
              : Colors.transparent,
          contentPadding: const EdgeInsets.all(TSizes.spaceBtwItems),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(TSizes.buttonRadius),
            borderSide: BorderSide(color: showBorder ? TColors.grey : Colors.transparent),
          ),
          prefixIcon: Icon(icon),
          hintText: title),
    );
  }
}
