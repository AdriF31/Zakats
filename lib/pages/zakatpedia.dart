import 'package:flutter/material.dart';

class Zakatpedia extends StatefulWidget {
  @override
  _ZakatpediaState createState() => _ZakatpediaState();
}

class _ZakatpediaState extends State<Zakatpedia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ZAKATPEDIA", style: TextStyle(fontFamily: 'montserrat', fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
    );
  }
}
