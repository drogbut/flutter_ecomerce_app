import 'package:dartz/dartz.dart';

import '../entities/user_sign_in_request.dart';
import '../entities/user_signup_request.dart';

abstract class AuthRepository {
  Future<Either> signup(UserSignUpRequest userRequest);
  Future<Either> signIn(UserSignInRequest userRequest);
  Future<Either> resetPassword(String email);
  Future<Either> getAges();
  Future<Either> isLogin();
  Future<Either> getUser();
}
