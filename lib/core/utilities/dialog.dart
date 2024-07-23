import 'package:flutter/material.dart';
import 'package:flutter_folders_structure/core/extensions/context.dart';
import 'package:flutter_folders_structure/core/extensions/widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../ui/gesture_detector/gesture_detector_user_activity.dart';

Future showMaterialInformationDialog(
  BuildContext context,
  String description, {
  String? title,
  String? buttonTitle,
}) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
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
              const SizedBox(
                child: FaIcon(
                  FontAwesomeIcons.info,
                  color: Colors.red,
                ),
              ).withPadding(10.rightPadding),
              Text(
                title ?? context.translate.sample,
                style: TextStyle(
                  color: context.colorScheme.primary,
                ),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  description,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                right: 15,
              ),
              child: ElevatedButton(
                child: Text(
                  buttonTitle ?? context.translate.okay,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
                onPressed: () {
                  context.navigator.pop();
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}

Future showMaterialWarningDialog(BuildContext context, String description, {String? title, String? buttonTitle}) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
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
              const SizedBox(
                child: FaIcon(
                  FontAwesomeIcons.triangleExclamation,
                  color: Colors.orange,
                ),
              ).withPadding(10.rightPadding),
              Text(
                title ?? context.translate.sample,
                style: TextStyle(
                  color: context.colorScheme.primary,
                ),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  description,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                right: 15,
              ),
              child: ElevatedButton(
                child: Text(
                  buttonTitle ?? context.translate.okay,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
                onPressed: () {
                  context.navigator.pop();
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}

Future showMaterialErrorDialog(BuildContext context, String description, {String? title, String? buttonTitle}) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
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
              const SizedBox(
                child: FaIcon(
                  FontAwesomeIcons.circle,
                  size: 30,
                  color: Colors.red,
                ),
              ).withPadding(10.rightPadding),
              Text(
                title ?? context.translate.sample,
                style: TextStyle(
                  color: context.colorScheme.primary,
                ),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  description,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                right: 15,
              ),
              child: ElevatedButton(
                child: Text(
                  buttonTitle ?? context.translate.okay,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
                onPressed: () {
                  context.navigator.pop();
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}

Future showMaterialQuestionDialog(
  BuildContext context,
  String description, {
  String? title,
  String? firstButtonTitle,
  String? secondButtonTitle,
  String? thirdButtonTitle,
}) async {
  int pressedAnswer = -1;

  return await showDialog(
    context: context,
    builder: (BuildContext context) {
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
              const SizedBox(
                child: FaIcon(
                  FontAwesomeIcons.question,
                  color: Colors.blue,
                ),
              ).withPadding(10.rightPadding),
              Text(
                title ?? context.translate.sample,
                style: TextStyle(
                  color: context.colorScheme.primary,
                ),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  description,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            if (thirdButtonTitle != null) ...[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.theme.scaffoldBackgroundColor,
                  foregroundColor: context.colorScheme.primary,
                  side: BorderSide(
                    color: context.colorScheme.primary,
                  ),
                ),
                child: Text(
                  thirdButtonTitle,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
                onPressed: () {
                  pressedAnswer = 3;
                  context.navigator.pop(pressedAnswer);
                },
              ),
            ],
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: context.theme.scaffoldBackgroundColor,
                foregroundColor: context.colorScheme.primary,
                side: BorderSide(
                  color: context.colorScheme.primary,
                ),
              ),
              child: Text(
                secondButtonTitle ?? context.translate.sample,
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                ),
              ),
              onPressed: () {
                pressedAnswer = 2;
                context.navigator.pop(pressedAnswer);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 15,
              ),
              child: ElevatedButton(
                child: Text(
                  firstButtonTitle ?? context.translate.sample,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
                onPressed: () {
                  pressedAnswer = 1;
                  context.navigator.pop(pressedAnswer);
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}

Future<void> myBottomSheet(
  BuildContext context,
  Widget widget,
) {
  return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
        ),
      ),
      builder: (_) {
        return widget;
      });
}
