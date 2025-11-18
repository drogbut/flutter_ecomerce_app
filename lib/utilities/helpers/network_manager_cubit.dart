import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'network_manager_state.dart';

/// Manages the network connectivity status and provides methods to check and handle connectivity changes.
class NetworkManagerCubit extends Cubit<NetworkManagerState> {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  NetworkManagerCubit() : super(const NetworkManagerState()) {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  /// Update the connection status based on changes in connectivity and show a relevant popup for no internet connection.
  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    final isConnected = !result.contains(ConnectivityResult.none);
    emit(state.copyWith(
      connectionStatus: result,
      isConnected: isConnected,
    ));
    
    // Note: Toast notification should be handled by the UI layer using BlocListener
    // if (!isConnected) {
    //   TLoaders.customToast(message: 'No Internet Connection', context: context);
    // }
  }

  /// Check the internet connection status.
  /// Returns ⁠ true ⁠ if connected, ⁠ false ⁠ otherwise.
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      final connected = !result.any((element) => element == ConnectivityResult.none);
      emit(state.copyWith(isConnected: connected));
      return connected;
    } on PlatformException catch (_) {
      emit(state.copyWith(isConnected: false));
      return false;
    }
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}

