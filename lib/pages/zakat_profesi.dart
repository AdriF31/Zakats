import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HitungZakatProfesi extends StatefulWidget {
  @override
  _HitungZakatProfesiState createState() => _HitungZakatProfesiState();
}

class _HitungZakatProfesiState extends State<HitungZakatProfesi> {
  final currencyFormatter = NumberFormat.currency(locale: 'ID');

  int penghasilan = 0;
  int pengeluaran = 0;
  int nishab = 0;
  double jumlahZakat = 0;
  String zakat;

  TextEditingController controllerPengeluaran =
      TextEditingController(text: '');
  TextEditingController controllerPenghasilan =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ZAKAT PROFESI",
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
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Penghasilan Perbulan (IDR)",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                  controller: controllerPenghasilan,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Pengeluaran Perbulan (IDR)",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                  controller: controllerPengeluaran,
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
                        penghasilan = int.parse(controllerPenghasilan.text);
                        pengeluaran = int.parse(controllerPengeluaran.text);
                        nishab = penghasilan - pengeluaran;
                        jumlahZakat = (nishab) * 2.5 / 100;
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
                        child: nishab < 520 * 10000
                            ? Text(
                                "Harta anda belum memenuhi nisab zakat profesi, anda tidak wajib mengeluarkan zakat",
                                style: TextStyle(
                                    fontFamily: 'montserrat',
                                    fontSize: 15,
                                    color: Colors.white),
                                textAlign: TextAlign.justify,
                              )
                            : Text(
                                'Anda sudah memenuhi nisab zakat profesi, zakat yang harus anda keluarkan sebesar $zakat',
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
