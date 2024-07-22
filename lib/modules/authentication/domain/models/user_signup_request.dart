class UserSignUpRequest {
  final String? firstName;
  final String? lastName;
  final String email;
  final String password;
  final int? gender;
  final String? age;

  UserSignUpRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    this.gender,
    this.age,
  });
}
