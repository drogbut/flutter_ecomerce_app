import 'package:flutter/material.dart';
import 'package:flutter_folders_structure/core/utilities/preferences.dart';
import 'package:flutter_folders_structure/locator.dart';

import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  await sl.get<UtilityPreferences>().init();

  runApp(const MyApp());
}
