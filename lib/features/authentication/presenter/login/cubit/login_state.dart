import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool rememberMe;
  final bool hidePassword;
  final bool isLoading;
  final String? errorMessage;

  const LoginState({
    this.rememberMe = false,
    this.hidePassword = true,
    this.isLoading = false,
    this.errorMessage,
  });

  LoginState copyWith({
    bool? rememberMe,
    bool? hidePassword,
    bool? isLoading,
    String? errorMessage,
  }) {
    return LoginState(
      rememberMe: rememberMe ?? this.rememberMe,
      hidePassword: hidePassword ?? this.hidePassword,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [rememberMe, hidePassword, isLoading, errorMessage];
}
