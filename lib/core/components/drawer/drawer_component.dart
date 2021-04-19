import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerComponent extends StatelessWidget {
  String _userName;
  DrawerComponent(this._userName);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 100,
                      child: Image.asset('assets/images/user_icon.png'),
                    ),
                    Text(
                      _userName,
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ]),
            ),
            decoration: BoxDecoration(
              color: Colors.red.shade300,
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text('Profil',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(FontAwesomeIcons.lock),
            title: Text('Kullanıcı Yetkilendirme',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Ayarlar',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.pushNamed(context, "/Settings");
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Çıkış',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
            onTap: () {
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            },
          ),
        ],
      ),
    );
  }
}
