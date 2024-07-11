import 'package:flutter/material.dart';

/// An extension on the Widget class providing additional widget modifiers.
extension WidgetExt on Widget {
  /// Adds padding to the widget.
  Widget withPadding(EdgeInsets insets) => Padding(
        padding: insets,
        child: this,
      );

  /// Wraps the widget with a Scrollbar.
  Widget withScrollbar() => Scrollbar(
        thumbVisibility: true,
        child: this,
      );
}

/// An extension on the num class providing various space and padding utilities.
extension SpaceExt on num {
  /// Returns a SizedBox with a specified height.
  SizedBox get sbh => this > 0 ? SizedBox(height: toDouble()) : _sh;

  /// Returns a SizedBox with a specified width.
  SizedBox get sbw => this > 0 ? SizedBox(width: toDouble()) : _sh;

  /// Returns a SizedBox with both specified width and height.
  SizedBox get sbs => this > 0
      ? SizedBox(
          width: toDouble(),
          height: toDouble(),
        )
      : _sh;

  /// Returns an empty SizedBox.
  SizedBox get _sh => const SizedBox.shrink();

  /// Returns EdgeInsets with equal padding on all sides.
  EdgeInsets get allPadding => EdgeInsets.all(toDouble());

  /// Returns EdgeInsets with vertical padding.
  EdgeInsets get verticalPadding => EdgeInsets.symmetric(vertical: toDouble());

  /// Returns EdgeInsets with horizontal padding.
  EdgeInsets get horizontalPadding =>
      EdgeInsets.symmetric(horizontal: toDouble());

  /// Returns EdgeInsets with left padding.
  EdgeInsets get leftPadding => EdgeInsets.only(left: toDouble());

  /// Returns EdgeInsets with right padding.
  EdgeInsets get rightPadding => EdgeInsets.only(right: toDouble());

  /// Returns EdgeInsets with top padding.
  EdgeInsets get topPadding => EdgeInsets.only(top: toDouble());

  /// Returns EdgeInsets with bottom padding.
  EdgeInsets get bottomPadding => EdgeInsets.only(bottom: toDouble());
}

/// An extension on a record with horizontal and vertical padding.
extension PadExt on ({num h, num v}) {
  /// Returns EdgeInsets with symmetric padding.
  EdgeInsets get symmetricPadding =>
      EdgeInsets.symmetric(horizontal: h.toDouble(), vertical: v.toDouble());
}

/// An extension on a record with padding for two sides.
extension PadExtTwoSides on (num, num) {
  /// Returns EdgeInsets with top and bottom padding.
  EdgeInsets get topBottomPadding =>
      EdgeInsets.only(top: $1.toDouble(), bottom: $2.toDouble());

  /// Returns EdgeInsets with left and right padding.
  EdgeInsets get leftRightPadding =>
      EdgeInsets.only(left: $1.toDouble(), right: $2.toDouble());

  /// Returns EdgeInsets with top and left padding.
  EdgeInsets get topLeftPadding =>
      EdgeInsets.only(top: $1.toDouble(), left: $2.toDouble());

  /// Returns EdgeInsets with top and right padding.
  EdgeInsets get topRightPadding =>
      EdgeInsets.only(top: $1.toDouble(), right: $2.toDouble());

  /// Returns EdgeInsets with bottom and left padding.
  EdgeInsets get bottomLeftPadding =>
      EdgeInsets.only(bottom: $1.toDouble(), left: $2.toDouble());

  /// Returns EdgeInsets with bottom and right padding.
  EdgeInsets get bottomRightPadding =>
      EdgeInsets.only(bottom: $1.toDouble(), right: $2.toDouble());
}

/// An extension on a record with padding for three sides.
extension PadExtThreeSides on (num, num, num) {
  /// Returns EdgeInsets with left, top, and right padding.
  EdgeInsets get leftTopRightPadding => EdgeInsets.only(
      left: $1.toDouble(), top: $2.toDouble(), right: $3.toDouble());

  /// Returns EdgeInsets with left, top, and bottom padding.
  EdgeInsets get leftTopBottomPadding => EdgeInsets.only(
      left: $1.toDouble(), top: $2.toDouble(), bottom: $3.toDouble());

  /// Returns EdgeInsets with left, right, and bottom padding.
  EdgeInsets get leftRightBottomPadding => EdgeInsets.only(
      left: $1.toDouble(), right: $2.toDouble(), bottom: $3.toDouble());

  /// Returns EdgeInsets with top, right, and bottom padding.
  EdgeInsets get topRightBottomPadding => EdgeInsets.only(
      top: $1.toDouble(), right: $2.toDouble(), bottom: $3.toDouble());
}

/// An extension on a record with padding for all four sides.
extension PadLtrbExt on (num, num, num, num) {
  /// Returns EdgeInsets with padding around all four sides.
  EdgeInsets get aroundPadding => EdgeInsets.only(
        left: $1.toDouble(),
        top: $2.toDouble(),
        right: $3.toDouble(),
        bottom: $4.toDouble(),
      );
}

/// An extension on a record with width and height.
extension SizeExt on (num?, num?) {
  /// Returns a SizedBox with specified width and height, or a shrinked SizedBox if both are zero.
  SizedBox get pwh =>
      ($1 == $2 && $1 == 0) ? const SizedBox.shrink() : ($1, $2)._pwh;

  /// Returns a SizedBox with specified width and height.
  SizedBox get _pwh => SizedBox(
        width: $1 != null && $1! > 0 ? $1!.toDouble() : double.infinity,
        height: $2 != null && $2! > 0 ? $2!.toDouble() : double.infinity,
      );
}

/// An extension on a record with width, height, and color.
extension ColoredExt on (num?, num?, Color?) {
  /// Returns a ColoredBox with the specified width, height, and color.
  ColoredBox get cb => ColoredBox(
        color: $3 ?? Colors.transparent,
        child: ($1, $2).pwh,
      );
}
