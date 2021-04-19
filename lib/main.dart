import 'package:flutter/material.dart';
import 'core/providers/provider.dart';
import 'core/routes/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: ProviderList.providerList(),
      child: MaterialApp(
      theme: ThemeData(primaryColor: Colors.red),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routers.generateRoute,
      initialRoute: loginPage,
    ),
  ));
}
