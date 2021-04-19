import 'package:flutter/material.dart';
import 'package:smg_depo/view/urun_toplama/sevk_detay/sevk_detay_ui.dart';

customSevkiyatListTileItem(
    {@required String sevkNo,
    @required String cariAdi,
    @required String tarih,
    @required BuildContext context}) {
  return Column(
    children: [
      Container(
        child: ListTile(
          title: Text(sevkNo,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
          subtitle: Text(
            cariAdi,
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
          ),
          trailing: Text(tarih),
          leading: Icon(Icons.arrow_forward_ios_outlined),
          onTap: () => {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => SevkiyatDetayPage()))
          },
        ),
      ),
      Divider()
    ],
  );
}
