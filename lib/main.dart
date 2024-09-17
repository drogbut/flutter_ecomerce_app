import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app.dart';
import 'firebase_options.dart';
import 'locator.dart';
import 'modules/authentication/models/repository/authentication.dart';
import 'utilities/local_storage/preferences.dart';

Future<void> main() async {
  /// Add widget binding
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// Init local storage
  await GetStorage.init();

  /// Init payment method

  /// Await Native splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// Initialize firebase
  /// Init authentication
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  await setupLocator();

  await sl.get<UtilityPreferences>().init();

  runApp(const App());
}
