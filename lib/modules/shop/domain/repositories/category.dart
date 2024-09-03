import 'package:dartz/dartz.dart';

abstract class CategoriyRepository {
  Future<Either> getCategories();
}
