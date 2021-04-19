import 'package:flutter/foundation.dart';
import 'package:smg_depo/core/model/concrete/login/user_model.dart';

class UserState with ChangeNotifier {

  UserModel _userModel = UserModel();

  UserModel get userModel => _userModel;


  set(UserModel userModel) {
    _userModel = userModel;
    notifyListeners();
  }
}
