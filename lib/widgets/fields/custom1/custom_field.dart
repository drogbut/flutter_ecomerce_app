import 'package:flutter/material.dart';
import '../../../core/extensions/context.dart';

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
