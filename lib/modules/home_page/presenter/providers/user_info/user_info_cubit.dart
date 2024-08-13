import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../locator.dart';
import '../../../../authentication/domain/use_cases/get_user.dart';
import 'user_info_state.dart';

class UserinfoCubit extends Cubit<UserInfoState> {
  UserinfoCubit() : super(UserInfoLoading());

  void displayUserInfo() async {
    var userInfoResponse = await sl<GetUserUseCase>().call();

    userInfoResponse.fold((error) {
      emit(LoadUserInfoFailure(errorMessage: error));
    }, (data) {
      emit(UserInfoLoaded(user: data));
    });
  }
}
