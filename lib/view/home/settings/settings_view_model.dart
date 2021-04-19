import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:smg_depo/view/home/settings/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SettingsViewModel extends State<SettingsPage> {
  final formKey = GlobalKey<FormState>();
  final cikisDepoKoduController = TextEditingController();
  final subeKoduController = TextEditingController();

  setInit() async {
    final prefs = await SharedPreferences.getInstance();
    String cikisDepoKodu = prefs.getString("cikisDepoKodu");
    String subeKodu = prefs.getString("subeKodu");

    cikisDepoKoduController.text = cikisDepoKodu == null ? "0" : cikisDepoKodu;
    subeKoduController.text = subeKodu == null ? "0" : subeKodu;
  }

  ayarlariKaydet(context) async {
    if (!formKey.currentState.validate()) {
      debugPrint("Hata");
    } else {

      final prefs = await SharedPreferences.getInstance();

      prefs.setString("cikisDepoKodu", cikisDepoKoduController.text);
      prefs.setString("subeKodu", subeKoduController.text);

      AwesomeDialog(
          context: context,
          headerAnimationLoop: false,
          dialogType: DialogType.SUCCES,
          title: "Başarılı!",
          desc: "Ayarlar başarıyla kayıt edilmiştir.",
          btnOkOnPress: () {

          },
          btnOkIcon: Icons.check_circle)
        ..show();
    }
  }
}
