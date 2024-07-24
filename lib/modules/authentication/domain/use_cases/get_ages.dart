import 'package:dartz/dartz.dart';

import '../../../../core/use_cases/use_case.dart';
import '../../../../locator.dart';
import '../repository/auth.dart';

class GetAgesUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await sl<AuthRepository>().getAges();
  }
}
