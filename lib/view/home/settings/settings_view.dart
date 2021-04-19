import 'package:flutter/material.dart';
import 'package:smg_depo/core/components/buttons/custom_raw_material_button.dart';
import 'package:smg_depo/core/components/text_input/form_text_input.dart';
import 'package:smg_depo/view/home/settings/settings_view_model.dart';

class SettingsView extends SettingsViewModel {
  @override
  void initState() {
    setInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Ayarlar")),
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              customFormTextInput(
                  controler: subeKoduController,
                  labelText: "Şube Kodu",
                  validateMessage: "Şube kodu boş olamaz!"),
              SizedBox(height: 10),
              customFormTextInput(
                  controler: cikisDepoKoduController,
                  labelText: "Çıkış Depo Kodu",
                  validateMessage:
                      "Çıkış depo kodu boş olamaz. Varsayılan 0 olmalıdır."),
              SizedBox(height: 50),
              CustomRawMaterialButton(
                  onPressed: () => ayarlariKaydet(context),
                  title: "Ayarları Kaydet")
            ]),
          ),
        ));
  }
}
