import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HitungEmas extends StatefulWidget {
  @override
  _HitungEmasState createState() => _HitungEmasState();
}

class _HitungEmasState extends State<HitungEmas> {
  final currencyFormatter = NumberFormat.currency(locale: 'en_US');

  int jumlahEmas=0;
  int jumlahEmasDipakai=0;
  int nishab=0;
  String zakat;
  double jumlahZakat=0;
  TextEditingController controllerJumlahEmas = TextEditingController(text: "");
  TextEditingController controllerJumlahEmasDipakai = TextEditingController(text: "");


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
      child: Container(
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: "Jumlah Emas",
                fillColor: Colors.white,
                border: OutlineInputBorder(

                ),
              ),
              controller: controllerJumlahEmas,
            ),
            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Jumlah Emas Yang Dipakai",
                fillColor: Colors.white,
                border: OutlineInputBorder(

                ),
              ),
              controller: controllerJumlahEmasDipakai,
            ),

            SizedBox(height: 40,),
            Container(
              height: 50,
              width: 200,

              child: RaisedButton(
                color: Color(0xFF56A74D),
                onPressed: (){
                  setState(() {
                    jumlahEmas = int.parse(controllerJumlahEmas.text);
                    jumlahEmasDipakai = int.parse(controllerJumlahEmasDipakai.text);
                    nishab = jumlahEmas-jumlahEmasDipakai;
                    jumlahZakat = ((nishab)*837000)*2.5/100;
                    zakat = currencyFormatter.format(jumlahZakat);
                  });
                },
                child: Text('Hitung',style: TextStyle(fontSize: 20,fontFamily: 'montserrat',color: Colors.white),),
              ),
            ),
            SizedBox(height: 20,),
            Container(

              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              decoration: BoxDecoration(
                color: Color(0xFF56A74D),
                borderRadius: BorderRadius.circular(10)
              ),
              child:
              nishab<85? Text("Harta anda belum memenuhi nishab zakat emas, anda tidak wajib mengeluarkan zakat",style: TextStyle(fontFamily: 'montserrat',fontSize: 15,color: Colors.white),)
                  : Text('Anda sudah memenuhi nisab zakat emas, zakat yang harus anda keluarkan sebesar $zakat',style: TextStyle(fontFamily: 'montserrat',fontSize: 15,color: Colors.white),)

            )
          ],
        ),
      ),
    );
  }
}
