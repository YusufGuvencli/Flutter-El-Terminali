import 'package:flutter/cupertino.dart';
import 'package:smg_depo/core/base/base_service.dart';
import 'package:smg_depo/core/model/concrete/main_page/main_page_model.dart';
import 'main_ui.dart';

abstract class MainViewModel extends State<MainPage> {
  ModulListesi modulListesi;
  getModules(int userId) async {
    var service = BaseService();
    var queryParams = {"userId": userId.toString()};

    var result = await service.get<ModulListesi>("modul/modullistesi/",
        model: ModulListesi(), body: queryParams);
    setState(() {
      modulListesi = result;
    });
  }
}
