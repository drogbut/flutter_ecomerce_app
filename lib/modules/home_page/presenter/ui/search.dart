import 'package:flutter/material.dart';

import '../../../../core/constants/my_styles.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(12),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(MyStyles.buttonRadius)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(MyStyles.buttonRadius)),
          prefixIcon: const Icon(Icons.search),
          hintText: 'search'),
    );
  }
}
