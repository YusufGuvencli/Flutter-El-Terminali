import 'package:flutter/cupertino.dart';
import 'package:smg_depo/core/model/concrete/login/user_model.dart';
import 'main_view.dart';

// ignore: must_be_immutable
class MainPage extends StatefulWidget {
  UserModel _userModel;
  MainPage(this._userModel);
  @override
  MainView createState() => new MainView(_userModel);
}