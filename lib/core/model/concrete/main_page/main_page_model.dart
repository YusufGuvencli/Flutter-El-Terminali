import 'dart:convert';

import 'package:smg_depo/core/model/abstract/base_model.dart';

ModulListesi modulListesiFromJson(String str) => ModulListesi.fromJson(json.decode(str));

String modulListesiToJson(ModulListesi data) => json.encode(data.toJson());

class ModulListesi extends IBaseModel {
  ModulListesi({
    this.data,
    this.success,
    this.message,
  });

  List<Datum> data;
  bool success;
  dynamic message;

  factory ModulListesi.fromJson(Map<String, dynamic> json) => ModulListesi(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "success": success,
    "message": message,
  };

  @override
  fromJson(Map<String, Object> json) {
    return ModulListesi.fromJson(json);
  }
}

class Datum {
  Datum({
    this.moduleId,
    this.moduleName,
    this.moduleExp,
    this.icon,
    this.userId,
  });

  int moduleId;
  String moduleName;
  String moduleExp;
  String icon;
  int userId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    moduleId: json["moduleID"],
    moduleName: json["moduleName"],
    moduleExp: json["moduleExp"],
    icon: json["icon"],
    userId: json["userID"],
  );

  Map<String, dynamic> toJson() => {
    "moduleID": moduleId,
    "moduleName": moduleName,
    "moduleExp": moduleExp,
    "icon": icon,
    "userID": userId,
  };
}
