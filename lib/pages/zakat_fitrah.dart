import 'package:flutter/material.dart';

class ZakatFitrah extends StatefulWidget {
  @override
  _ZakatFitrahState createState() => _ZakatFitrahState();
}

class _ZakatFitrahState extends State<ZakatFitrah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ZAKAT FITRAH", style: TextStyle(fontFamily: 'montserrat', fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
    );
  }
}
