import 'package:connectivity_plus/connectivity_plus.dart';

class UtilityConnectivity {
  static late Connectivity _connectivity;

  static Connectivity init() {
    _connectivity = Connectivity();

    return _connectivity;
  }

  static Connectivity get connectivity => _connectivity;
}
