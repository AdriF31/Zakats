import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HitungPerak extends StatefulWidget {
  @override
  _HitungPerakState createState() => _HitungPerakState();
}

class _HitungPerakState extends State<HitungPerak> {
  final currencyFormatter = NumberFormat.currency(locale: 'ID');

  int jumlahPerak=0;
  int jumlahPerakDipakai=0;
  int nishab=0;
  String zakat;
  double jumlahZakat=0;
  TextEditingController controllerJumlahPerak = TextEditingController(text: "");
  TextEditingController controllerJumlahPerakDipakai = TextEditingController(text: "");


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
        child: Container(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Jumlah Perak (gram)",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(

                  ),
                ),
                controller: controllerJumlahPerak,
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Jumlah Perak Yang Dipakai (gram)",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(

                  ),
                ),
                controller: controllerJumlahPerakDipakai,
              ),

              SizedBox(height: 40,),
              Container(
                height: 50,
                width: 200,

                child: RaisedButton(
                  color: Color(0xFF56A74D),
                  onPressed: (){
                    setState(() {
                      jumlahPerak = int.parse(controllerJumlahPerak.text);
                      jumlahPerakDipakai = int.parse(controllerJumlahPerakDipakai.text);
                      nishab = jumlahPerak-jumlahPerakDipakai;
                      jumlahZakat = ((nishab)*12000)*2.5/100;
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
                  nishab<85? Text("Harta anda belum memenuhi nisab zakat emas, anda tidak wajib mengeluarkan zakat",style: TextStyle(fontFamily: 'montserrat',fontSize: 15,color: Colors.white),textAlign: TextAlign.justify,)
                      : Text('Anda sudah memenuhi nisab zakat emas, zakat yang harus anda keluarkan sebesar $zakat',style: TextStyle(fontFamily: 'montserrat',fontSize: 15,color: Colors.white),textAlign: TextAlign.justify,)

              )
            ],
          ),
        ),
      ),
    );
  }
}
