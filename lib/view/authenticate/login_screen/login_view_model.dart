import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:smg_depo/core/base/base_service.dart';
import 'package:smg_depo/core/model/concrete/login/user_model.dart';
import 'package:smg_depo/core/state/login_state/user_state.dart';
import 'package:smg_depo/view/authenticate/login_screen/login_ui.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:smg_depo/view/home/main_page/main_ui.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

abstract class LoginViewModel extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  doLogin(context) async {
    if (!formKey.currentState.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Kullanıcı adı ve şifrenizi girmelisiniz.')));
    } else {
      var data = {
        "Username": userNameController.text,
        "Password": passwordController.text
      };

      var service = BaseService();
      var result = await service.post<UserModel>(
          "login/userlogin", data, UserModel(),formData: true);

      if (result.success) {
        if (result.data != null) {
          var state = Provider.of<UserState>(context, listen: false);
          state.set(result);

          final storage = new FlutterSecureStorage();
          storage.deleteAll();
          await storage.write(
              key: "accessToken", value: result.data.token.accessToken);
          await storage.write(
              key: "refreshToken", value: result.data.token.refreshToken);

          Navigator.push(
              context, MaterialPageRoute(builder: (_) => MainPage(result)));
        } else {
          AwesomeDialog(
            context: context,
            headerAnimationLoop: false,
            dialogType: DialogType.NO_HEADER,
            title: 'Giriş Başarısız!',
            desc: 'Girmiş olduğunuz kullanıcı adı ya da şifre hatalıdır. '
                'Lütfen girdiğiniz bilgileri kontrol ediniz.',
            btnOkOnPress: () {
              userNameController.text = "";
              passwordController.text = "";
            },
            btnOkIcon: Icons.check_circle,
          )..show();
        }
      } else {
        AwesomeDialog(
            context: context,
            headerAnimationLoop: false,
            dialogType: DialogType.ERROR,
            title: "HATA!",
            desc: result.message,
            btnOkOnPress: () {
              userNameController.text = "";
              passwordController.text = "";
            },
            btnOkIcon: Icons.check_circle)
          ..show();
      }
    }
  }
}
