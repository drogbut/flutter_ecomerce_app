import 'package:flutter/material.dart';

import 'device.dart';

class SizingInfo {
  final DeviceScreenType deviceScreenType;
  final Size screenSize;
  final Size localWidgetSize;
  final BoxConstraints constraints;

  SizingInfo({
    required this.deviceScreenType,
    required this.screenSize,
    required this.localWidgetSize,
    required this.constraints,
  });

  @override
  String toString() {
    return 'DeviceType:$deviceScreenType ScreenSize:$screenSize LocalWidgetSize:$localWidgetSize';
  }
}
