import 'package:equatable/equatable.dart';

class CarouselState extends Equatable {
  final int currentPageIndex;

  const CarouselState({
    this.currentPageIndex = 0,
  });

  CarouselState copyWith({
    int? currentPageIndex,
  }) {
    return CarouselState(
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
    );
  }

  @override
  List<Object?> get props => [currentPageIndex];
}




