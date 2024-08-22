import 'package:get_it/get_it.dart';

import 'modules/authentication/data/repository_impl/auth.dart';
import 'modules/authentication/data/sources/auth_firebase_service.dart';
import 'modules/authentication/domain/repository/auth.dart';
import 'modules/authentication/domain/use_cases/get_ages.dart';
import 'modules/authentication/domain/use_cases/get_user.dart';
import 'modules/authentication/domain/use_cases/is_login.dart';
import 'modules/authentication/domain/use_cases/reset_password.dart';
import 'modules/authentication/domain/use_cases/sign_in.dart';
import 'modules/authentication/domain/use_cases/signup.dart';
import 'modules/home_page/data/repositories_impl/category_impl.dart';
import 'modules/home_page/data/sources/category_firebase_services.dart';
import 'modules/home_page/domain/repositories/category.dart';
import 'modules/home_page/domain/use_cases/get_categories.dart';
import 'utilities/color.dart';
import 'utilities/connectivity.dart';
import 'utilities/device/device_info.dart';
import 'utilities/device/platform.dart';
import 'utilities/formatters/date_format.dart';
import 'utilities/local_storage/preferences.dart';
import 'utilities/navigation.dart';

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
  sl.registerSingleton<CategoryFirebaseService>(CategoryFirebaseServiceImpl());

  // Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<CategoriyRepository>(CategoryReposityImpl());

  // Use-cases
  // (1) Auth
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SignInUseCase>(SignInUseCase());
  sl.registerSingleton<GetAgesUseCase>(GetAgesUseCase());
  sl.registerSingleton<ResetPasswordUseCase>(ResetPasswordUseCase());
  sl.registerSingleton<IsLogInUseCase>(IsLogInUseCase());
  sl.registerSingleton<GetUserUseCase>(GetUserUseCase());

  // (2) categories
  sl.registerSingleton<GetCategoriesUseCase>(GetCategoriesUseCase());
}
