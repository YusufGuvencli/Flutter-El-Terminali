import 'package:flutter/material.dart';

// {@required this.onPressed, @required this.title, this.buttonColor, this.iconData}
// String labelText, String validateMessage, TextEditingController controler, IconData iconData,
customMainCardContainer({@required String imagePath, @required String title,@required String navigatorName,@required BuildContext context }) {
  return             Card(
    elevation: 7,
    child: InkWell(
      onTap: ()=>{Navigator.pushNamed(context, "/$navigatorName")},
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              imagePath,
              height: 100,
              width: 100,
            ),
            Text(
              title,
              textScaleFactor: 1.4,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),
            )
          ],
        ),
      ),
    ),
  );
}
