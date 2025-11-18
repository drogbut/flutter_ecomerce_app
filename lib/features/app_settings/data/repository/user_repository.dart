import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../utilities/exceptions/firebase_exceptions.dart';
import '../../../../utilities/exceptions/format_exceptions.dart';
import '../../../../utilities/exceptions/platform_exceptions.dart';
import '../../../authentication/data/models/user/user.dart';
import '../../../authentication/data/repository/auth_repository.dart';

class UserRepository {
  final FirebaseFirestore _db;
  final FirebaseStorage _storage;
  final AuthenticationRepository _authRepository;

  UserRepository({
    FirebaseFirestore? firestore,
    FirebaseStorage? storage,
    AuthenticationRepository? authRepository,
  })  : _db = firestore ?? FirebaseFirestore.instance,
        _storage = storage ?? FirebaseStorage.instance,
        _authRepository = authRepository ?? AuthenticationRepository();

  /// Save new user to Firestore
  Future<void> saveUserRecord({required UserModel user}) async {
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again: $e';
    }
  }

  /// Fetch user details by ID
  Future<UserModel?> fetchUserDetails({String? userId}) async {
    try {
      final uid = userId ?? _authRepository.authUser?.uid;
      if (uid == null) return null;

      final snapshot = await _db.collection('Users').doc(uid).get();
      if (!snapshot.exists) return null;

      return UserModel.fromSnapshot(snapshot);
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again: $e';
    }
  }

  /// Update entire user document
  Future<void> updateUserDetails({required UserModel updatedUser}) async {
    try {
      await _db.collection('Users').doc(updatedUser.id).update(updatedUser.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again: $e';
    }
  }

  /// Update a single field in the user's document
  Future<void> updateSingleField({required Map<String, dynamic> json, String? userId}) async {
    try {
      final uid = userId ?? _authRepository.authUser?.uid;
      if (uid == null) throw 'User not authenticated';

      await _db.collection('Users').doc(uid).update(json);
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again: $e';
    }
  }

  /// Delete user record
  Future<void> removeUserRecord({required String userId}) async {
    try {
      await _db.collection('Users').doc(userId).delete();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again: $e';
    }
  }

  /// Upload image to Firebase Storage
  Future<String> uploadImage({
    required String path,
    required XFile deviceSelectedImage,
  }) async {
    try {
      final ref = _storage.ref(path).child(deviceSelectedImage.name);
      await ref.putFile(File(deviceSelectedImage.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again: $e';
    }
  }
}
