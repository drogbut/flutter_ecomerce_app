import 'package:flutter/foundation.dart';

import '../../../domain/enums/app_state.dart';

class AuthenticationProvider {
  final ValueNotifier<AuthState> _authStateNotifier = ValueNotifier(AuthState.displaySplash);

  AuthenticationProvider() {
    appStarted();
  }

  ValueNotifier<AuthState> get authStateNotifier => _authStateNotifier;

  AuthState get authState => _authStateNotifier.value;

  void setAuthState(AuthState value) => _authStateNotifier.value = value;

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 2));
    setAuthState(AuthState.unauthenticated);
  }

  void authenticate() {
    setAuthState(AuthState.authenticated);
  }

  void unAuthenticate() {
    setAuthState(AuthState.unauthenticated);
  }

  void displaySplash() {
    setAuthState(AuthState.displaySplash);
  }
}
