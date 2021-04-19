import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smg_depo/core/components/drawer/drawer_component.dart';
import 'package:smg_depo/core/model/concrete/login/user_model.dart';
import 'package:smg_depo/view/home/main_page/components/card_container.dart';
import 'main_view_model.dart';

class MainView extends MainViewModel {
  UserModel userModel;

  MainView(this.userModel);

  @override
  void initState() {
    getModules(userModel.data.userID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Anasayfa"),
        ),
        drawer: DrawerComponent(userModel.data.username),
        body: modulListesi != null
            ? Padding(
                padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 250,
                     ),
                    itemCount: modulListesi.data.length,
                    itemBuilder: (BuildContext context, index) {
                      return customMainCardContainer(
                          imagePath: modulListesi.data[index].icon,
                          title: modulListesi.data[index].moduleExp,
                          navigatorName: modulListesi.data[index].moduleName,
                          context: context);
                    }),
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
