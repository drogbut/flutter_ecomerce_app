import 'package:dartz/dartz.dart';

import '../../../../core/use_cases/use_case.dart';
import '../../../../locator.dart';
import '../entities/user_sign_in_request.dart';
import '../repository/auth.dart';

class SignInUseCase implements UseCase<Either, UserSignInRequest> {
  @override
  Future<Either> call({UserSignInRequest? params}) async {
    return await sl<AuthRepository>().signIn(params!);
  }
}
