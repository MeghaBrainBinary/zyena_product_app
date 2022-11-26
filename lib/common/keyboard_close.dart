import 'package:flutter/material.dart';

closeKeybord({required BuildContext context}) {
  FocusScopeNode currentFocus = FocusScope.of(context);

  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
}
