import 'package:flutter/material.dart';
import 'package:zakats/pages/home.dart';
import 'package:zakats/pages/mustahik.dart';
import 'package:zakats/pages/splashscreen.dart';
import 'package:zakats/pages/zakat_fitrah.dart';
import 'package:zakats/pages/zakat_maal.dart';
import 'package:zakats/pages/zakatpedia.dart';


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

        },
        theme: ThemeData(
          primaryColor: Color(0xFF56A74D),
          primaryColorLight: Colors.amber[400],
          primaryIconTheme:
          Theme.of(context).primaryIconTheme.copyWith(color: Colors.white),
          primaryTextTheme: TextTheme(title: TextStyle(color: Colors.white)),
        ),
      );
  }
}