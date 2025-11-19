import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

class NetworkManagerState extends Equatable {
  final List<ConnectivityResult> connectionStatus;
  final bool isConnected;

  const NetworkManagerState({
    this.connectionStatus = const [],
    this.isConnected = true,
  });

  NetworkManagerState copyWith({
    List<ConnectivityResult>? connectionStatus,
    bool? isConnected,
  }) {
    return NetworkManagerState(
      connectionStatus: connectionStatus ?? this.connectionStatus,
      isConnected: isConnected ?? this.isConnected,
    );
  }

  @override
  List<Object?> get props => [connectionStatus, isConnected];
}




