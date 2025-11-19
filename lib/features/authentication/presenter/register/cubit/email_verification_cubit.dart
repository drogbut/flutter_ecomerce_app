import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/auth_repository.dart';
import 'email_verification_state.dart';

class EmailVerificationCubit extends Cubit<EmailVerificationState> {
  final AuthenticationRepository _authRepository;
  late Timer _timer;
  final User? user;

  EmailVerificationCubit(this._authRepository, {this.user}) : super(EmailVerificationInitial()) {
    sendVerificationEmail();
    _startVerificationTimer();
  }

  Future<void> sendVerificationEmail() async {
    try {
      emit(EmailVerificationLoading());
      await _authRepository.sendEmailVerification();
      emit(EmailVerificationSuccess());
    } catch (e) {
      emit(EmailVerificationFailure(e.toString()));
    }
  }

  void _startVerificationTimer() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) async {
      final currentUser = FirebaseAuth.instance.currentUser;
      await currentUser?.reload();

      if (currentUser?.emailVerified ?? false) {
        timer.cancel();
        emit(EmailVerificationVerified());
      }
    });
  }

  Future<void> checkEmailVerified() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    await currentUser?.reload();
    if (currentUser?.emailVerified ?? false) {
      emit(EmailVerificationVerified());
    } else {
      emit(EmailVerificationFailure('Email not verified yet.'));
    }
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }
}
