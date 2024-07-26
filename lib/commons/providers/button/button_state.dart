part of 'button_state_cubit.dart';

@immutable
sealed class ButtonState {}

final class ButtonInitialState extends ButtonState {}

final class ButtonLoadingState extends ButtonState {}

final class ButtonSuccessState extends ButtonState {
  final String successMessage;
  ButtonSuccessState({required this.successMessage});
}

final class ButtonFailureState extends ButtonState {
  final String errorMessage;
  ButtonFailureState({required this.errorMessage});
}
