import 'package:smg_depo/core/model/abstract/base_model.dart';

class SevkiyatListeModel extends IBaseModel {
  List<Data> data;
  bool success;
  String message;

  SevkiyatListeModel({this.data, this.success, this.message});

  SevkiyatListeModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data =  List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }

  @override
  fromJson(Map<String, Object> json) {
    return SevkiyatListeModel.fromJson(json);
  }
}

class Data {
  String siparisNo;
  int subeKodu;
  String sevkEmriNo;
  String subeAdi;
  String kayitTarihi;
  String cariKodu;
  String cariAdi;
  int sevkMiktar;
  int yuklemeMiktar;
  int irsaliyeMiktar;
  String adres;
  String telefon;
  String stokKodu;
  String stokAdi;
  String aciklama1;
  String aciklama2;
  String aciklama3;
  String tarih;
  String tarihStr;
  int sevkSira;
  int paketiVarMi;
  int sevkDepoKodu;
  int siparisSira;
  String rut;
  String grupKodu;
  String plasiyerKodu;

  Data(
      {this.siparisNo,
      this.subeKodu,
      this.sevkEmriNo,
      this.subeAdi,
      this.kayitTarihi,
      this.cariKodu,
      this.cariAdi,
      this.sevkMiktar,
      this.yuklemeMiktar,
      this.irsaliyeMiktar,
      this.adres,
      this.telefon,
      this.stokKodu,
      this.stokAdi,
      this.aciklama1,
      this.aciklama2,
      this.aciklama3,
      this.tarih,
      this.tarihStr,
      this.sevkSira,
      this.paketiVarMi,
      this.sevkDepoKodu,
      this.siparisSira,
      this.rut,
      this.grupKodu,
      this.plasiyerKodu});

  Data.fromJson(Map<String, dynamic> json) {
    siparisNo = json['siparisNo'];
    subeKodu = json['subeKodu'];
    sevkEmriNo = json['sevkEmriNo'];
    subeAdi = json['subeAdi'];
    kayitTarihi = json['kayitTarihi'];
    cariKodu = json['cariKodu'];
    cariAdi = json['cariAdi'];
    sevkMiktar = json['sevkMiktar'];
    yuklemeMiktar = json['yuklemeMiktar'];
    irsaliyeMiktar = json['irsaliyeMiktar'];
    adres = json['adres'];
    telefon = json['telefon'];
    stokKodu = json['stokKodu'];
    stokAdi = json['stokAdi'];
    aciklama1 = json['aciklama1'];
    aciklama2 = json['aciklama2'];
    aciklama3 = json['aciklama3'];
    tarih = json['tarih'];
    tarihStr = json['tarihStr'];
    sevkSira = json['sevkSira'];
    paketiVarMi = json['paketiVarMi'];
    sevkDepoKodu = json['sevkDepoKodu'];
    siparisSira = json['siparisSira'];
    rut = json['rut'];
    grupKodu = json['grupKodu'];
    plasiyerKodu = json['plasiyerKodu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['siparisNo'] = this.siparisNo;
    data['subeKodu'] = this.subeKodu;
    data['sevkEmriNo'] = this.sevkEmriNo;
    data['subeAdi'] = this.subeAdi;
    data['kayitTarihi'] = this.kayitTarihi;
    data['cariKodu'] = this.cariKodu;
    data['cariAdi'] = this.cariAdi;
    data['sevkMiktar'] = this.sevkMiktar;
    data['yuklemeMiktar'] = this.yuklemeMiktar;
    data['irsaliyeMiktar'] = this.irsaliyeMiktar;
    data['adres'] = this.adres;
    data['telefon'] = this.telefon;
    data['stokKodu'] = this.stokKodu;
    data['stokAdi'] = this.stokAdi;
    data['aciklama1'] = this.aciklama1;
    data['aciklama2'] = this.aciklama2;
    data['aciklama3'] = this.aciklama3;
    data['tarih'] = this.tarih;
    data['tarihStr'] = this.tarihStr;
    data['sevkSira'] = this.sevkSira;
    data['paketiVarMi'] = this.paketiVarMi;
    data['sevkDepoKodu'] = this.sevkDepoKodu;
    data['siparisSira'] = this.siparisSira;
    data['rut'] = this.rut;
    data['grupKodu'] = this.grupKodu;
    data['plasiyerKodu'] = this.plasiyerKodu;
    return data;
  }
}