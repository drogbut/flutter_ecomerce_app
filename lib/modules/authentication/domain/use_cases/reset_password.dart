import 'package:dartz/dartz.dart';

import '../../../../core/use_cases/use_case.dart';
import '../../../../locator.dart';
import '../repository/auth.dart';

class ResetPasswordUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<AuthRepository>().resetPassword(params!);
  }
}
