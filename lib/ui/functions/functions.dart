import 'dart:async';

import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_folders_structure/core/extensions/context.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import '../../core/utilities/color.dart';
import '../../core/utilities/platform.dart';
import '../../locator.dart';
import '../../theme/theme_provider.dart';

UtilityPlatform platformUtil = sl.get<UtilityPlatform>();

/*DecorationImage getBackgroundImage(ThemeProvider themeProvider) {
  if (!themeProvider.isDarkMode) {
    return DecorationImage(
      image: const AssetImage(tisowareDarkModeImageBackground),
      colorFilter:
          ColorFilter.mode(Colors.white.withOpacity(0.7), BlendMode.srcOver),
      fit: BoxFit.cover,
    );
  }

  return DecorationImage(
    image: const AssetImage(tisowareLightModeImageBackground),
    colorFilter:
        ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.srcOver),
    fit: BoxFit.cover,
  );
}*/

KeyboardActionsConfig buildKeyboardActionsConfigDoneButtonIOS(
    List<FocusNode> focusNodes) {
  return KeyboardActionsConfig(
    keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
    nextFocus: false,
    keyboardBarColor:
        _currentCtx.theme.scaffoldBackgroundColor.withOpacity(0.7),
    actions: List.generate(focusNodes.length, (index) {
      return KeyboardActionsItem(
        focusNode: focusNodes[index],
        toolbarButtons: [
          (node) {
            return Padding(
              padding: const EdgeInsets.only(
                right: 10,
              ),
              child: ElevatedButton(
                child: Text(_currentCtx.translate.done),
                onPressed: () {
                  node.unfocus();
                },
              ),
            );
          },
        ],
      );
    }),
  );
}

/*Future<bool?> showCheckSecureModeDialog() async {
  Timer? timer;

  TextEditingController secureModePinController = TextEditingController();

  final globalTextWidgetSecureModeKey = GlobalKey();
  final globalControllWidgetSecureModeKey = GlobalKey();

  bool? value = await showDialog(
    context: _currentCtx,
    builder: (context) {
      timer = Timer(
          Duration(
              seconds: sl
                  .get<UtilityConfigBuildingBlock>()
                  .getSecureModePinInputTimeout()), () {
        Navigator.of(context).pop();
      });

      return GestureDetectorUserActivityDetected(
        child: AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
          ),
          contentPadding: const EdgeInsets.only(
            left: 24.0,
            top: 20.0,
            right: 24.0,
          ),
          title: Row(
            children: [
              SizedBox(
                child: FaIcon(
                  FontAwesomeIcons.lightTriangleExclamation,
                  color: TwConstants().colorWarning,
                ),
              ).withPadding(10.rightPadding),
              Text(
                context.translate.warning.alternative(),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 15,
                  ),
                  child: Text(
                    context.translate.enterSecureCodeToContinue.alternative(),
                  ),
                ),
                CustomTextField(
                  textWidget: Container(
                    key: globalTextWidgetSecureModeKey,
                    padding: const EdgeInsets.only(
                      bottom: 10,
                    ),
                    child: Text(
                      context.translate.secureCode.alternative(),
                      style: getCustomTextWidgetStyle(),
                    ),
                  ),
                  controlWidget: TextField(
                    key: globalControllWidgetSecureModeKey,
                    controller: secureModePinController,
                    maxLength: 30,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    style: getCustomControlWidgetStyle(),
                    decoration: getCustomControlWidgetDecoration(),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: context.theme.scaffoldBackgroundColor,
                foregroundColor: context.colorScheme.primary,
                side: BorderSide(
                  color: context.colorScheme.primary,
                ),
              ),
              child: Text(
                context.translate.back.alternative(),
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 15,
              ),
              child: ElevatedButton(
                child: Text(
                  context.translate.okay.alternative(),
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
                onPressed: () {
                  if (secureModePinController.text ==
                      sl.get<UtilityConfigBuildingBlock>().getSecureModePin()) {
                    Navigator.of(context).pop(true);
                  } else {
                    Navigator.of(context).pop(false);
                  }
                },
              ),
            ),
          ],
        ),
      );
    },
  ).then((value) {
    if (timer != null && timer!.isActive) {
      timer!.cancel();
    }

    return value;
  });

  return value;
}*/

/*Future<bool> checkSecureModeAuthenticated() async {
  bool? authenticated = await showCheckSecureModeDialog();

  return authenticated != null && authenticated;
}*/

Future<String> getUniqueId(DeviceInfoPlugin deviceInfoPlugin,
    {AndroidId? androidIdPluginMock}) async {
  if (platformUtil.isNotWebAndIsAndroid) {
    AndroidId androidIdPlugin;
    if (androidIdPluginMock == null) {
      androidIdPlugin = const AndroidId();
    } else {
      androidIdPlugin = androidIdPluginMock;
    }

    final String? androidId = await androidIdPlugin.getId();
    if (androidId != null) {
      return androidId;
    }
  } else if (platformUtil.isNotWebAndIsIOS) {
    IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;

    if (iosInfo.identifierForVendor != null) {
      return iosInfo.identifierForVendor!;
    }
  } else if (platformUtil.isNotWebAndIsWindows) {
    WindowsDeviceInfo windowsInfo = await deviceInfoPlugin.windowsInfo;

    return windowsInfo.deviceId;
  }

  return '';
}

Future<Position?> determineGeoPosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  try {
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return null;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return null;
    }

    return await Geolocator.getCurrentPosition(
        timeLimit: const Duration(seconds: 1, microseconds: 500));
  } catch (error) {
    return null;
  }
}

TextStyle getCustomTextStyleMuted({FontWeight? fontWeight, double? fontSize}) {
  return TextStyle(
    fontWeight: fontWeight,
    fontSize: fontSize,
    color: Colors.blue,
  );
}

MaterialStateProperty<Color?>? dataRowMaterialStatePropertyFirst(
    [double amount = .05]) {
  Color? color = _currentCtx.theme.cardColor;

  return MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.focused)) {
      return _currentCtx.theme.focusColor;
    }
    if (states.contains(MaterialState.pressed)) {
      return _currentCtx.theme.highlightColor;
    }
    if (states.contains(MaterialState.selected)) {
      //return sl.get<UtilityColor>().getUntouchableOrMuted(_currentCtx);
    }

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor().withOpacity(0.5);
  });
}

MaterialStateProperty<Color?>? dataRowMaterialStatePropertySecond(
    [double amount = .1]) {
  Color? color = _currentCtx.theme.cardColor;

  return MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.focused)) {
      return _currentCtx.theme.focusColor;
    }
    if (states.contains(MaterialState.pressed)) {
      return _currentCtx.theme.highlightColor;
    }
    if (states.contains(MaterialState.selected)) {
      //return sl.get<UtilityColor>().getUntouchableOrMuted(_currentCtx);
    }

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor().withOpacity(0.5);
  });
}

String getAdditionalAssetPath() => '';

//int getProgramId() => kIsWeb ? programIdWebApp : programIdApp;

/*
bool checkIfWebNotAppMinVersion() {
  if (kIsWeb &&
      UtilityConfig().functionVersion != 0 &&
      UtilityConfig().functionVersion < TwConstants().functionVersion1003) {
    showMaterialErrorDialog(
      _currentCtx,
      _currentCtx.translate.webAppMinimumFunctionVersion,
    );

    return true;
  }

  return false;
}
*/

Color? dataRowTextColor({bool selected = false}) {
  if (selected) {
    return Colors.white;
  }

  return null;
}

String checkDoubleNo(
    String value, int digitBeforeDot, String dot, int digitAfterdot) {
  if (!value.contains(dot) && value.contains(',')) {
    value = value.replaceAll(RegExp(','), dot);
  }

  value =
      value.replaceAll(RegExp('[^0-9.]'), '').replaceAll(RegExp('\\.+'), '.');

  if (value.length == (digitBeforeDot + digitAfterdot) &&
      !value.contains(dot)) {
    String val1 = value.substring(0, digitBeforeDot);
    String val2 = value.substring(digitBeforeDot);

    value = val1 + dot + val2;
  }

  return value;
}

String checkDoubleNoOnBlur(
  String value,
  int digitBeforeDot,
  String dot,
  int digitAfterDot,
  double maxNr,
  String inpNrGrMaxNr,
) {
  var val1 = '';
  var val2 = '';
  List<String> signs;

  if (value.isNotEmpty) {
    if (!value.contains(dot) && value.contains(',')) {
      value = value.replaceAll(',', dot);
    }

    String vDot = dot == '.' ? '\\.' : dot;
    String regExpStr =
        '^(([0-9]{1,${digitBeforeDot.toString()}})(($vDot)?([0-9]{0,${digitAfterDot.toString()}}))?)\$';
    RegExp varExpr = RegExp(regExpStr);

    String tempValue = value;
    while (!varExpr.hasMatch(tempValue)) {
      tempValue = tempValue.substring(0, tempValue.length - 1);
    }
    value = tempValue;

    var valLen = value.length;
    if (value.contains(dot)) {
      signs = value.split(dot);

      for (int k = signs[1].length; k < digitAfterDot; k++) {
        signs[1] = '${signs[1]}0';
      }

      value = signs[0] + dot + signs[1];
    } else {
      val1 = value.substring(
          0, value.length <= digitBeforeDot ? value.length : digitBeforeDot);

      if (valLen > digitBeforeDot) {
        val2 = value.substring(
          digitBeforeDot,
          valLen < (digitBeforeDot + digitAfterDot)
              ? valLen
              : (digitBeforeDot + digitAfterDot),
        );
      }

      for (int k = val2.length; k < digitAfterDot; k++) {
        val2 += '0';
      }

      value = val1 + dot + val2;
    }

    if (value.indexOf(dot) > 0) {
      signs = value.split(dot);
      if (signs[0].length > digitBeforeDot ||
          signs[1].length > digitAfterDot ||
          int.parse((signs[0])).isNaN ||
          int.parse((signs[1])).isNaN) {
        showMaterialErrorDialog(
          _currentCtx,
          _currentCtx.translate.percentFormatOrContentWrong
              .alternative(module: Module.workflow),
        );
      } else if (signs[1] != '' &&
          signs[1].length < digitAfterDot &&
          int.parse((signs[1])).isNaN) {
        showMaterialErrorDialog(
          _currentCtx,
          _currentCtx.translate.percentFormatOrContentWrong
              .alternative(module: Module.workflow),
        );
      }
    }

    if (maxNr > 0 && double.parse(value) > maxNr) {
      showMaterialErrorDialog(_currentCtx,
          inpNrGrMaxNr.replaceAll('-nr-', maxNr.toStringAsFixed(2)));
    }
  }

  return value;
}

TextStyle getCustomLabelWidgetStyle() {
  return _currentCtx.textTheme.labelLarge!;
}

TextStyle getCustomTextWidgetStyleMuted() {
  return _currentCtx.textTheme.labelSmall!.copyWith(
    color: Colors.red,
  );
}

TextStyle getCustomTextWidgetStyle() {
  return _currentCtx.textTheme.labelSmall!;
}

InputDecoration getCustomControlWidgetDecoration() {
  return const InputDecoration(
    filled: false,
    counter: Offstage(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    ),
  );
}

InputDecoration getCustomControlFormWidgetDecoration() {
  return const InputDecoration(
    filled: false,
    counter: Offstage(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    ),
    errorStyle: TextStyle(
      height: 0.001,
    ),
  );
}

InputDecoration getCustomControlDropdownWidgetDecoration() {
  return const InputDecoration(
    filled: false,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    ),
  );
}

ThemeData getCustomControlDropdownFormWidgetTheme() {
  return _currentCtx.theme.copyWith(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    focusColor: Colors.transparent,
  );
}

InputDecoration getCustomControlDropdownFormWidgetDecoration() {
  return const InputDecoration(
    filled: false,
    counter: Offstage(),
    focusColor: Colors.transparent,
    hoverColor: Colors.transparent,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    ),
    errorStyle: TextStyle(
      height: 0.05,
    ),
  );
}

BoxShadow getFlashBoxShadow() {
  return _currentCtx.theme.brightness == Brightness.dark
      ? const BoxShadow(
          color: Colors.black,
          blurRadius: 15,
        )
      : const BoxShadow(
          color: Color.fromRGBO(36, 36, 36, 0.15),
          blurRadius: 12,
        );
}

Color getFlashShadowColor() {
  return _currentCtx.theme.brightness == Brightness.dark
      ? Colors.black
      : const Color.fromRGBO(36, 36, 36, 0.15);
}

FaIcon getCustomControlWidgetDropdownIcon() {
  return const FaIcon(
    FontAwesomeIcons.lightChevronDown,
  );
}

Color getCustomControlWidgetDropdownIconEnabledColor() {
  return _currentCtx.colorScheme.primary;
}

Color getCustomControlWidgetDropdownIconDisabledColor() {
  return _currentCtx.theme.disabledColor;
}

TextStyle getCustomControlWidgetStyle() {
  return TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: _currentCtx.colorScheme.primary,
  );
}

BuildContext get _currentCtx =>
    sl.get<UtilityNavigation>().navigatorKey.currentContext!;
