import 'package:flutter/material.dart';
import 'package:flutter_folders_structure/core/extensions/context.dart';

class CustomTextField extends StatefulWidget {
  final Widget textWidget;
  final Widget controlWidget;

  final double? height;
  final Color? color;

  const CustomTextField(
      {required this.textWidget,
      required this.controlWidget,
      Key? key,
      this.height,
      this.color})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
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
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: widget.controlWidget,
        ),
        widget.textWidget,
      ],
    );
  }
}

class CustomDropdownField extends StatefulWidget {
  final Widget textWidget;
  final Widget controlWidget;

  final double? height;
  final Color? color;

  const CustomDropdownField(
      {required this.textWidget,
      required this.controlWidget,
      Key? key,
      this.height,
      this.color})
      : super(key: key);

  @override
  State<CustomDropdownField> createState() => _CustomDropdownFieldState();
}

class _CustomDropdownFieldState extends State<CustomDropdownField> {
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
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: widget.controlWidget,
        ),
        widget.textWidget,
      ],
    );
  }
}

class CustomDateField extends StatefulWidget {
  final Widget textWidget;
  final Widget controlWidget;

  final double? height;
  final Color? color;

  const CustomDateField(
      {required this.textWidget,
      required this.controlWidget,
      Key? key,
      this.height,
      this.color})
      : super(key: key);

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

class CustomField extends CustomPainter {
  final BuildContext context;
  final Widget textWidget;
  final Widget controlWidget;

  final Color? color;

  const CustomField(
      {required this.context,
      required this.textWidget,
      required this.controlWidget,
      this.color})
      : super();

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = (color ?? Colors.red)
      ..strokeWidth = 1;
    var path = Path();

    // coverage:ignore-start
    if (color == null && context.isHighContrast) {
      paint.color = context.theme.colorScheme.primary;
      paint.strokeWidth = 0.5;
      paint.style = PaintingStyle.stroke;
    }
    // coverage:ignore-end

    // Measurements of the shape and widgets
    double widthControlWidget = ((controlWidget.key as GlobalKey)
            .currentContext!
            .findRenderObject() as RenderBox)
        .size
        .width;
    double heightControlWidget = ((controlWidget.key as GlobalKey)
            .currentContext!
            .findRenderObject() as RenderBox)
        .size
        .height;

    double widthTextWidget = ((textWidget.key as GlobalKey)
            .currentContext!
            .findRenderObject() as RenderBox)
        .size
        .width;
    double heigthTextWidget = ((textWidget.key as GlobalKey)
                .currentContext!
                .findRenderObject() as RenderBox)
            .size
            .height -
        7;

    double slopeOfset =
        10; // The smaller this number, the steeper the slope of the cutout
    double borderRadius = 5;
    double edgeChamfer = 5;

    // ==== Cutout ====
    path.moveTo(
        0, heigthTextWidget); // Move start of the shape under the textwidget
    path.lineTo(widthTextWidget, heigthTextWidget); // Draw to end of textwidget
    path.lineTo(widthTextWidget + slopeOfset,
        0); // Draw the slope to the top of the rectangle

    // ==== Rest of the rect ====
    path.lineTo(widthControlWidget - edgeChamfer, 0);
    path.arcToPoint(
      Offset(widthControlWidget, edgeChamfer),
      radius: Radius.circular(borderRadius),
    ); // Draw roundet corner, top right
    path.lineTo(widthControlWidget, heightControlWidget - edgeChamfer);
    path.arcToPoint(
      Offset(widthControlWidget - edgeChamfer, heightControlWidget),
      radius: Radius.circular(borderRadius),
    ); // Draw roundet corner, bottom right
    path.lineTo(edgeChamfer, heightControlWidget);
    path.arcToPoint(
      Offset(0, heightControlWidget - edgeChamfer),
      radius: Radius.circular(borderRadius),
    ); // Draw roundet corner, bottom left
    path.close();

    // === Draw the shape if widget is present ====
    canvas.drawPath(path, paint);
  }

  // coverage:ignore-start
  @override
  bool shouldRepaint(CustomField oldDelegate) => false;
  @override
  bool shouldRebuildSemantics(CustomField oldDelegate) => false;
  // coverage:ignore-end
}
