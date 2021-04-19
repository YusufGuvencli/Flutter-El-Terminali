import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smg_depo/view/authenticate/login_screen/login_ui.dart';
import 'package:smg_depo/view/home/settings/settings_ui.dart';
import 'package:smg_depo/view/mal_kabul/mal_kabul_ui.dart';
import 'package:smg_depo/view/urun_toplama/sevk_detay/sevk_detay_ui.dart';
import 'package:smg_depo/view/urun_toplama/sevk_listesi/sevkiyat_ui.dart';

const String loginPage = '/';
const String MalKabul = '/MalKabul';
const String Sevkiyat ="/Sevkiyat";
const String Settings = "/Settings";
const String UrunToplamaDetay ="/UrunToplamaDetay";

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    debugPrint(settings.name);
    switch (settings.name) {
      case loginPage:
        return MaterialPageRoute(builder: (context) => LoginPage());
      case Settings :
        return MaterialPageRoute(builder: (context)=> SettingsPage());
      case MalKabul:
        return MaterialPageRoute(builder: (context) => MalKabulPage());
      case Sevkiyat:
        return MaterialPageRoute(builder: (context)=>SevkiyatPage());
        case UrunToplamaDetay:
        return MaterialPageRoute(builder: (context)=>SevkiyatDetayPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
              appBar: AppBar(),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset("assets/images/404.jpg"),
                  Text(
                      'Modülde bir problem var. Navigasyon sayfasında bulunamadı. '
                          'Veritabanındaki modül adını ve routes dosyasını  karşılaştırınız.',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w300))
                ],
              )),
        );
    }
  }
}
