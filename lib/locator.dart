import 'package:flutter_folders_structure/core/utilities/preferences.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.I;

void setupLocator() {
  sl.registerLazySingleton(() => UtilityPreferences());
}
