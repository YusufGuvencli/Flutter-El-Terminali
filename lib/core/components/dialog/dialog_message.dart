import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDialogBox {
  static errorDialog(BuildContext context, String title, String message,
      Function btnOkOnPress) {
    return AwesomeDialog(
        context: context,
        headerAnimationLoop: false,
        dialogType: DialogType.ERROR,
        title: title ?? "HATA",
        desc: message,
        btnOkOnPress: btnOkOnPress,
        btnOkIcon: Icons.check_circle)
      ..show();
  }

  static successDialog(BuildContext context, String message,
      {String title, Function btnOkOnPress}) {
    return AwesomeDialog(
        context: context,
        headerAnimationLoop: false,
        dialogType: DialogType.SUCCES,
        title: title ?? "HATA",
        desc: message,
        btnOkOnPress: btnOkOnPress ?? () => {},
        btnOkIcon: Icons.check_circle)
      ..show();
  }
}
