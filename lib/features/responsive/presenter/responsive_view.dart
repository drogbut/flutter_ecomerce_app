import 'package:flutter/material.dart';

import '../domain/device.dart';
import 'responsive_builder.dart';

class ResponsiveView extends StatelessWidget {
  final Widget phone;
  final Widget? wearable;
  final Widget? tablet;
  final Widget? desktop;
  final Widget? largeDesktop;

  const ResponsiveView({
    required this.phone,
    this.wearable,
    this.tablet,
    this.desktop,
    this.largeDesktop,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInfo) {
        DeviceScreenType currentScreenType = sizingInfo.deviceScreenType;

        switch (currentScreenType) {
          case DeviceScreenType.largeDesktop:
            return _returnFor4kDesktop();
          case DeviceScreenType.desktop:
            return _returnForDesktop();
          case DeviceScreenType.tablet:
            return _returnForTablet();
          case DeviceScreenType.wearable:
            return _returnForWearable();
          default:
            return phone;
        }
      },
    );
  }

  Widget _returnFor4kDesktop() {
    if (largeDesktop != null) {
      return largeDesktop!;
    }

    if (desktop != null) {
      return desktop!;
    }

    if (tablet != null) {
      return tablet!;
    }

    return phone;
  }

  Widget _returnForDesktop() {
    if (desktop != null) {
      return desktop!;
    }

    if (tablet != null) {
      return tablet!;
    }

    return phone;
  }

  Widget _returnForTablet() {
    if (tablet != null) {
      return tablet!;
    }

    return phone;
  }

  Widget _returnForWearable() {
    if (wearable != null) {
      return wearable!;
    }

    return phone;
  }
}
