import 'package:equatable/equatable.dart';

class BottomNavigationState extends Equatable {
  final int selectedIndex;

  const BottomNavigationState({
    this.selectedIndex = 0,
  });

  BottomNavigationState copyWith({
    int? selectedIndex,
  }) {
    return BottomNavigationState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  @override
  List<Object?> get props => [selectedIndex];
}




