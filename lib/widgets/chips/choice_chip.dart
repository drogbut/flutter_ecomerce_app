import 'package:flutter/material.dart';

import '../../core/extensions/widget.dart';
import '../containers/rounded_container.dart';

class TChoiceChip extends StatelessWidget {
  final Color? colorName;
  final String text;
  final bool selected;
  final Function(bool)? onSelected;

  const TChoiceChip({
    super.key,
    this.colorName,
    this.selected = false,
    this.onSelected,
    this.text = '',
  });

  @override
  Widget build(BuildContext context) {
    final hasColor = colorName != null;

    return ChoiceChip(
      label: hasColor ? 0.sbs : Text(text),
      selected: selected,
      onSelected: onSelected,
      labelStyle: TextStyle(color: selected ? Colors.white : null),
      avatar: hasColor ? TRoundedContainer(width: 50, height: 50, backgroundColor: colorName!) : null,
      shape: hasColor ? const CircleBorder() : null,
      padding: hasColor ? EdgeInsets.zero : null,
      labelPadding: hasColor ? EdgeInsets.zero : null,
      backgroundColor: colorName,
    );
  }
}
