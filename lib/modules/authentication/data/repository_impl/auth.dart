import 'package:dartz/dartz.dart';

import '../../../../locator.dart';
import '../../domain/entities/user_sign_in_request.dart';
import '../../domain/entities/user_signup_request.dart';
import '../../domain/repository/auth.dart';
import '../models/user.dart';
import '../sources/auth_firebase_service.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(UserSignUpRequest userRequest) async => await sl<AuthFirebaseService>().signup(userRequest);

  @override
  Future<Either> getAges() async => await sl<AuthFirebaseService>().getAges();

  @override
  Future<Either> signIn(UserSignInRequest userRequest) async => await sl<AuthFirebaseService>().signIn(userRequest);

  @override
  Future<Either> resetPassword(String email) async => await sl<AuthFirebaseService>().resetPassword(email);

  @override
  Future<Either> isLogin() async => await sl<AuthFirebaseService>().isLogin();

  @override
  Future<Either> getUser() async {
    var user = await sl<AuthFirebaseService>().getUser();

    return user.fold(
      (failure) => Left(failure),
      (data) => Right(UserModel.fromJson(data)),
    );
  }
}
