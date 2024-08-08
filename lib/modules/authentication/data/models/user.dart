import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserModel extends UserEntity with _$UserModel {
  const factory UserModel({
    required String? userId,
    required String? firstName,
    required String? lastName,
    required String? email,
    required String? image,
    required int? gender,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

