import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utilities/helpers/network_manager.dart';
import '../../../../../utilities/popups/full_screen_loader.dart';
import '../../../../../utilities/popups/loaders.dart';
import '../../../data/repository/auth_repository.dart';
import '../pages/reset_password_screen.dart';
import 'forgot_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final AuthenticationRepository _authRepository;

  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ForgetPasswordCubit(this._authRepository) : super(ForgetPasswordInitial());

  /// Send reset password email
  Future<void> sendPasswordResetEmail(BuildContext context) async {
    try {
      emit(ForgetPasswordLoading());
      TFullScreenLoader.openLoadingDialog(context, 'Processing your request...', 'assets/illustrations/delivered_plane.png');

      final isConnected = await NetworkManager.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading(context);
        return;
      }

      if (!formKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading(context);
        return;
      }

      await _authRepository.sendPasswordResetEmail(email: emailController.text.trim());

      TFullScreenLoader.stopLoading(context);
      TLoaders.successSnackbar(title: 'Email sent', message: 'Email link sent to reset your password', context: context);

      emit(const ForgetPasswordSuccess('Email link sent to reset your password'));

      // Navigate to ResetPasswordScreen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => ResetPasswordScreen(email: emailController.text.trim()),
        ),
      );
    } catch (e) {
      TFullScreenLoader.stopLoading(context);
      TLoaders.errorSnackbar(title: 'Error', message: e.toString(), context: context);
      emit(ForgetPasswordFailure(e.toString()));
    }
  }

  /// Optional: resend password email
  Future<void> resendPassword(BuildContext context, {required String email}) async {
    try {
      emit(ForgetPasswordLoading());
      TFullScreenLoader.openLoadingDialog(context, 'Processing your request...', 'assets/illustrations/delivered_plane.png');

      final isConnected = await NetworkManager.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading(context);
        return;
      }

      await _authRepository.sendPasswordResetEmail(email: email);

      TFullScreenLoader.stopLoading(context);
      TLoaders.successSnackbar(title: 'Email sent', message: 'Email link sent to reset your password', context: context);

      emit(const ForgetPasswordSuccess('Email link sent to reset your password'));
    } catch (e) {
      TFullScreenLoader.stopLoading(context);
      TLoaders.errorSnackbar(title: 'Error', message: e.toString(), context: context);
      emit(ForgetPasswordFailure(e.toString()));
    }
  }
}
