import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../locator.dart';
import '../../../domain/use_cases/get_ages.dart';
import 'display_age_state.dart';

class AgesDisplayCubit extends Cubit<DisplayAgeState> {
  AgesDisplayCubit() : super(AgesLoading());

  void displayAges() async {
    var ageResponse = await sl<GetAgesUseCase>().call();

    ageResponse.fold((message) {
      emit(AgesLoadFailure(errorMessage: message));
    }, (data) {
      emit(AgesLoaded(agesSnapshot: data));
    });
  }
}
