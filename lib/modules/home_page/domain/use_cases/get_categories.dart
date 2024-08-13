import 'package:dartz/dartz.dart';

import '../../../../core/use_cases/use_case.dart';
import '../../../../locator.dart';
import '../repositories/category.dart';

class GetCategoriesUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await sl<CategoriyRepository>().getCategories();
  }
}
