import 'package:flutter/material.dart';
import 'package:zakats/pages/hitung_zakat_hasil_tambang.dart';
import 'package:zakats/pages/hitung_zakat_perniagaan.dart';
import 'package:zakats/pages/home.dart';
import 'package:zakats/pages/mustahik.dart';
import 'package:zakats/pages/splashscreen.dart';
import 'package:zakats/pages/zakat_fitrah.dart';
import 'package:zakats/pages/zakat_maal.dart';
import 'package:zakats/pages/zakat_profesi.dart';
import 'package:zakats/pages/zakatpedia.dart';
import 'package:zakats/pages/zakat_emas_perak.dart';
import 'package:zakats/pages/hitung_zakat_harta_temuan.dart';
import 'package:zakats/pages/hitung_zakat_pertanian.dart';
import 'package:zakats/pages/hitung_zakat_hewan_ternak.dart';


void main() {
  return runApp( MyApp ());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Zakat',
        home: SplashScreenPage(),
        routes: <String, WidgetBuilder>{
          "/home" : (BuildContext context) => HomePage(),
          "/zakatpedia" : (BuildContext context) => Zakatpedia(),
          "/zakatfitrah" : (BuildContext context) => ZakatFitrah(),
          "/zakatmaal" : (BuildContext context) => ZakatMaal(),
          "/mustahik" : (BuildContext context) => Mustahik(),
          "/emasperak" : (BuildContext context) => HitungEmasPerak(),
          "/perniagaan" : (BuildContext context) => HitungZakatPerniagaan(),
          "/hartatemuan" : (BuildContext context) => HitungZakatHartaTemuan(),
          "/profesi" : (BuildContext context) => HitungZakatProfesi(),
          "/hasilpertanian" : (BuildContext context) => HitungZakatPertanian(),
          "/hasiltambang" : (BuildContext context) => HitungZakatHasilTambang(),
          "/hewanternak" : (BuildContext context) => HitungZakatHewanTernak(),


        },
        theme: ThemeData(
          primaryColor: Color(0xFF56A74D),

        ),
      );
  }
}