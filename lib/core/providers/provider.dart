import 'package:provider/provider.dart';
import 'package:smg_depo/core/state/login_state/user_state.dart';
import 'package:smg_depo/core/state/urun_toplama/urun_toplama_state.dart';

class ProviderList {
  static providerList() {
    return [
      ChangeNotifierProvider<UserState>(create: (_) => UserState()),
      ChangeNotifierProvider<UrunToplamaState>(
          create: (_) => UrunToplamaState())
    ];
  }
}
