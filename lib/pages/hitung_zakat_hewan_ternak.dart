import 'dart:math';

import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HitungZakatHewanTernak extends StatefulWidget {
  @override
  _HitungZakatHewanTernakState createState() => _HitungZakatHewanTernakState();
}

class _HitungZakatHewanTernakState extends State<HitungZakatHewanTernak> {

  List<String> Hewan = [
    "Kambing",
    "Domba",
    "Sapi",
    "Kerbau",
    "Unta",
  ];

  final currencyFormatter = NumberFormat.currency(locale: 'ID');

  int jumlahHewan=0;
  int usia;
  String pilihHewan = "";
  String hewan;
  int jumlahZakat=0;
  int nisab=0;
  String zakat;

  TextEditingController controllerJumlahHewan = new TextEditingController(text: '');
  TextEditingController controllerHewan = new TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ZAKAT HEWAN TERNAK", style: TextStyle(fontFamily: 'montserrat', fontWeight: FontWeight.bold),),
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
                    hintText: "Pilih Jenis Hewan",
                    hintStyle: TextStyle(fontFamily: 'montserrat', fontSize: 15),
                    labelText: "Hewan",
                    labelStyle: TextStyle(fontFamily: 'montserrat', fontSize: 20),
                    controller: controllerHewan,
                    itemsVisibleInDropdown: 5,
                    items: Hewan ,
                    enabled: true,
                    onValueChanged: (value){
                      setState(() {
                        pilihHewan = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 40,),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Jumlah Hewan",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(

                    ),
                  ),
                  controller: controllerJumlahHewan,
                ),
                SizedBox(height: 40,),
                Container(
                  height: 50,
                  width: 200,

                  child: RaisedButton(
                    color: Color(0xFF56A74D),
                    onPressed: (){
                      setState(() {
                        jumlahHewan = int.parse(controllerJumlahHewan.text);
                        if(pilihHewan=="Kambing" || pilihHewan=="Domba"){
                          nisab=40;
                          if(jumlahHewan<40){
                            jumlahZakat=0;
                          }
                          else if(jumlahHewan>=40 && jumlahHewan<121){
                            jumlahZakat=1;
                            hewan="Kambing 1 tahun";
                          }
                          else if(jumlahHewan>=121 && jumlahHewan<201){
                            jumlahZakat=2;
                            hewan="Kambing 1 tahun";
                          }
                          else if(jumlahHewan>=201 && jumlahHewan<301){
                            jumlahZakat=3;
                            hewan="Kambing 1 tahun";
                          }
                          else if(jumlahHewan>=301 && jumlahHewan<401){
                            jumlahZakat=4;
                            hewan="Kambing 1 tahun";
                          }
                          else if(jumlahHewan>=401 && jumlahHewan<501){
                            jumlahZakat=5;
                            hewan="Kambing 1 tahun";
                          }

                        }
                        if(pilihHewan=="Domba"){
                          nisab=40;
                          if(jumlahHewan<40){
                            jumlahZakat=0;
                          }
                          else if(jumlahHewan>=40 && jumlahHewan<121){
                            jumlahZakat=1;
                            hewan="Domba 2 tahun";
                          }
                          else if(jumlahHewan>=121 && jumlahHewan<201){
                            jumlahZakat=2;
                            hewan="Domba 2 tahun";
                          }
                          else if(jumlahHewan>=201 && jumlahHewan<301){
                            jumlahZakat=3;
                            hewan="Domba 2 tahun";
                          }
                          else if(jumlahHewan>=301 && jumlahHewan<401){
                            jumlahZakat=4;
                            hewan="Domba 2 tahun";
                          }
                          else if(jumlahHewan>=401 && jumlahHewan<501){
                            jumlahZakat=5;
                            hewan="Domba 2 tahun";
                          }

                        }
                        else if(pilihHewan=="Sapi"){
                          nisab=30;
                          if(jumlahHewan<30){
                            jumlahZakat=0;
                          }
                          else if(jumlahHewan>=30 && jumlahHewan<40){
                            jumlahZakat=1;
                            hewan="Anak Sapi 1 tahun";
                          }
                          else if(jumlahHewan>=40 && jumlahHewan<60){
                            jumlahZakat=1;
                            hewan="Anak Sapi 2 tahun";
                          }
                          else if(jumlahHewan>=60 && jumlahHewan<80){
                            jumlahZakat=2;
                            hewan="Anak Sapi 2 tahun";
                          }
                        }
                        else if(pilihHewan=="Kerbau"){
                          nisab=30;
                          if(jumlahHewan<30){
                            jumlahZakat=0;
                          }
                          else if(jumlahHewan>=30 && jumlahHewan<40){
                            jumlahZakat=1;
                            hewan="Anak Kerbau 1 tahun";
                          }
                          else if(jumlahHewan>=40 && jumlahHewan<60){
                            jumlahZakat=1;
                            hewan="Anak Kerbau 2 tahun";
                          }
                          else if(jumlahHewan>=60 && jumlahHewan<80){
                            jumlahZakat=2;
                            hewan="Anak Kerbau 2 tahun";
                          }
                        }
                        else if(pilihHewan=="Unta"){
                          nisab=5;
                          if(jumlahHewan<5){
                            jumlahZakat=0;
                          }
                          else if(jumlahHewan>=5 && jumlahHewan<10){
                            jumlahZakat=1;
                            hewan="Kambing (2 tahun) atau $jumlahZakat ekor Domba (1 tahun)";
                          }
                          else if(jumlahHewan>=10 && jumlahHewan<15){
                            jumlahZakat=2;
                            hewan="Kambing (2 tahun) atau $jumlahZakat ekor Domba (1 tahun)";
                          }
                          else if(jumlahHewan>=10 && jumlahHewan<15){
                            jumlahZakat=2;
                            hewan="Kambing (2 tahun) atau $jumlahZakat ekor Domba (1 tahun)";
                          }
                          else if(jumlahHewan>=25){
                            jumlahZakat=3;
                            hewan="Unta Betina usia 1 tahun";
                          }
                        }




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
                    child: jumlahHewan>=nisab? Text('Zakat Hewan Ternak yang harus anda keluarkan adalah sebanyak $jumlahZakat ekor $hewan',style: TextStyle(fontFamily: 'montserrat',fontSize: 15,color: Colors.white),textAlign: TextAlign.justify,)
                        : Text('Harta anda belum memenuhi nisab zakat Hewan Ternak',style: TextStyle(fontFamily: 'montserrat',fontSize: 15,color: Colors.white),textAlign: TextAlign.justify,)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}