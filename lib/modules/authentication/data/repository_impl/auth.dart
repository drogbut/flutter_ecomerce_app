import 'package:dartz/dartz.dart';

import '../../../../locator.dart';
import '../../domain/models/user_signup_request.dart';
import '../../domain/repository/auth.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(UserSignUpRequest userRequest) async {
    return await sl<AuthRepositoryImpl>().signup(userRequest);
  }
}
