import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HitungPerak extends StatefulWidget {
  @override
  _HitungPerakState createState() => _HitungPerakState();
}

class _HitungPerakState extends State<HitungPerak> {
  final currencyFormatter = NumberFormat.currency(locale: 'ID');
  int jumlahPerak = 0;
  int jumlahPerakDipakai = 0;
  int nishab = 0;
  String zakat;
  double jumlahZakat = 0;
  TextEditingController controllerJumlahPerak = TextEditingController(text: "");
  TextEditingController controllerJumlahPerakDipakai =
      TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Firestore.instance.collection('HargaPerak').snapshots(),
        builder: (context, snapshot) {
          var hargaPerak = snapshot.data.documents[0].data['harga'];
          DateTime tanggal =
              snapshot.data.documents[0].data['lastUpdate'].toDate();
          String lastUpdate = DateFormat.yMMMd().format(tanggal);
          var perak = currencyFormatter.format(hargaPerak);
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.green)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Harga perak adalah $perak /gram ($lastUpdate)\nnisab untuk zakat Perak adalah 595 gram\nzakat yang dikeluarkan sebersar 2,5%",
                            style: TextStyle(
                                fontSize: 14, fontFamily: "montserrat"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Jumlah Perak (gram)",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                      controller: controllerJumlahPerak,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Jumlah Perak Yang Dipakai (gram)",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                      controller: controllerJumlahPerakDipakai,
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
                            jumlahPerak = int.parse(controllerJumlahPerak.text);
                            jumlahPerakDipakai =
                                int.parse(controllerJumlahPerakDipakai.text);
                            nishab = jumlahPerak - jumlahPerakDipakai;
                            jumlahZakat = ((nishab) * hargaPerak) * 2.5 / 100;
                            zakat = currencyFormatter.format(jumlahZakat);
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
                    nishab == 0
                        ? Container()
                        : Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            decoration: BoxDecoration(
                                color: Color(0xFF56A74D),
                                borderRadius: BorderRadius.circular(10)),
                            child: nishab < 595
                                ? Text(
                                    "Harta anda belum memenuhi nishab zakat perak, anda tidak wajib mengeluarkan zakat perak",
                                    style: TextStyle(
                                        fontFamily: 'montserrat',
                                        fontSize: 15,
                                        color: Colors.white),
                                    textAlign: TextAlign.justify,
                                  )
                                : Text(
                                    'Anda sudah memenuhi nisab zakat perak, zakat yang harus anda keluarkan sebesar $zakat',
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
          );
        });
  }
}
