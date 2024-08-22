import 'package:flutter/material.dart';

import 'custom_field.dart';

class CustomDateField extends StatefulWidget {
  final Widget textWidget;
  final Widget controlWidget;
  final double? height;
  final Color? color;

  const CustomDateField({
    required this.textWidget,
    required this.controlWidget,
    this.height,
    this.color,
    super.key,
  });

  @override
  State<CustomDateField> createState() => _CustomDateFieldState();
}

class _CustomDateFieldState extends State<CustomDateField> {
  bool _isMounted = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isMounted = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (_isMounted) ...[
          CustomPaint(
            painter: CustomField(
              context: context,
              textWidget: widget.textWidget,
              controlWidget: widget.controlWidget,
              color: widget.color,
            ),
          ),
        ],
        Container(
          height: widget.height,
          padding: const EdgeInsets.only(top: 10),
          child: widget.controlWidget,
        ),
        widget.textWidget,
      ],
    );
  }
}
