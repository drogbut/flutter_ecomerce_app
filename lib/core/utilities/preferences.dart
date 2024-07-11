import 'package:shared_preferences/shared_preferences.dart';

class UtilityPreferences {
  late SharedPreferences _sharedPreferences;

  String getString(String key) => _sharedPreferences.getString(key) ?? '';
}
