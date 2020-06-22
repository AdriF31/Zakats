import 'package:flutter/material.dart';

class ZakatMaal extends StatefulWidget {
  @override
  _ZakatMaalState createState() => _ZakatMaalState();
}

class _ZakatMaalState extends State<ZakatMaal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ZAKAT MAAL", style: TextStyle(fontFamily: 'montserrat', fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
    );
  }
}
