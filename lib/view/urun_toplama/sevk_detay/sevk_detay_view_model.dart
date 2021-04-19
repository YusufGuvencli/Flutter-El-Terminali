import 'dart:math';
import 'package:flutter/material.dart';
import 'package:smg_depo/core/base/base_service.dart';
import 'package:smg_depo/core/components/dialog/dialog_message.dart';
import 'package:smg_depo/core/model/concrete/api_model/result_model.dart';
import 'package:smg_depo/core/model/concrete/urun_toplama/urun_bilgi_model.dart';
import 'package:smg_depo/core/state/login_state/user_state.dart';
import 'package:smg_depo/core/state/urun_toplama/urun_toplama_state.dart';
import 'package:smg_depo/view/urun_toplama/sevk_detay/sevk_detay_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

abstract class SevkiyatDetayViewModel extends State<SevkiyatDetayPage> {
  final barcodeController = TextEditingController();
  FocusNode barcodeFocusNode = new FocusNode();

  getUrunBilgi(String barkod) async {
    final prefs = await SharedPreferences.getInstance();
    int subeKodu = int.parse(prefs.getString("subeKodu"));

    var userState = Provider.of<UserState>(context, listen: false);
    var sevkDetayState = Provider.of<UrunToplamaState>(context, listen: false);
    int cikisDepoKodu = sevkDetayState.cikisDepoKodu;
    print(cikisDepoKodu);
    Map data = {
      'serilibarkod': barkod,
      'cikisDepoKodu': cikisDepoKodu,
      'subeKodu': subeKodu
    };

    var body = json.encode(data);

    var service = BaseService();
    var result = await service.post<UrunBilgiModel>(
        "sevkiyat/urunbilgi", body, UrunBilgiModel());

    var success2 = result?.success;
    if (!success2) {
      CustomDialogBox.errorDialog(context, "HATA", result.message, () => {});
    }
    print(result.data);
    if (result.data != null) {
      var urun = result.data.first;
      int okutmadanKalan = urun.miktar;
      int ilkOkunanMiktar = urun.miktar;

      var seriNo = barcodeController.text.split("-");
      sevkDetayState.sevkDetayModel.data.forEach((item) {
        if (item.miktar > item.okutulmusMiktar) {
          if (item.paketiVarMi) {
            item.sevkDetay.forEach((item2) async {
              if (item2.paketKodu == urun.stokKodu) {
                int kalemBakiye =
                    item2.paketMiktar - item2.paketOkutulmusMiktar;
                if (kalemBakiye > 0) {
                  if (urun.kod2 == "KUMAS") {
                    okutmadanKalan = kalemBakiye;
                    ilkOkunanMiktar = kalemBakiye;
                  }
                  if (okutmadanKalan <= kalemBakiye) {
                    item2.paketOkutulmusMiktar += okutmadanKalan;
                    okutmadanKalan = 0;
                    item2.paketBakiye =
                        item2.paketMiktar - item2.paketOkutulmusMiktar;

                    Map body = {
                      "SevkMasId": item2.sevkMasID,
                      "SevkTraId": item2.sevkTraID,
                      "SeriNo": barcodeController.text.split("-")[1],
                      "OkutulmusMiktar": item2.paketOkutulmusMiktar,
                      "StokKodu": item2.paketKodu,
                      "UserId": userState.userModel.data.userID
                    };

                    var barcodeResult = await service.post(
                        "sevkiyat/barkodkaydet", body, ResultModel());
                    print(barcodeResult);
                    double minOkutulmusMiktar = 0;
                    if (urun.kod2 == "KUMAS") {
                      int tmpSevkMas = item.sevkDetay
                          .where(
                              (element) => element.sevkMasID == item2.sevkMasID)
                          .map<int>((e) => e.sevkMasID)
                          .reduce(min);
                      var tmpSevkDetay = item.sevkDetay
                          .where((element) => element.sevkMasID == tmpSevkMas)
                          .first;
                      minOkutulmusMiktar = tmpSevkDetay.paketOkutulmusMiktar /
                          tmpSevkDetay.receteBrMiktar;
                    } else {
                      int tmpSevkMas = item.sevkDetay
                          .where(
                              (element) => element.sevkMasID == item2.sevkMasID)
                          .map<int>((e) => e.sevkMasID)
                          .reduce(min);
                      var tmpSevkDetay = item.sevkDetay
                          .where((element) => element.sevkMasID == tmpSevkMas)
                          .first;
                      minOkutulmusMiktar = tmpSevkDetay.paketOkutulmusMiktar /
                          tmpSevkDetay.receteBrMiktar;
                      minOkutulmusMiktar =
                          minOkutulmusMiktar.floor().toDouble();
                    }

                    item.okutulmusMiktar = minOkutulmusMiktar.toInt();
                    item.bakiye = item.miktar - item.okutulmusMiktar;

                    Map data2 = {
                      "SevkMasId": item.sevkMasID,
                      "SevkTraId": item2.sevkTraID,
                      "SeriNo": seriNo[1],
                      "OkutulmusMiktar": item.okutulmusMiktar,
                      "StokKodu": item.stokKodu,
                      "UserId": userState.userModel.data.userID
                    };
                    var body2 = json.encode(data2);

                    var barcodeResult2 = await service.post<ResultModel>(
                        "sevkiyat/barkodkaydet", body2, ResultModel());
                    print(barcodeResult2.message);
                  } else {
                    item2.paketOkutulmusMiktar += item2.paketBakiye;
                    okutmadanKalan -= item2.paketBakiye;
                    item2.paketBakiye = 0;

                    Map body = {
                      "SevkMasId": item2.sevkMasID,
                      "SevkTraId": item2.sevkTraID,
                      "SeriNo": barcodeController.text.split("-")[1],
                      "OkutulmusMiktar": item2.paketOkutulmusMiktar,
                      "StokKodu": item2.paketKodu,
                      "UserId": userState.userModel.data.userID
                    };

                    var barcodeResult2 = await service.post(
                        "sevkiyat/barkodkaydet", body, ResultModel());
                  }
                }
              }
            });
          }
        } else {
          if (item.stokKodu == urun.stokKodu) {
            int kalemBakiye = item.miktar - item.okutulmusMiktar;
            if (kalemBakiye > 0) {
              if (okutmadanKalan <= kalemBakiye) {
                item.okutulmusMiktar += okutmadanKalan;
                okutmadanKalan = 0;
                item.bakiye = item.miktar - item.okutulmusMiktar;
              }
            }
          }
        }
      });
    }

    FocusScope.of(context).requestFocus(barcodeFocusNode);

    focusNode();
    /*
    sevkDetayState.sevkDetayModel.data.forEach((kalem) {
      int okumadanKalan = kalem.miktar;
      int ilkOkunanMiktar = kalem.miktar;
      int minOkutulmusMiktar = 0;
      if (kalem.miktar > kalem.okutulmusMiktar) {
        if (kalem.paketiVarMi) {
          int kalemBakiye = kalem.miktar - kalem.okutulmusMiktar;

          if (kalemBakiye > 0) {
            if (urun.kod2 == "KUMAS") {
              okumadanKalan = kalemBakiye;
              ilkOkunanMiktar = kalemBakiye;
            }

            if (okumadanKalan <= kalemBakiye) {
              kalem.okutulmusMiktar += okumadanKalan;
              okumadanKalan = 0;
              kalem.bakiye = kalem.miktar - kalem.okutulmusMiktar;
            }

            if (urun.kod2 == "KUMAS") {
              int minSevMasId =
                  kalem.sevkDetay.map<int>((e) => e.sevkMasID).reduce(min);
              print(minSevMasId);
            } else {
              int minSevMasId =
                  kalem.sevkDetay.map<int>((e) => e.sevkMasID).reduce(min);
                  print(minSevMasId);
            }
          }
        }
      }
    });*/
  }

  focusNode() {
    barcodeController.text = "";
    FocusScope.of(context).requestFocus(barcodeFocusNode);
  }
}
