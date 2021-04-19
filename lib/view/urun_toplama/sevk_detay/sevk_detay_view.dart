import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smg_depo/core/state/urun_toplama/urun_toplama_state.dart';
import 'package:smg_depo/view/urun_toplama/sevk_detay/sevk_detay_view_model.dart';

class SevkiyatDetayView extends SevkiyatDetayViewModel {
  SevkiyatDetayView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sevkiyat Detay")),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                width: MediaQuery.of(context).size.width -
                    15, // do it in both Container
                child: TextFormField(
                  autofocus: true,
                  controller: barcodeController,
                  focusNode: barcodeFocusNode,
                  onFieldSubmitted: (value) => {getUrunBilgi(value)},
                  decoration: InputDecoration(
                    icon: Icon(Icons.qr_code),
                    hintText: 'Barkod',
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal, child: _detayDataTable())
          ],
        ),
      ),
    );
  }

  _detayDataTable() {
    var state = Provider.of<UrunToplamaState>(context, listen: false);
    print(state.sevkDetayModel.data);
    return DataTable(
      sortAscending: true,
      columnSpacing: 25,
      columns: [
        DataColumn(label: Text('Takım')),
        DataColumn(label: Text('Paket')),
        DataColumn(label: Text('Miktar')),
        DataColumn(label: Text('Okutulan')),
        DataColumn(label: Text('Kalan')),
        DataColumn(
            label: Text(
          'Stok Adı',
          style: TextStyle(fontStyle: FontStyle.italic),
        )),
        DataColumn(label: Text('Cari Adı')),
        DataColumn(label: Text('Stok Kodu')),
        DataColumn(label: Text('Cari Kodu')),
        DataColumn(label: Text('Sevk Emri No'))
      ],
      rows: state.sevkDetayModel
          .data // Loops through dataColumnText, each iteration assigning the value to element
          .map(((element) => DataRow(
                color: MaterialStateColor.resolveWith((states) {
                  if (element.bakiye == 0) {
                    return Colors.green[200];
                  } else {
                    return Colors.white10;
                  }
                }),
                cells: <DataCell>[
                  DataCell(element.paketiVarMi
                      ? Center(child: Icon(Icons.cancel, color: Colors.red))
                      : Center(
                          child:
                              Icon(Icons.check_circle, color: Colors.green))),
                  DataCell(element.paketiVarMi
                      ? Center(
                          child: Icon(Icons.check_circle, color: Colors.green))
                      : Center(child: Icon(Icons.cancel, color: Colors.red))),
                  DataCell(Center(child: Text(element.miktar.toString()))),
                  DataCell(
                      Center(child: Text(element.okutulmusMiktar.toString()))),
                  DataCell(Center(
                    child: Text(
                        (element.miktar - element.okutulmusMiktar).toString()),
                  )),
                  DataCell(Text(
                      element.stokAdi)), //Extracting from Map element the value
                  DataCell(Text(element.cariAdi)),
                  DataCell(Text(element.stokKodu)),
                  DataCell(Text(element.cariKodu)),
                  DataCell(Text(element.sevkEmriNo))
                ],
              )))
          .toList(),
    );
  }
}
