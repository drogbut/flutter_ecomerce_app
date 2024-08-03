import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../locator.dart';
import '../../../authentication/data/sources/auth_firebase_service.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 2));
    final isLogin = await sl<AuthFirebaseService>().isLogin();

    isLogin.fold(
      (failure) {
        emit(UnAuthenticated());
      },
      (isLogin) {
        if (isLogin) {
          emit(Authenticated());
        } else {
          emit(UnAuthenticated());
        }
      },
    );
  }
}
