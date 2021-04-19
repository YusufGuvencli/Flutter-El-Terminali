import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomRawMaterialButton extends StatelessWidget {
  CustomRawMaterialButton({@required this.onPressed, @required this.title, this.buttonColor, this.iconData});

  final GestureTapCallback onPressed;
  final IconData iconData;
  final String title;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: buttonColor == null ? Colors.blue : buttonColor,
      splashColor: Colors.greenAccent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 150,
            child: Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
          ),
        ],
      ),
      onPressed: onPressed,
      elevation: 6,
      shape: const StadiumBorder(),
    );
  }
}
