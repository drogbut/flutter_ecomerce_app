part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object?> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterUpdated extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final String email;
  const RegisterSuccess(this.email);

  @override
  List<Object?> get props => [email];
}

class RegisterFailure extends RegisterState {
  final String message;
  const RegisterFailure(this.message);

  @override
  List<Object?> get props => [message];
}
