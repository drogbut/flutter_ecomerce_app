import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  LoginCubit() : super(const LoginState()) {
    _loadRememberedCredentials();
  }

  /// Toggle RememberMe checkbox
  void toggleRememberMe(bool value) {
    emit(state.copyWith(rememberMe: value));
  }

  /// Toggle password visibility
  void toggleHidePassword() {
    emit(state.copyWith(hidePassword: !state.hidePassword));
  }

  /// Load saved credentials from SharedPreferences
  Future<void> _loadRememberedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('REMEMBER_ME_EMAIL') ?? '';
    final savedPassword = prefs.getString('REMEMBER_ME_PASSWORD') ?? '';

    emailController.text = savedEmail;
    passwordController.text = savedPassword;

    if (savedEmail.isNotEmpty && savedPassword.isNotEmpty) {
      emit(state.copyWith(rememberMe: true));
    }
  }

  /// Save credentials to SharedPreferences
  Future<void> saveCredentialsIfNeeded() async {
    if (state.rememberMe) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('REMEMBER_ME_EMAIL', emailController.text.trim());
      await prefs.setString('REMEMBER_ME_PASSWORD', passwordController.text.trim());
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
