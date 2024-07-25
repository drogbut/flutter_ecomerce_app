import 'package:dartz/dartz.dart';

import '../../../../locator.dart';
import '../../domain/models/user_signup_request.dart';
import '../../domain/repository/auth.dart';
import '../sources/auth_firebase_service.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(UserSignUpRequest userRequest) async {
    return await sl<AuthFirebaseService>().signup(userRequest);
  }

  @override
  Future<Either> getAges() async {
    return await sl<AuthFirebaseService>().getAges();
  }
}
