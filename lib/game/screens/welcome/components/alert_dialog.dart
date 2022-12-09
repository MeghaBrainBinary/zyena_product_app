import 'package:flutter/material.dart';
import 'package:product_app/game/constants.dart';
import 'package:product_app/game/screens/settings/settings_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MyAlertDialog {
  static AlertStyle alertStyle = AlertStyle(
    backgroundColor: kActiveCardColor,
    titleStyle: const TextStyle(
      fontSize: 25.0,
      fontFamily: 'Paytone',
    ),
    buttonAreaPadding:
        const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
    alertPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  );

  static Future buildAlert(context) {
    return Alert(
      context: context,
      padding: const EdgeInsets.all(0.0),
      title: 'Settings',
      closeIcon: const Icon(Icons.close),
      style: alertStyle,
      content: SettingsScreen(),
      buttons: [
        DialogButton(
          child: const Text('Done'),
          onPressed: () => Navigator.pop(context),
          color: kBackgroundColor,
        ),
      ],
    ).show();
  }
}
