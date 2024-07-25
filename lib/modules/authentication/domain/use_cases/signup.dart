import 'package:dartz/dartz.dart';

import '../../../../core/use_cases/use_case.dart';
import '../../../../locator.dart';
import '../models/user_signup_request.dart';
import '../repository/auth.dart';

class SignupUseCase implements UseCase<Either, UserSignUpRequest> {
  @override
  Future<Either> call({UserSignUpRequest? params}) async {
    return await sl<AuthRepository>().signup(params!);
  }
}
