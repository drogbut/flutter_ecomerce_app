import 'package:equatable/equatable.dart';

import '../../../authentication/data/models/user/user.dart';

class UserState extends Equatable {
  final bool isProfileLoaded;
  final UserModel userModel;
  final bool hidePassword;
  final String? errorMessage;

  const UserState({
    this.isProfileLoaded = false,
    required this.userModel,
    this.hidePassword = true,
    this.errorMessage,
  });

  UserState copyWith({
    bool? isProfileLoaded,
    UserModel? userModel,
    bool? hidePassword,
    String? errorMessage,
  }) {
    return UserState(
      isProfileLoaded: isProfileLoaded ?? this.isProfileLoaded,
      userModel: userModel ?? this.userModel,
      hidePassword: hidePassword ?? this.hidePassword,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [isProfileLoaded, userModel, hidePassword, errorMessage];
}

