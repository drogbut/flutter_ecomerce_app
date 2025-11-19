import 'package:equatable/equatable.dart';

class UpdateNameState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final bool isSuccess;

  const UpdateNameState({
    this.isLoading = false,
    this.errorMessage,
    this.isSuccess = false,
  });

  UpdateNameState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isSuccess,
  }) {
    return UpdateNameState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, isSuccess];
}




