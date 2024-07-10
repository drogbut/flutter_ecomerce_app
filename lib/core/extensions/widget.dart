import 'package:flutter/material.dart';

extension WidgetExt on Widget {
  Widget withPadding(EdgeInsets insets) => Padding(
        padding: insets,
        child: this,
      );

  Widget withScrollbar() => Scrollbar(
        thumbVisibility: true,
        child: this,
      );
}

extension SpaceExt on num {
  SizedBox get sbh => this > 0 ? SizedBox(height: toDouble()) : _sh;
  SizedBox get sbw => this > 0 ? SizedBox(width: toDouble()) : _sh;
  SizedBox get sbs => this > 0
      ? SizedBox(
          width: toDouble(),
          height: toDouble(),
        )
      : _sh;
  SizedBox get _sh => const SizedBox.shrink();

  EdgeInsets get allPadding => EdgeInsets.all(toDouble());
  EdgeInsets get verticalPadding => EdgeInsets.symmetric(vertical: toDouble());
  EdgeInsets get horizontalPadding => EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get leftPadding => EdgeInsets.only(left: toDouble());
  EdgeInsets get rightPadding => EdgeInsets.only(right: toDouble());
  EdgeInsets get topPadding => EdgeInsets.only(top: toDouble());
  EdgeInsets get bottomPadding => EdgeInsets.only(bottom: toDouble());
}

extension PadExt on ({num h, num v}) {
  EdgeInsets get symmetricPadding => EdgeInsets.symmetric(horizontal: h.toDouble(), vertical: v.toDouble());
}

extension PadExtTwoSides on (num, num) {
  EdgeInsets get topBottomPadding => EdgeInsets.only(top: $1.toDouble(), bottom: $2.toDouble());
  EdgeInsets get leftRightPadding => EdgeInsets.only(left: $1.toDouble(), right: $2.toDouble());
  EdgeInsets get topLeftPadding => EdgeInsets.only(top: $1.toDouble(), left: $2.toDouble());
  EdgeInsets get topRightPadding => EdgeInsets.only(top: $1.toDouble(), right: $2.toDouble());
  EdgeInsets get bottomLeftPadding => EdgeInsets.only(bottom: $1.toDouble(), left: $2.toDouble());
  EdgeInsets get bottomRightPadding => EdgeInsets.only(bottom: $1.toDouble(), right: $2.toDouble());
}

extension PadExtThreeSides on (num, num, num) {
  EdgeInsets get leftTopRightPadding => EdgeInsets.only(left: $1.toDouble(), top: $2.toDouble(), right: $3.toDouble());
  EdgeInsets get leftTopBottomPadding =>
      EdgeInsets.only(left: $1.toDouble(), top: $2.toDouble(), bottom: $3.toDouble());
  EdgeInsets get leftRightBottomPadding =>
      EdgeInsets.only(left: $1.toDouble(), right: $2.toDouble(), bottom: $3.toDouble());
  EdgeInsets get topRightBottomPadding =>
      EdgeInsets.only(top: $1.toDouble(), right: $2.toDouble(), bottom: $3.toDouble());
}

extension PadLtrbExt on (num, num, num, num) {
  EdgeInsets get aroundPadding => EdgeInsets.only(
        left: $1.toDouble(),
        top: $2.toDouble(),
        right: $3.toDouble(),
        bottom: $4.toDouble(),
      );
}

extension SizeExt on (num?, num?) {
  SizedBox get pwh => ($1 == $2 && $1 == 0) ? const SizedBox.shrink() : ($1, $2)._pwh;
  SizedBox get _pwh => SizedBox(
        width: $1 != null && $1! > 0 ? $1!.toDouble() : double.infinity,
        height: $2 != null && $2! > 0 ? $2!.toDouble() : double.infinity,
      );
}

extension ColoredExt on (num?, num?, Color?) {
  ColoredBox get cb => ColoredBox(
        color: $3 ?? Colors.transparent,
        child: ($1, $2).pwh,
      );
}
