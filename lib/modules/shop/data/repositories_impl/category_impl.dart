import 'package:dartz/dartz.dart';

import '../../../../locator.dart';
import '../../domain/repositories/category.dart';
import '../sources/category_firebase_services.dart';

class CategoryReposityImpl extends CategoriyRepository {
  @override
  Future<Either> getCategories() async {
    return await sl<CategoryFirebaseService>().getCategories();
  }
}
