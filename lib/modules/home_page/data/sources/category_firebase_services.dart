import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../models/category_item.dart';
import '../models/category_model.dart';

abstract class CategoryFirebaseService {
  Future<Either> getCategories();
}

class CategoryFirebaseServiceImpl extends CategoryFirebaseService {
  @override
  Future<Either> getCategories() async {
    try {
      final categoriesResponse = await FirebaseFirestore.instance.collection('categories').get();

      final categories = categoriesResponse.docs.map((e) => CategoryItem.fromJson(e.data())).toList();

      final category = CategoryModel(categories: categories);

      return Right(category);
    } on FirebaseException catch (e) {
      return Left('FirebaseException: ${e.message}');
    } catch (e) {
      return Left(e.toString());
    }
  }
}
