import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../authentication/data/repository/auth_repository.dart';
import '../../authentication/presenter/onboarding/service/onboarding_prefs.dart';
import 'auth_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  /// Repository
  final AuthenticationRepository _authRepository;

  /// CONSTRUCTORS
  AuthenticationCubit(this._authRepository) : super(AuthenticationInitial());

  // /// Initialize app
  // Future<void> initializeApp() async {
  //   emit(AuthenticationLoading());
  //   try {
  //     final isFirstLaunch = await _authRepository.isFirstLaunch();
  //     final user = _authRepository.authUser;
  //
  //     if (isFirstLaunch) {
  //       emit(AuthenticationFirstLaunch());
  //     } else if (user == null) {
  //       emit(AuthenticationUnauthenticated());
  //     } else {
  //       emit(AuthenticationAuthenticated(user));
  //     }
  //   } catch (e) {
  //     emit(AuthenticationFailure(e.toString()));
  //   }
  // }

  Future<void> initializeApp() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isFirstLaunch = prefs.getBool(OnboardingPrefsKeys.isFirstTime) ?? true;

      // Si onboarding déjà fait → pas besoin de Loading
      if (!isFirstLaunch) {
        final user = _authRepository.authUser;
        if (user != null) {
          emit(AuthenticationAuthenticated(user));
        } else {
          emit(AuthenticationUnauthenticated());
        }
        return; // Short-circuit: on évite AuthenticationLoading
      }

      // Sinon flow classique pour le premier lancement
      emit(AuthenticationLoading());

      final user = _authRepository.authUser;

      if (isFirstLaunch) {
        emit(AuthenticationFirstLaunch());
      } else if (user != null) {
        emit(AuthenticationAuthenticated(user));
      } else {
        emit(AuthenticationUnauthenticated());
      }
    } catch (e) {
      emit(AuthenticationUnauthenticated());
    }
  }

  /// Complete onboarding.
  Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(OnboardingPrefsKeys.isFirstTime, false);

    emit(AuthenticationUnauthenticated());
  }

  /// Login
  Future<void> login(String email, String password) async {
    emit(AuthenticationLoading());
    try {
      final credential = await _authRepository.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthenticationAuthenticated(credential.user!));
    } catch (e) {
      emit(AuthenticationFailure(e.toString()));
    }
  }

  /// Register
  Future<void> register(String email, String password) async {
    emit(AuthenticationLoading());
    try {
      final credential = await _authRepository.registerWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthenticationAuthenticated(credential.user!));
    } catch (e) {
      emit(AuthenticationFailure(e.toString()));
    }
  }

  /// Google Sign-In
  Future<void> signInWithGoogle() async {
    emit(AuthenticationLoading());
    try {
      // final credential = await _authRepository.signInWithGoogle();
      // emit(AuthenticationAuthenticated(credential.user!));
    } catch (e) {
      emit(AuthenticationFailure(e.toString()));
    }
  }

  /// Logout
  Future<void> logout() async {
    emit(AuthenticationLoading());
    try {
      await _authRepository.logout();
      emit(AuthenticationUnauthenticated());
    } catch (e) {
      emit(AuthenticationFailure(e.toString()));
    }
  }

  /// Delete account
  Future<void> deleteAccount() async {
    emit(AuthenticationLoading());
    try {
      await _authRepository.deleteAccount();
      emit(AuthenticationUnauthenticated());
    } catch (e) {
      emit(AuthenticationFailure(e.toString()));
    }
  }
}
