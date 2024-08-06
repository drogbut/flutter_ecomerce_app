import '../../domain/entities/user.dart';

class UserModel {
  final String uid;
  final String? firstName;
  final String? lastName;
  final String email;
  int? gender;
  String? age;


  UserModel({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.age,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json["uid"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      email: json["email"],
      gender: int.parse(json["gender"]),
      age: json["age"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "uid":uid,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "gender": gender,
      "age": age,
    };
  }


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModel &&
          runtimeType == other.runtimeType &&
          uid == other.uid &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          email == other.email  &&
          gender == other.gender &&
          age == other.age;

  @override
  int get hashCode =>
      firstName.hashCode ^ lastName.hashCode ^ email.hashCode ^ uid.hashCode ^ gender.hashCode ^ age.hashCode;
}

extension UserXModel on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      userId: uid,
      firstName: firstName,
      lastName: lastName,
      email: email,
      gender: gender,
      age: age,
    );
  }
}
