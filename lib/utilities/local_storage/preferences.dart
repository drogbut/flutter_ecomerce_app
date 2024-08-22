import 'package:shared_preferences/shared_preferences.dart';

class UtilityPreferences {
  late SharedPreferences _sharedPreferences;

  static final UtilityPreferences _instance = UtilityPreferences._internal();
  factory UtilityPreferences() => _instance;

  UtilityPreferences._internal();

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  // Setter
  Future<bool> setBool(String key, bool value) async =>
      await _sharedPreferences.setBool(key, value);

  Future<bool> setDouble(String key, double value) async =>
      await _sharedPreferences.setDouble(key, value);

  Future<bool> setInt(String key, int value) async =>
      await _sharedPreferences.setInt(key, value);

  Future<bool> setString(String key, String value) async =>
      await _sharedPreferences.setString(key, value);

  Future<bool> setStringList(String key, List<String> value) async =>
      await _sharedPreferences.setStringList(key, value);

  // Getter
  bool getBool(String key) => _sharedPreferences.getBool(key) ?? false;
  bool? getBoolWithNull(String key) => _sharedPreferences.getBool(key);

  double getDouble(String key) => _sharedPreferences.getDouble(key) ?? 0.00;

  int getInt(String key) => _sharedPreferences.getInt(key) ?? -1;

  String getString(String key) => _sharedPreferences.getString(key) ?? '';

  List<String> getStringList(String key) =>
      _sharedPreferences.getStringList(key) ?? List.empty();

  // Deletes
  Future<bool> remove(String key) async => await _sharedPreferences.remove(key);

  Future<bool> clear() async => await _sharedPreferences.clear();
}
