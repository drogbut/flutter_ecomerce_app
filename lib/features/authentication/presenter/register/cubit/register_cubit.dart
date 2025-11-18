import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../app_settings/data/repository/user_repository.dart';
import '../../../data/models/user/user.dart';
import '../../../data/repository/auth_repository.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthenticationRepository _authRepository;
  final UserRepository _userRepository;

  RegisterCubit(this._authRepository, this._userRepository) : super(RegisterInitial());

  /// Form controllers
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool hidePassword = true;
  bool privacyPolicy = true;

  /// Toggle password visibility
  void togglePasswordVisibility() {
    hidePassword = !hidePassword;
    emit(RegisterUpdated());
  }

  /// Toggle privacy policy
  void togglePrivacyPolicy() {
    privacyPolicy = !privacyPolicy;
    emit(RegisterUpdated());
  }

  /// Signup user
  Future<void> signup() async {
    if (!formKey.currentState!.validate()) return;
    if (!privacyPolicy) {
      emit(RegisterFailure('You must accept privacy policy and terms of use'));
      return;
    }

    emit(RegisterLoading());
    try {
      // Register user in Firebase Auth
      final credential =
          await _authRepository.registerWithEmailAndPassword(email: email.text.trim(), password: password.text.trim());

      // Save user record
      final userModel = UserModel(
        id: credential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phone.text.trim(),
        profilePicture: '',
      );

      await _userRepository.saveUserRecord(user: userModel);

      emit(RegisterSuccess(email.text.trim()));
    } catch (e) {
      emit(RegisterFailure(e.toString()));
    }
  }
}
