import 'package:dartz/dartz.dart';
import 'package:flutter_folders_structure/modules/authentication/domain/models/user_signup_request.dart';

abstract class AuthRepository {
  Future<Either> signup(UserSignUpRequest userRequest);
}
