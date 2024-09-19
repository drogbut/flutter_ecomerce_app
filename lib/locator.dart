import 'package:get_it/get_it.dart';

import 'modules/shop/data/sources/category_firebase_services.dart';
import 'modules/shop/domain/use_cases/get_categories.dart';
import 'utilities/color/color.dart';
import 'utilities/device/connectivity.dart';
import 'utilities/device/device_info.dart';
import 'utilities/device/platform.dart';
import 'utilities/formatter/date_format.dart';
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
  sl.registerSingleton<CategoryFirebaseService>(CategoryFirebaseServiceImpl());

  // (2) categories
  sl.registerSingleton<GetCategoriesUseCase>(GetCategoriesUseCase());
}
