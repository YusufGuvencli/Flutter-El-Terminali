import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'mal_kabul_view_model.dart';

class MalKabulView extends MalKabulViewModel {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mal Kabul")),
      body: Container(child: Text("Mal Kabul"),),
    );
  }
}