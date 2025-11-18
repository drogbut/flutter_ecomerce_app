import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import '../../../../../utilities/exceptions/firebase_auth_exceptions.dart';
import '../../../../../utilities/exceptions/firebase_exceptions.dart';
import '../../../../../utilities/exceptions/format_exceptions.dart';
import '../../../../../utilities/exceptions/platform_exceptions.dart';
import '../models/category_model.dart';

class CategoryRepository {
  /// Variables
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Method to fetch all categories from Firestore
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
      throw 'Error fetching categories: $e';
    }
  }

  /// Method to fetch subcategories based on a parentId
  Future<List<CategoryModel>> getSubcategories(String parentId) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await _db.collection('categories').where('parentId', isEqualTo: parentId).get();
      return snapshot.docs.map((doc) => CategoryModel.fromSnapshot(doc)).toList();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Error fetching subcategories: $e';
    }
  }

  /// Method to upload a category to Firestore
  Future<void> uploadCategoryToFirestore(CategoryModel category) async {
    try {
      await _db.collection('categories').add(category.toJson());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Error uploading category: $e';
    }
  }
}
