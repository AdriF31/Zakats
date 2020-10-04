import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HitungEmas extends StatefulWidget {
  @override
  _HitungEmasState createState() => _HitungEmasState();
}

class _HitungEmasState extends State<HitungEmas> {
  final currencyFormatter = NumberFormat.currency(locale: 'ID');
  int jumlahEmas=0;
  int jumlahEmasDipakai=0;
  int nishab=0;
  String zakat;
  double jumlahZakat=0;
  TextEditingController controllerJumlahEmas = TextEditingController(text: "");
  TextEditingController controllerJumlahEmasDipakai = TextEditingController(text: "");


  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('HargaEmas').snapshots(),

       builder: (context, snapshot){
         var hargaEmas = snapshot.data.documents[0].data['harga'];
         DateTime tanggal = snapshot.data.documents[0].data['lastUpdated'].toDate();
        String lastUpdate = DateFormat.yMMMd().format(tanggal);
         var emas = currencyFormatter.format(hargaEmas);
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
                        border: Border.all(
                            color: Colors.green
                        )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Harga emas adalah $emas /gram ($lastUpdate)\nnisab untuk zakat emas adalah 85 gram",
                          style: TextStyle(
                              fontSize: 14, fontFamily: "montserrat"
                          ),),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Jumlah Emas (gram)",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(

                      ),
                    ),
                    controller: controllerJumlahEmas,
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Jumlah Emas Yang Dipakai (gram)",
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
                          jumlahZakat = ((nishab)*hargaEmas)*2.5/100;
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
                      nishab<85? Text("Harta anda belum memenuhi nishab zakat emas, anda tidak wajib mengeluarkan zakat",style: TextStyle(fontFamily: 'montserrat',fontSize: 15,color: Colors.white),textAlign: TextAlign.justify,)
                          : Text('Anda sudah memenuhi nisab zakat emas, zakat yang harus anda keluarkan sebesar $zakat',style: TextStyle(fontFamily: 'montserrat',fontSize: 15,color: Colors.white),textAlign: TextAlign.justify,)

                  )
                ],
              ),
            ),
          ),
        );
       }
    );
  }
}
