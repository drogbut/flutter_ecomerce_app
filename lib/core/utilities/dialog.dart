import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../core/_constants.dart';
import '../core/_extensions.dart';
import '../ui/gesture_detector_user_activity.dart';

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
              SizedBox(
                child: FaIcon(
                  FontAwesomeIcons.lightCircleInfo,
                  color: TwConstants().colorInfo,
                ),
              ).withPadding(10.rightPadding),
              Text(
                title ?? context.translate.information.alternative(),
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
                  buttonTitle ?? context.translate.okay.alternative(),
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
              SizedBox(
                child: FaIcon(
                  FontAwesomeIcons.lightTriangleExclamation,
                  color: TwConstants().colorWarning,
                ),
              ).withPadding(10.rightPadding),
              Text(
                title ?? context.translate.warning.alternative(),
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
                  buttonTitle ?? context.translate.okay.alternative(),
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
              SizedBox(
                child: FaIcon(
                  FontAwesomeIcons.lightCircleExclamation,
                  size: 30,
                  color: TwConstants().colorAlarm,
                ),
              ).withPadding(10.rightPadding),
              Text(
                title ?? context.translate.error.alternative(),
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
                  buttonTitle ?? context.translate.okay.alternative(),
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
              SizedBox(
                child: FaIcon(
                  FontAwesomeIcons.lightQuestion,
                  color: TwConstants().colorInfo,
                ),
              ).withPadding(10.rightPadding),
              Text(
                title ?? context.translate.question.alternative(),
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
                secondButtonTitle ?? context.translate.no.alternative(),
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
                  firstButtonTitle ?? context.translate.yes.alternative(),
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
