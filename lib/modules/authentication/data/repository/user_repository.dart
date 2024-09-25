import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../utilities/exceptions/firebase_exceptions.dart';
import '../../../../utilities/exceptions/format_exceptions.dart';
import '../../../../utilities/exceptions/platform_exceptions.dart';
import '../../models/user/user.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  /// variables
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save succes user data to firestore
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
      throw 'Something went Wrong. Please try again';
    }
  }
}
