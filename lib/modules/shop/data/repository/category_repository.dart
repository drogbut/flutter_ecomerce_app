import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../utilities/exceptions/firebase_auth_exceptions.dart';
import '../../../../utilities/exceptions/firebase_exceptions.dart';
import '../../../../utilities/exceptions/format_exceptions.dart';
import '../../../../utilities/exceptions/platform_exceptions.dart';
import '../models/category_model.dart';

class CategoryRepository extends GetxController {
  /// Singleton instance of CategoryRepository
  static CategoryRepository get instance => Get.find();

  /// FireStore instance
  final _db = FirebaseFirestore.instance;

  /// Method to fetch all categories from FireStore
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((doc) => CategoryModel.fromSnapshot(doc)).toList();
      return list;
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw ('Error fetching categories: $e');
    }
  }

  /// Method to fetch subcategories based on a parentId
  Future<List<CategoryModel>> getSubcategories(String parentId) async {
    try {
      final snapshot = await _db.collection('Categories').where('parentId', isEqualTo: parentId).get();
      final list = snapshot.docs.map((doc) => CategoryModel.fromSnapshot(doc)).toList();
      return list;
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw ('Error fetching sub-categories: $e');
    }
  }

  /// Method to upload a category to FireStore
  Future<void> uploadCategoryToFireStore(CategoryModel category) async {
    try {
      await _db.collection('Categories').add(category.toJson());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw ('Error uploading categories: $e');
    }
  }
}
