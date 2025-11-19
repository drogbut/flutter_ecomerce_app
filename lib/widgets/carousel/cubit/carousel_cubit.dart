import 'package:flutter_bloc/flutter_bloc.dart';

import 'carousel_state.dart';

class CarouselCubit extends Cubit<CarouselState> {
  CarouselCubit() : super(const CarouselState());

  /// update current index when the page change
  void updatePageIndicator(int index) {
    emit(state.copyWith(currentPageIndex: index));
  }
}




