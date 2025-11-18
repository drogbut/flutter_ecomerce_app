import 'package:equatable/equatable.dart';

class OnboardingState extends Equatable {
  /// The current page index.
  final int currentPage;

  /// Whether onboarding has been completed.
  final bool completed;

  const OnboardingState({
    required this.currentPage,
    this.completed = false,
  });

  OnboardingState copyWith({
    int? currentPage,
    bool? completed,
  }) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      completed: completed ?? this.completed,
    );
  }

  @override
  List<Object?> get props => [currentPage, completed];
}
