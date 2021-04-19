import 'package:flutter/material.dart';

// {@required this.onPressed, @required this.title, this.buttonColor, this.iconData}
// String labelText, String validateMessage, TextEditingController controler, IconData iconData,
customFormTextInput({@required TextEditingController controler,String validateMessage,String labelText,IconData iconData,bool obscureText=false}) {
  return TextFormField(
    controller: controler,
    obscureText: obscureText,
    decoration: InputDecoration(
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.red)),
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey)),
        labelText: labelText,
        prefixIcon: Icon(iconData == null ? Icons.short_text_outlined : iconData, size: 17)),
    validator: (value) {
      if (value.isEmpty) {
        return validateMessage;
      }
      return null;
    },
  );
}
