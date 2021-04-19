import 'package:smg_depo/core/model/abstract/base_model.dart';

class UserModel extends IBaseModel {
  Data data;
  bool success;
  String message;

  UserModel({this.data, this.success, this.message});

  UserModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }

  @override
  fromJson(Map<String, Object> json) {
    return UserModel.fromJson(json);
  }
}

class Data {
  int userID;
  String username;
  String password;
  String firstName;
  String lastName;
  String code1;
  String code2;
  String code3;
  String code4;
  String code5;
  String code6;
  int userGroupID;
  Token token;

  Data(
      {this.userID,
      this.username,
      this.password,
      this.firstName,
      this.lastName,
      this.code1,
      this.code2,
      this.code3,
      this.code4,
      this.code5,
      this.code6,
      this.userGroupID,
      this.token});

  Data.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    username = json['username'];
    password = json['password'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    code1 = json['code1'];
    code2 = json['code2'];
    code3 = json['code3'];
    code4 = json['code4'];
    code5 = json['code5'];
    code6 = json['code6'];
    userGroupID = json['userGroupID'];
    token = json['token'] != null ? new Token.fromJson(json['token']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userID'] = this.userID;
    data['username'] = this.username;
    data['password'] = this.password;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['code1'] = this.code1;
    data['code2'] = this.code2;
    data['code3'] = this.code3;
    data['code4'] = this.code4;
    data['code5'] = this.code5;
    data['code6'] = this.code6;
    data['userGroupID'] = this.userGroupID;
    if (this.token != null) {
      data['token'] = this.token.toJson();
    }
    return data;
  }
}

class Token {
  String accessToken;
  String expiration;
  String refreshToken;

  Token({this.accessToken, this.expiration, this.refreshToken});

  Token.fromJson(Map<String, dynamic> json) {
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
}
