import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:smg_depo/core/components/dialog/dialog_message.dart';
import 'package:smg_depo/core/model/concrete/api_model/result_model.dart';
import 'package:smg_depo/core/model/concrete/urun_toplama/cikis_depo_model.dart';
import 'package:smg_depo/core/model/concrete/urun_toplama/sevkiyat_detay_model.dart';
import 'package:smg_depo/core/model/concrete/urun_toplama/sevkiyat_liste_model.dart';
import 'package:smg_depo/core/base/base_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smg_depo/core/model/concrete/urun_toplama/sevkiyat_yukle_dto.dart';
import 'package:smg_depo/core/state/login_state/user_state.dart';
import 'package:smg_depo/core/state/urun_toplama/urun_toplama_state.dart';
import 'package:smg_depo/view/urun_toplama/sevk_listesi/sevkiyat_ui.dart';
import 'package:provider/provider.dart';
import 'package:smg_depo/core/model/concrete/urun_toplama/sevkiyat_liste_model.dart'
    as sevkiyat;

abstract class SevkiyatViewModel extends State<SevkiyatPage> {
  SevkiyatListeModel sevkiyatListesi;
  TextEditingController editingController = TextEditingController();
  CikisDepoKoduModel cikisDepoKodlari;
  String cikisDepoKodu = "";
  List<sevkiyat.Data> selectedItem = [];

  var tempData = [];

// Datatable üzerinden seçilen kayıtları listeye al.
  onSelectedRow(bool selected, sevkiyat.Data element) async {
    setState(() {
      if (selected) {
        selectedItem.add(element);
      } else {
        selectedItem.remove(element);
      }
    });
  }

  // Sevkiyat listesini getirir.
  getSevkiyatListesi() async {
    final prefs = await SharedPreferences.getInstance();
    String subeKodu = prefs.getString("subeKodu");
    if (cikisDepoKodu.isNotEmpty) {
      var service = BaseService();
      debugPrint(cikisDepoKodu);
      var queryParams = {"subeKodu": subeKodu, "cikisDepoKodu": cikisDepoKodu};
      var result = await service.get<SevkiyatListeModel>(
          "sevkiyat/sevkiyatlistesi/",
          body: queryParams,
          model: SevkiyatListeModel());
      setState(() {
        sevkiyatListesi = result;
        tempData = result.data;
      });
    }
  }

//Seçilen cikis depo kodunu state ata.
  setCikisDepoKodu(cikisDepo) {
    setState(() {
      cikisDepoKodu = cikisDepo;
    });
    getSevkiyatListesi();
  }

//Cikis depo kodlarini veritabanindan getir.
  getCikisDepo() async {
    final prefs = await SharedPreferences.getInstance();
    String subeKodu = prefs.getString("subeKodu");

    var state = Provider.of<UserState>(context, listen: false);
    String cikisDepo = state.userModel.data.code1;
    var service = BaseService();
    var queryParams = {"subeKodu": subeKodu, "cikisDepoKodu": cikisDepo};
    var result = await service.get("sevkiyat/cikisdepo",
        body: queryParams, model: CikisDepoKoduModel());

    setState(() {
      cikisDepoKodlari = result;
    });
  }

  //Sevk içeriğini yükle
  yukle() async {
    final prefs = await SharedPreferences.getInstance();
    List<SevkiyatYukleDto> requestList = [];

    var state = Provider.of<UserState>(context, listen: false);
    int userId = state.userModel.data.userID;
    String subeKodu = prefs.getString("subeKodu");

    selectedItem.forEach((element) {
      requestList.add(SevkiyatYukleDto(
          element.sevkEmriNo, element.cariKodu, int.parse(subeKodu), userId));
    });

    var service = BaseService();
    var yukle = await service.post<ResultModel>(
        "sevkiyat/yukle",
        json.encode(requestList.map((e) => e.jsonParse()).toList()),
        ResultModel());

    if (!yukle.success) {
      CustomDialogBox.errorDialog(
          context, "HATA", "Bir hata meydana geldi", () => {print("clicked")});
      return;
    }

    var detay = await service.post<SevkDetayModel>(
        "sevkiyat/sevkicerik",
        json.encode(requestList.map((e) => e.jsonParse()).toList()),
        SevkDetayModel());

    var sevkDetayState = Provider.of<UrunToplamaState>(context, listen: false);
    sevkDetayState.set(detay);
    sevkDetayState.setCikisDepoKodu(cikisDepoKodu);
    Navigator.pushNamed(context, "/UrunToplamaDetay");
  }

  sil() async {
    var service = BaseService();
    List<SevkiyatYukleDto> requestList = [];
    selectedItem.forEach((element) {
      requestList
          .add(SevkiyatYukleDto(element.sevkEmriNo, element.cariKodu, 0, 0));
    });

    var result = await service.post<ResultModel>(
        "sevkiyat/sevkiyatsil",
        json.encode(requestList.map((e) => e.jsonParse()).toList()),
        ResultModel());

    if (!result.success) {
      CustomDialogBox.errorDialog(
          context, "HATA", result.message, () => {selectedItem = []});
    } else {
      selectedItem.forEach((element) {
        setState(() {
          sevkiyatListesi.data.remove(element);
        });
      });
      selectedItem = [];
      CustomDialogBox.successDialog(context, "Kayıtlar Başarıyla silindi.");
    }
  }
}
