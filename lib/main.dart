import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_folders_structure/core/utilities/preferences.dart';
import 'package:flutter_folders_structure/locator.dart';

import 'firebase_options.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await setupLocator();

  await sl.get<UtilityPreferences>().init();

  runApp(const MyApp());
}
