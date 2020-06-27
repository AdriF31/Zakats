import 'package:flutter/material.dart';
import 'package:zakats/pages/home.dart';
import 'package:zakats/pages/mustahik.dart';
import 'package:zakats/pages/splashscreen.dart';
import 'package:zakats/pages/zakat_fitrah.dart';
import 'package:zakats/pages/zakat_maal.dart';
import 'package:zakats/pages/zakatpedia.dart';
import 'package:zakats/pages/zakat_emas_perak.dart';


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

        },
        theme: ThemeData(
          primaryColor: Color(0xFF56A74D),

        ),
      );
  }
}