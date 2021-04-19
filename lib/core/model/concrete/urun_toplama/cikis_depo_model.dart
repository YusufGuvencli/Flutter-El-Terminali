import 'package:smg_depo/core/model/abstract/base_model.dart';

class CikisDepoKoduModel extends IBaseModel {
  List<Data> data;
  bool success;
  Null message;

  CikisDepoKoduModel({this.data, this.success, this.message});

  CikisDepoKoduModel.fromJson(Map<String, dynamic> json) {
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
   return CikisDepoKoduModel.fromJson(json);
  }
}

class Data {
  int depoKodu;
  String depoAdi;

  Data({this.depoKodu, this.depoAdi});

  Data.fromJson(Map<String, dynamic> json) {
    depoKodu = json['depoKodu'];
    depoAdi = json['depoAdi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['depoKodu'] = this.depoKodu;
    data['depoAdi'] = this.depoAdi;
    return data;
  }
}
