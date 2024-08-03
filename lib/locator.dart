import 'package:flutter_folders_structure/modules/authentication/domain/use_cases/is_login.dart';
import 'package:flutter_folders_structure/modules/authentication/domain/use_cases/reset_password.dart';
import 'package:get_it/get_it.dart';

import 'core/utilities/color.dart';
import 'core/utilities/connectivity.dart';
import 'core/utilities/date_format.dart';
import 'core/utilities/device_info.dart';
import 'core/utilities/navigation.dart';
import 'core/utilities/platform.dart';
import 'core/utilities/preferences.dart';
import 'modules/authentication/data/repository_impl/auth.dart';
import 'modules/authentication/data/sources/auth_firebase_service.dart';
import 'modules/authentication/domain/repository/auth.dart';
import 'modules/authentication/domain/use_cases/get_ages.dart';
import 'modules/authentication/domain/use_cases/sign_in.dart';
import 'modules/authentication/domain/use_cases/signup.dart';

GetIt sl = GetIt.I;

Future<void> setupLocator() async {
  sl.registerLazySingleton(() => UtilityPreferences());
  sl.registerLazySingleton(() => UtilityColor());
  sl.registerLazySingleton(() => UtilityConnectivity());
  sl.registerLazySingleton(() => UtilityDateFormat());
  sl.registerLazySingleton(() => UtilityDeviceInfo());
  sl.registerLazySingleton(() => UtilityNavigation());
  sl.registerLazySingleton(() => UtilityPlatform());

  // Services
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  // Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  // Use-cases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SignInUseCase>(SignInUseCase());
  sl.registerSingleton<GetAgesUseCase>(GetAgesUseCase());
  sl.registerSingleton<ResetPasswordUseCase>(ResetPasswordUseCase());
  sl.registerSingleton<IsLogInUseCase>(IsLogInUseCase());
}
