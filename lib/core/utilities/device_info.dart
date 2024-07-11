import 'package:device_info_plus/device_info_plus.dart';

class UtilityDeviceInfo {
  late String _model;

  static final UtilityDeviceInfo _instance = UtilityDeviceInfo._internal();
  factory UtilityDeviceInfo() => _instance;

  UtilityDeviceInfo._internal() {
    _model = '';
  }

  String get model => _model;

  void setModel(String value) => _model = value;

  Future<String> setAndGetModelFromDeviceInfo({DeviceInfoPlugin? deviceInfoPluginMock}) async {
    DeviceInfoPlugin deviceInfoPlugin;
    if (deviceInfoPluginMock == null) {
      deviceInfoPlugin = DeviceInfoPlugin(); // coverage:ignore-line
    } else {
      deviceInfoPlugin = deviceInfoPluginMock;
    }
    AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
    _model = androidDeviceInfo.model;

    return _model;
  }
}
