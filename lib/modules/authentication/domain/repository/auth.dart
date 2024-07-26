import 'package:dartz/dartz.dart';

import '../models/user_sign_in_request.dart';
import '../models/user_signup_request.dart';

abstract class AuthRepository {
  Future<Either> signup(UserSignUpRequest userRequest);
  Future<Either> signIn(UserSignInRequest userRequest);
  Future<Either> getAges();
}
