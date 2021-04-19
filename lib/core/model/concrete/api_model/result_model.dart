import 'package:smg_depo/core/model/abstract/base_model.dart';

class ResultModel extends IBaseModel {
  bool success;
  String message;

  ResultModel({this.success, this.message});

  ResultModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }

  @override
  fromJson(Map<String, Object> json) {
    return ResultModel.fromJson(json);
  }
}
