import 'package:dartz/dartz.dart';

import '../../../../core/use_cases/use_case.dart';
import '../../../../locator.dart';
import '../repository/auth.dart';

class IsLogInUseCase implements UseCase<Either, bool> {
  @override
  Future<Either> call({bool? params}) async {
    return await sl<AuthRepository>().isLogin();
  }
}
