import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smg_depo/core/components/buttons/custom_raw_material_button.dart';
import 'package:smg_depo/core/components/text_input/form_text_input.dart';
import 'package:smg_depo/view/authenticate/login_screen/login_view_model.dart';

class LoginView extends LoginViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color(0xFFffc371),
                Color(0xFFff5f6d),
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Container(
                  child: Image.asset('assets/images/logo.png'), width: 200),
              SizedBox(height: 15),
              Container(
                height: MediaQuery.of(context).size.height / 1.7,
                width: MediaQuery.of(context).size.width - 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text("Giriş Paneli",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                          Text("Lütfen kullanıcı adı ve şifrenizi giriniz...",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.blueGrey)),
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              customFormTextInput(
                                  controler: userNameController,
                                  validateMessage: "Kullanıcı adınızı giriniz.",
                                  labelText: "Kullanıcı Adı",
                                  iconData: FontAwesomeIcons.user),
                              SizedBox(height: 5),
                              customFormTextInput(
                                  controler: passwordController,
                                  validateMessage: "Şifrenizi giriniz.",
                                  labelText: "Parola",
                                  iconData: FontAwesomeIcons.lock,
                                  obscureText: true)
                            ],
                          ),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomRawMaterialButton(
                          onPressed: () => doLogin(context),
                          title: "Giriş Yap",
                        ),
                        CustomRawMaterialButton(
                            onPressed: () => doLogin(context),
                            title: "Çıkış Yap",
                            buttonColor: Colors.red),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
