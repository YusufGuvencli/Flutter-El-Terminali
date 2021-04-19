import 'package:smg_depo/core/model/abstract/base_model.dart';

class SevkDetayModel extends IBaseModel {
  List<Data> data;
  bool success;
  String message;

  SevkDetayModel({this.data, this.success, this.message});

  SevkDetayModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
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
    return SevkDetayModel.fromJson(json);
  }
}

class Data {
  int sevkMasID;
  int subeKodu;
  String sevkEmriNo;
  int sevkEmriSira;
  String stokKodu;
  String stokAdi;
  int miktar;
  int okutulmusMiktar;
  int bakiye;
  bool paketiVarMi;
  String kayitTarihi;
  int kayitYapanKul;
  String planNo;
  String cariKodu;
  String cariAdi;
  int okutulmusMiktarKamyon;
  int bakiyeKamyon;
  String bkKod;
  String grupKodu;
  String tur;
  List<SevkDetay> sevkDetay;

  Data(
      {this.sevkMasID,
      this.subeKodu,
      this.sevkEmriNo,
      this.sevkEmriSira,
      this.stokKodu,
      this.stokAdi,
      this.miktar,
      this.okutulmusMiktar,
      this.bakiye,
      this.paketiVarMi,
      this.kayitTarihi,
      this.kayitYapanKul,
      this.planNo,
      this.cariKodu,
      this.cariAdi,
      this.okutulmusMiktarKamyon,
      this.bakiyeKamyon,
      this.bkKod,
      this.grupKodu,
      this.tur,
      this.sevkDetay});

  Data.fromJson(Map<String, dynamic> json) {
    sevkMasID = json['sevkMasID'];
    subeKodu = json['subeKodu'];
    sevkEmriNo = json['sevkEmriNo'];
    sevkEmriSira = json['sevkEmriSira'];
    stokKodu = json['stokKodu'];
    stokAdi = json['stokAdi'];
    miktar = json['miktar'];
    okutulmusMiktar = json['okutulmusMiktar'];
    bakiye = json['bakiye'];
    paketiVarMi = json['paketiVarMi'];
    kayitTarihi = json['kayitTarihi'];
    kayitYapanKul = json['kayitYapanKul'];
    planNo = json['planNo'];
    cariKodu = json['cariKodu'];
    cariAdi = json['cariAdi'];
    okutulmusMiktarKamyon = json['okutulmusMiktarKamyon'];
    bakiyeKamyon = json['bakiyeKamyon'];
    bkKod = json['bkKod'];
    grupKodu = json['grupKodu'];
    tur = json['tur'];
    if (json['sevkDetay'] != null) {
      sevkDetay = new List<SevkDetay>();
      json['sevkDetay'].forEach((v) {
        sevkDetay.add(new SevkDetay.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sevkMasID'] = this.sevkMasID;
    data['subeKodu'] = this.subeKodu;
    data['sevkEmriNo'] = this.sevkEmriNo;
    data['sevkEmriSira'] = this.sevkEmriSira;
    data['stokKodu'] = this.stokKodu;
    data['stokAdi'] = this.stokAdi;
    data['miktar'] = this.miktar;
    data['okutulmusMiktar'] = this.okutulmusMiktar;
    data['bakiye'] = this.bakiye;
    data['paketiVarMi'] = this.paketiVarMi;
    data['kayitTarihi'] = this.kayitTarihi;
    data['kayitYapanKul'] = this.kayitYapanKul;
    data['planNo'] = this.planNo;
    data['cariKodu'] = this.cariKodu;
    data['cariAdi'] = this.cariAdi;
    data['okutulmusMiktarKamyon'] = this.okutulmusMiktarKamyon;
    data['bakiyeKamyon'] = this.bakiyeKamyon;
    data['bkKod'] = this.bkKod;
    data['grupKodu'] = this.grupKodu;
    data['tur'] = this.tur;
    if (this.sevkDetay != null) {
      data['sevkDetay'] = this.sevkDetay.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SevkDetay {
  int sevkMasID;
  int sevkTraID;
  int subeKodu;
  String sevkEmriNo;
  int sevkEmriSira;
  int paketSira;
  String paketKodu;
  String paketAdi;
  int receteBrMiktar;
  int paketMiktar;
  int paketOkutulmusMiktar;
  int paketBakiye;
  String kayitTarihi;
  int kayitYapanKul;
  String planNo;
  String cariKodu;
  String cariAdi;
  int paketOkutulmusMiktarKamyon;
  int paketBakiyeKamyon;
  String grupKodu;
  String tur;

  SevkDetay(
      {this.sevkMasID,
      this.sevkTraID,
      this.subeKodu,
      this.sevkEmriNo,
      this.sevkEmriSira,
      this.paketSira,
      this.paketKodu,
      this.paketAdi,
      this.receteBrMiktar,
      this.paketMiktar,
      this.paketOkutulmusMiktar,
      this.paketBakiye,
      this.kayitTarihi,
      this.kayitYapanKul,
      this.planNo,
      this.cariKodu,
      this.cariAdi,
      this.paketOkutulmusMiktarKamyon,
      this.paketBakiyeKamyon,
      this.grupKodu,
      this.tur});

  SevkDetay.fromJson(Map<String, dynamic> json) {
    sevkMasID = json['sevkMasID'];
    sevkTraID = json['sevkTraID'];
    subeKodu = json['subeKodu'];
    sevkEmriNo = json['sevkEmriNo'];
    sevkEmriSira = json['sevkEmriSira'];
    paketSira = json['paketSira'];
    paketKodu = json['paketKodu'];
    paketAdi = json['paketAdi'];
    receteBrMiktar = json['receteBrMiktar'];
    paketMiktar = json['paketMiktar'];
    paketOkutulmusMiktar = json['paketOkutulmusMiktar'];
    paketBakiye = json['paketBakiye'];
    kayitTarihi = json['kayitTarihi'];
    kayitYapanKul = json['kayitYapanKul'];
    planNo = json['planNo'];
    cariKodu = json['cariKodu'];
    cariAdi = json['cariAdi'];
    paketOkutulmusMiktarKamyon = json['paketOkutulmusMiktarKamyon'];
    paketBakiyeKamyon = json['paketBakiyeKamyon'];
    grupKodu = json['grupKodu'];
    tur = json['tur'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sevkMasID'] = this.sevkMasID;
    data['sevkTraID'] = this.sevkTraID;
    data['subeKodu'] = this.subeKodu;
    data['sevkEmriNo'] = this.sevkEmriNo;
    data['sevkEmriSira'] = this.sevkEmriSira;
    data['paketSira'] = this.paketSira;
    data['paketKodu'] = this.paketKodu;
    data['paketAdi'] = this.paketAdi;
    data['receteBrMiktar'] = this.receteBrMiktar;
    data['paketMiktar'] = this.paketMiktar;
    data['paketOkutulmusMiktar'] = this.paketOkutulmusMiktar;
    data['paketBakiye'] = this.paketBakiye;
    data['kayitTarihi'] = this.kayitTarihi;
    data['kayitYapanKul'] = this.kayitYapanKul;
    data['planNo'] = this.planNo;
    data['cariKodu'] = this.cariKodu;
    data['cariAdi'] = this.cariAdi;
    data['paketOkutulmusMiktarKamyon'] = this.paketOkutulmusMiktarKamyon;
    data['paketBakiyeKamyon'] = this.paketBakiyeKamyon;
    data['grupKodu'] = this.grupKodu;
    data['tur'] = this.tur;
    return data;
  }
}
