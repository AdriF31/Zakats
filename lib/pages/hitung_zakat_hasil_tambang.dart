import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HitungZakatHasilTambang extends StatefulWidget {
  @override
  _HitungZakatHasilTambangState createState() => _HitungZakatHasilTambangState();
}

class _HitungZakatHasilTambangState extends State<HitungZakatHasilTambang> {

  List<String> Tambang = [
    "Emas",
    "Perak",
    "Batuan",
    "Minyak",
    "Lainnya",
  ];

  final currencyFormatter = NumberFormat.currency(locale: 'ID');

  int jumlahTambang=0;
  String pilihTambang = "";
  double jumlahZakat=0;
  double nisab=0;
  String zakat;

  TextEditingController controllerJumlahTambang = new TextEditingController(text: '');
  TextEditingController controllerTambang = new TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ZAKAT HASIL TAMBANG", style: TextStyle(fontFamily: 'montserrat', fontWeight: FontWeight.bold),),
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
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: DropDownField(
                    hintText: "Pilih Jenis Tambang",
                    hintStyle: TextStyle(fontFamily: 'montserrat', fontSize: 15),
                    labelText: "Tambang",
                    labelStyle: TextStyle(fontFamily: 'montserrat', fontSize: 20),
                    controller: controllerTambang,
                    itemsVisibleInDropdown: 5,
                    items: Tambang ,
                    enabled: true,
                    onValueChanged: (value){
                      setState(() {
                        pilihTambang = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 40,),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Jumlah Hasil Tambang (IDR)",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(

                    ),
                  ),
                  controller: controllerJumlahTambang,
                ),
                SizedBox(height: 40,),
                Container(
                  height: 50,
                  width: 200,

                  child: RaisedButton(
                    color: Color(0xFF56A74D),
                    onPressed: (){
                      setState(() {
                        jumlahTambang = int.parse(controllerJumlahTambang.text);
                        if(pilihTambang=="Emas" || pilihTambang=="Batuan" || pilihTambang=="Minyak" || pilihTambang=="Lainnya"){
                          jumlahZakat=jumlahTambang*2.5/100;
                          nisab=91.92*837000;
                        }else if(pilihTambang=="Perak"){
                          jumlahZakat=jumlahTambang*2.5/100;
                          nisab=642.0*12000;
                        }
                        zakat=currencyFormatter.format(jumlahZakat);

                      });
                    },
                    child: Text('Hitung',style: TextStyle(fontSize: 20,fontFamily: 'montserrat',color: Colors.white),),
                  ),
                ),
                SizedBox(height: 20,),
                jumlahZakat==0? Container() :
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    decoration: BoxDecoration(
                        color: Color(0xFF56A74D),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: jumlahTambang>nisab? Text('Zakat Hasil Tambang yang harus anda keluarkan sebesar $zakat',style: TextStyle(fontFamily: 'montserrat',fontSize: 15,color: Colors.white),textAlign: TextAlign.justify,)
                        : Text('Harta anda belum memenuhi nisab zakat Hasil Tambang',style: TextStyle(fontFamily: 'montserrat',fontSize: 15,color: Colors.white),textAlign: TextAlign.justify,)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}