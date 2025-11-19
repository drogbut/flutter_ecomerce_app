import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';

import 'network_manager_cubit.dart';

/// Helper class for NetworkManager to maintain compatibility with existing code
/// This is a wrapper around NetworkManagerCubit
class NetworkManager {
  /// Check the internet connection status.
  /// Returns ⁠ true ⁠ if connected, ⁠ false ⁠ otherwise.
  /// Note: This method can be used without context, but it's better to use NetworkManagerCubit directly
  static Future<bool> isConnected() async {
    try {
      final connectivity = Connectivity();
      final result = await connectivity.checkConnectivity();
      if (result.any((element) => element == ConnectivityResult.none)) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

  /// Get NetworkManagerCubit from context
  static NetworkManagerCubit of(context) {
    return context.read<NetworkManagerCubit>();
  }
}
