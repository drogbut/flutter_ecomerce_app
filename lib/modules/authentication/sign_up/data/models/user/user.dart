import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../utilities/formatter/formatter.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String id,
    required String firstName,
    required String lastName,
    required String userName,
    required String email,
    required String phoneNumber,
    required String profilePicture,
  }) = _UserModel;

  /// Helper function to get the user full name
  String get fullName => '$firstName $lastName';

  /// Helper function to format the phone number
  String get formatPhone => TFormatter.formatPhoneNumber(phoneNumber);

  /// Static function to split the full name under first and last name
  static List<String> namePart(String fullName) => fullName.split(' ');

  /// Static function to create an empty user
  static UserModel empty() => const UserModel(
        id: '',
        firstName: '',
        lastName: '',
        userName: '',
        email: '',
        phoneNumber: '',
        profilePicture: '',
      );

  /// static function to generate username from the full name
  static String generateUserName(String fullName) {
    List<String> nameParts = fullName.split(' ');
    String firstName = nameParts[0].toLowerCase();
    String lastname = nameParts.length > 1 ? nameParts[1].toLowerCase() : ' ';

    String userWithPrefix = 'cwt_$firstName$lastname';

    return userWithPrefix;
  }

  factory UserModel.fromJson(Map<String, Object?> json) => _$UserModelFromJson(json);

  /// factory method to create a user model base on Firebase document snapshot.
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();

    if (data != null) {
      return UserModel(
        id: document.id,
        firstName: data['firstName'] ?? '',
        lastName: data['lastName'] ?? '',
        userName: data['userName'] ?? '',
        email: data['email'] ?? '',
        phoneNumber: data['phoneNumber'] ?? '',
        profilePicture: data['profilePicture'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }
}
