import 'package:equatable/equatable.dart';

abstract class EmailVerificationState extends Equatable {
  const EmailVerificationState();

  @override
  List<Object?> get props => [];
}

class EmailVerificationInitial extends EmailVerificationState {}

class EmailVerificationLoading extends EmailVerificationState {}

class EmailVerificationSuccess extends EmailVerificationState {}

class EmailVerificationFailure extends EmailVerificationState {
  final String message;
  const EmailVerificationFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class EmailVerificationVerified extends EmailVerificationState {}
