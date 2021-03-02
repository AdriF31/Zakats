import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HitungZakatPertanian extends StatefulWidget {
  @override
  _HitungZakatPertanianState createState() => _HitungZakatPertanianState();
}

class _HitungZakatPertanianState extends State<HitungZakatPertanian> {
  List<String> pengairan = [
    "Air Hujan",
    "Irigasi",
  ];

  final currencyFormatter = NumberFormat.currency(locale: 'ID');

  int jumlahPanen = 0;
  String pilihPengairan = "";
  double jumlahZakat = 0;
  String zakat;

  TextEditingController controllerJumlahPanen =
      TextEditingController(text: '');
  TextEditingController controllerPengairan =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ZAKAT HASIL PERTANIAN",
          style:
              TextStyle(fontFamily: 'montserrat', fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(10)),
                  child: DropDownField(
                    hintText: "Jenis Pengairan yang digunakan",
                    hintStyle:
                        TextStyle(fontFamily: 'montserrat', fontSize: 15),
                    labelText: "Pengairan",
                    labelStyle:
                        TextStyle(fontFamily: 'montserrat', fontSize: 20),
                    controller: controllerPengairan,
                    items: pengairan,
                    enabled: true,
                    onValueChanged: (value) {
                      setState(() {
                        pilihPengairan = value;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Jumlah Hasil Panen (Kg)",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                  controller: controllerJumlahPanen,
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 50,
                  width: 200,
                  child: RaisedButton(
                    color: Color(0xFF56A74D),
                    onPressed: () {
                      setState(() {
                        jumlahPanen = int.parse(controllerJumlahPanen.text);
                        if (pilihPengairan == "Air Hujan") {
                          jumlahZakat = jumlahPanen * 10 / 100;
                        } else if (pilihPengairan == "Irigasi") {
                          jumlahZakat = jumlahPanen * 5 / 100;
                        }
                      });
                    },
                    child: Text(
                      'Hitung',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'montserrat',
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                jumlahZakat == 0
                    ? Container()
                    : Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        decoration: BoxDecoration(
                            color: Color(0xFF56A74D),
                            borderRadius: BorderRadius.circular(10)),
                        child: jumlahPanen > 750
                            ? Text(
                                'Zakat harta temuan yang harus anda keluarkan sebesar $jumlahZakat Kg',
                                style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontSize: 15,
                                    color: Colors.white),
                                textAlign: TextAlign.justify,
                              )
                            : Text(
                                'Harta anda belum memenuhi nisab zakat hasil pertanian',
                                style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontSize: 15,
                                    color: Colors.white),
                                textAlign: TextAlign.justify,
                              ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Water {
  String jenis;

  Water(this.jenis);
}
