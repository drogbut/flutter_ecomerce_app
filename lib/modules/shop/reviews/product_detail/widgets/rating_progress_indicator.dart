import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';

class TRatingProgressIndicator extends StatelessWidget {
  final String text;
  final double? value;
  final double? linearWith;

  const TRatingProgressIndicator({
    super.key,
    required this.text,
    required this.value,
    this.linearWith,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// number
        Expanded(flex: 1, child: Text(text)),

        /// linear
        Expanded(
          flex: 11,
          child: SizedBox(
            width: linearWith,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 11,
              backgroundColor: TColors.grey,
              borderRadius: BorderRadius.circular(7),
              //valueColor: AllwaysStoppedAnimation(),
            ),
          ),
        ),
      ],
    );
  }
}
