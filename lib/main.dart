import 'package:flutter/material.dart';
import 'package:zakats/pages/home.dart';
import 'package:zakats/pages/splashscreen.dart';


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