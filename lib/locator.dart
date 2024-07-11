import 'package:get_it/get_it.dart';

import 'core/utilities/color.dart';
import 'core/utilities/connectivity.dart';
import 'core/utilities/date_format.dart';
import 'core/utilities/device_info.dart';
import 'core/utilities/navigation.dart';
import 'core/utilities/platform.dart';
import 'core/utilities/preferences.dart';

GetIt sl = GetIt.I;

void setupLocator() {
  sl.registerLazySingleton(() => UtilityPreferences());
  sl.registerLazySingleton(() => UtilityColor());
  sl.registerLazySingleton(() => UtilityConnectivity());
  sl.registerLazySingleton(() => UtilityDateFormat());
  sl.registerLazySingleton(() => UtilityDeviceInfo());
  sl.registerLazySingleton(() => UtilityNavigation());
  sl.registerLazySingleton(() => UtilityPlatform());
}
