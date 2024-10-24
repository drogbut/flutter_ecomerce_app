import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app.dart';
import 'firebase_options.dart';
import 'modules/authentication/sign_up/data/repository/auth_repository.dart';

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

  runApp(const App());
}
