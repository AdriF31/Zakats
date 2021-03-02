import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HitungZakatHartaTemuan extends StatefulWidget {
  @override
  _HitungZakatHartaTemuanState createState() => _HitungZakatHartaTemuanState();
}

class _HitungZakatHartaTemuanState extends State<HitungZakatHartaTemuan> {
  final currencyFormatter = NumberFormat.currency(locale: 'ID');

  int jumlahHartaTemuan = 0;
  double jumlahZakat = 0;
  String zakat;

  TextEditingController controllerJumlahHartaTemuan =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ZAKAT HARTA TEMUAN",
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
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.green)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "nisab zakat harta temuan adalah 1/4 dari harta tersebut",
                        style:
                            TextStyle(fontSize: 15, fontFamily: "montserrat"),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Jumlah Harta Temuan (IDR)",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                  controller: controllerJumlahHartaTemuan,
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
                        jumlahHartaTemuan =
                            int.parse(controllerJumlahHartaTemuan.text);
                        jumlahZakat = jumlahHartaTemuan / 5;
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
                jumlahHartaTemuan == 0
                    ? Container()
                    : Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        decoration: BoxDecoration(
                            color: Color(0xFF56A74D),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Zakat harta temuan yang harus anda keluarkan sebesar $zakat',
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
