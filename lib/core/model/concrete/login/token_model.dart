import 'package:smg_depo/core/model/abstract/base_model.dart';

class TokenModel extends IBaseModel {
  String accessToken;
  String expiration;
  String refreshToken;

  TokenModel({this.accessToken, this.expiration, this.refreshToken});

  TokenModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    expiration = json['expiration'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['expiration'] = this.expiration;
    data['refreshToken'] = this.refreshToken;
    return data;
  }

  @override
  fromJson(Map<String, Object> json) {
    return TokenModel.fromJson(json);
  }
}
