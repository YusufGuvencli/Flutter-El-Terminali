import 'package:smg_depo/core/model/abstract/base_model.dart';

class UrunBilgiModel extends IBaseModel {
  List<Data> data;
  bool success;
  String message;

  UrunBilgiModel({this.data, this.success, this.message});

  UrunBilgiModel.fromJson(Map<String, dynamic> json) {
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
    return UrunBilgiModel.fromJson(json);
  }
}

class Data {
  String stokKodu;
  String stokAdi;
  int miktar;
  String girisSeriliMi;
  String cikisSeriliMi;
  String grupKodu;
  String kod1;
  String kod2;
  String kod3;
  String kod4;
  String kod5;
  Null seriNo;
  int seriIncKey;
  int moduleID;
  int seriGirisDepoKodu;
  int seriCikisDepoKodu;
  String tur;

  Data(
      {this.stokKodu,
      this.stokAdi,
      this.miktar,
      this.girisSeriliMi,
      this.cikisSeriliMi,
      this.grupKodu,
      this.kod1,
      this.kod2,
      this.kod3,
      this.kod4,
      this.kod5,
      this.seriNo,
      this.seriIncKey,
      this.moduleID,
      this.seriGirisDepoKodu,
      this.seriCikisDepoKodu,
      this.tur});

  Data.fromJson(Map<String, dynamic> json) {
    stokKodu = json['stokKodu'];
    stokAdi = json['stokAdi'];
    miktar = json['miktar'];
    girisSeriliMi = json['girisSeriliMi'];
    cikisSeriliMi = json['cikisSeriliMi'];
    grupKodu = json['grupKodu'];
    kod1 = json['kod1'];
    kod2 = json['kod2'];
    kod3 = json['kod3'];
    kod4 = json['kod4'];
    kod5 = json['kod5'];
    seriNo = json['seriNo'];
    seriIncKey = json['seriIncKey'];
    moduleID = json['moduleID'];
    seriGirisDepoKodu = json['seriGirisDepoKodu'];
    seriCikisDepoKodu = json['seriCikisDepoKodu'];
    tur = json['tur'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stokKodu'] = this.stokKodu;
    data['stokAdi'] = this.stokAdi;
    data['miktar'] = this.miktar;
    data['girisSeriliMi'] = this.girisSeriliMi;
    data['cikisSeriliMi'] = this.cikisSeriliMi;
    data['grupKodu'] = this.grupKodu;
    data['kod1'] = this.kod1;
    data['kod2'] = this.kod2;
    data['kod3'] = this.kod3;
    data['kod4'] = this.kod4;
    data['kod5'] = this.kod5;
    data['seriNo'] = this.seriNo;
    data['seriIncKey'] = this.seriIncKey;
    data['moduleID'] = this.moduleID;
    data['seriGirisDepoKodu'] = this.seriGirisDepoKodu;
    data['seriCikisDepoKodu'] = this.seriCikisDepoKodu;
    data['tur'] = this.tur;
    return data;
  }
}