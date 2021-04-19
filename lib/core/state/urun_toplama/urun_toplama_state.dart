import 'package:flutter/foundation.dart';
import 'package:smg_depo/core/model/concrete/urun_toplama/sevkiyat_detay_model.dart';

class UrunToplamaState with ChangeNotifier {
  SevkDetayModel _model = SevkDetayModel();
  int _cikisDepoKodu;

  SevkDetayModel get sevkDetayModel => _model;

  set(SevkDetayModel sevkDetayModel) {
    _model = sevkDetayModel;
    notifyListeners();
  }
  setBakiye(int bakiye,int sevkMasId){

    notifyListeners();
  }
  setCikisDepoKodu(String cikisDepoKodu){
    _cikisDepoKodu=int.parse(cikisDepoKodu);
      notifyListeners();
  }
  int get cikisDepoKodu => _cikisDepoKodu;
}
