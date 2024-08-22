import 'package:flutter/material.dart';

import '../../../../core/constants/sizes.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(12),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(DSizes.buttonRadius)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(DSizes.buttonRadius)),
          prefixIcon: const Icon(Icons.search),
          hintText: 'search'),
    );
  }
}
