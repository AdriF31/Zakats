import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HitungZakatPerniagaan extends StatefulWidget {
  @override
  _HitungZakatPerniagaanState createState() => _HitungZakatPerniagaanState();
}

class _HitungZakatPerniagaanState extends State<HitungZakatPerniagaan> {

  final currencyFormatter = NumberFormat.currency(locale: 'ID');

  int jumlahUang=0;
  int jumlahHutang=0;
  int nishab=0;
  double jumlahZakat=0;
  String zakat;

  TextEditingController controllerJumlahUang = new TextEditingController(text: '');
  TextEditingController controllerJumlahHutang = new TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ZAKAT PERNIAGAAN", style: TextStyle(fontFamily: 'montserrat', fontWeight: FontWeight.bold),),
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
                      border: Border.all(
                          color: Colors.green
                      )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("nisab untuk zakat perniagaan yaitu sebesar 85 gram emas\nzakat yang dikeluarkan adalah sebesar 2,5%",
                        style: TextStyle(
                            fontSize: 15, fontFamily: "montserrat"
                        ),),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Jumlah Aset Lancar Usaha (IDR)",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(

                    ),
                  ),
                  controller: controllerJumlahUang,
                ),

                SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Jumlah Hutang Jangka Pendek (IDR)",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(

                    ),
                  ),
                  controller: controllerJumlahHutang,
                ),

                SizedBox(height: 40,),
                Container(
                  height: 50,
                  width: 200,

                  child: RaisedButton(
                    color: Color(0xFF56A74D),
                    onPressed: (){
                      setState(() {
                        jumlahUang = int.parse(controllerJumlahUang.text);
                        jumlahHutang = int.parse(controllerJumlahHutang.text);
                        nishab = jumlahUang-jumlahHutang;
                        jumlahZakat = (nishab)*2.5/100;
                        zakat = currencyFormatter.format(jumlahZakat);
                      });
                    },
                    child: Text('Hitung',style: TextStyle(fontSize: 20,fontFamily: 'montserrat',color: Colors.white),),
                  ),
                ),
                SizedBox(height: 20,),
                nishab==0? Container() :
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    decoration: BoxDecoration(
                        color: Color(0xFF56A74D),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child:
                    nishab<85*837000? Text("Harta anda belum memenuhi nisab zakat perniagaan, anda tidak wajib mengeluarkan zakat",style:TextStyle(fontFamily: 'montserrat',fontSize: 15,color: Colors.white),textAlign: TextAlign.justify,)
                        : Text('Anda sudah memenuhi nisab zakat perniagaan, zakat yang harus anda keluarkan sebesar $zakat',style: TextStyle(fontFamily: 'montserrat',fontSize: 15,color: Colors.white),textAlign: TextAlign.justify,)

                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
