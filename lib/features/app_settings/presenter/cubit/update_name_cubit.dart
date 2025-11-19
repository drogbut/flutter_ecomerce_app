import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utilities/helpers/network_manager.dart';
import '../../data/repository/user_repository.dart';
import 'update_name_state.dart';

class UpdateNameCubit extends Cubit<UpdateNameState> {
  final UserRepository _userRepository;
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final GlobalKey<FormState> updateNameFormKey = GlobalKey<FormState>();

  UpdateNameCubit(this._userRepository) : super(const UpdateNameState());

  /// Fetch user data record
  Future<void> initializeNames() async {
    // firstName.text = userModelValue.firstName;
    // lastName.text = userModelValue.firstName;
  }

  /// update the user name
  Future<void> updateUserName() async {
    try {
      emit(state.copyWith(isLoading: true));

      /// Check internet connectivity
      final isConnected = await NetworkManager.isConnected();
      if (!isConnected) {
        emit(state.copyWith(isLoading: false));
        return;
      }

      /// Form validation
      if (!updateNameFormKey.currentState!.validate()) {
        emit(state.copyWith(isLoading: false));
        return;
      }

      /// Update first & last name in the Firebase
      final name = {
        'firstName': firstName.text.trim(),
        'lastName': lastName.text.trim()
      };
      await _userRepository.updateSingleField(json: name);

      emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
      ));

      // Success will be handled by BlocConsumer listener in the widget
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  @override
  Future<void> close() {
    firstName.dispose();
    lastName.dispose();
    return super.close();
  }
}

