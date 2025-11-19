import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utilities/device/platform.dart';

/// Utility class for app routes.
class RouterUtil {
  /// Returns a page based on the current platform.
  static Page<T> getPlatFormPage<T>({
    required GoRouterState state,
    required Widget child,
    String? title,
    bool allowSnapshotting = true,
    bool isFullscreenDialog = false,
  }) {
    if (UtilityPlatform.isIOS) {
      return CupertinoPage<T>(
        key: state.pageKey,
        child: child,
        title: title,
        name: state.name ?? state.path,
        restorationId: state.pageKey.value,
        arguments: {
          ...state.pathParameters,
          ...state.uri.queryParameters,
        },
        allowSnapshotting: allowSnapshotting,
        fullscreenDialog: isFullscreenDialog,
      );
    }

    return MaterialPage<T>(
      key: state.pageKey,
      child: child,
      name: state.name ?? state.path,
      restorationId: state.pageKey.value,
      arguments: {
        ...state.pathParameters,
        ...state.uri.queryParameters,
      },
      allowSnapshotting: allowSnapshotting,
      fullscreenDialog: isFullscreenDialog,
    );
  }
}
