import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../utilities/formatter/formatter.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._(); // Constructor privé requis par Freezed

  const factory UserModel({
    required String id,
    required String firstName,
    required String lastName,
    required String userName,
    required String email,
    required String password,
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
      id: '', firstName: '', lastName: '', userName: '', email: '', password: '', phoneNumber: '', profilePicture: '');

  factory UserModel.fromJson(Map<String, Object?> json) => _$UserModelFromJson(json);
}
