import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smg_depo/view/urun_toplama/sevk_listesi/sevkiyat_view_model.dart';

class SevkiyatView extends SevkiyatViewModel {
  @override
  void initState() {
    getCikisDepo();
    getSevkiyatListesi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sevkiyat"),
          actions: [
            sevkiyatListesi != null
                ? Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: _drownDownButton())
                : Text("")
          ],
        ),
        body: cikisDepoKodu != ""
            ? sevkiyatListesi == null
                ? Center(child: CircularProgressIndicator())
                : _sevkDataTable()
            : _cikisDepoKoduListesi());
  }

  _drownDownButton() {
    return DropdownButton(
        underline: SizedBox(),
        onChanged: (String newValue) {
          setState(() {
            if (newValue == "Yükle") {
              yukle();
            } else if (newValue == "Sil") {
              sil();
            } else {
              setState(() {
                cikisDepoKodu = "";
                sevkiyatListesi = null;
              });
            }
          });
        },
        icon: Icon(Icons.more_vert, color: Colors.white),
        items: <String>['Yükle', 'Sil', 'Kapat']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList());
  }

  _cikisDepoKoduListesi() {
    return cikisDepoKodlari != null
        ? ListView.builder(
            itemCount: cikisDepoKodlari.data.length,
            itemBuilder: (context, i) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(cikisDepoKodlari.data[i].depoAdi),
                      subtitle: Text(
                          "Depo Kodu : ${cikisDepoKodlari.data[i].depoKodu.toString()}"),
                      leading: Icon(Icons.arrow_forward_ios_rounded),
                      onTap: () => {
                        setCikisDepoKodu(
                            cikisDepoKodlari.data[i].depoKodu.toString())
                      },
                    ),
                    Divider()
                  ],
                ),
              );
            })
        : Center(child: CircularProgressIndicator());
  }

  _sevkDataTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          sortAscending: true,
          showCheckboxColumn: true,
          columns: [
            DataColumn(label: Text('Sevk No')),
            DataColumn(label: Text('Cari Adı')),
            DataColumn(label: Text('Tarih'))
          ],
          rows: sevkiyatListesi
              .data // Loops through dataColumnText, each iteration assigning the value to element
              .map(((element) => DataRow(
                    selected: selectedItem.contains(element),
                    onSelectChanged: (value) => onSelectedRow(value, element),
                    cells: <DataCell>[
                      DataCell(Text(element.sevkEmriNo ??
                          "")), //Extracting from Map element the value
                      DataCell(Text(element.cariAdi ?? "")),
                      DataCell(Text(element.tarihStr ?? "")),
                    ],
                  )))
              .toList(),
        ),
      ),
    );
  }
}
