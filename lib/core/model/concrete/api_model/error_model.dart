import 'package:smg_depo/core/model/abstract/base_model.dart';

class ErrorModel extends IBaseModel {
  String data;
  bool success;
  String message;

  ErrorModel({this.data, this.success, this.message});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }

  @override
  fromJson(Map<String, Object> json) {
    return ErrorModel.fromJson(json);
  }
}
