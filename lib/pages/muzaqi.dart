import 'package:flutter/material.dart';

class Muzaqi extends StatefulWidget {
  @override
  _MuzaqiState createState() => _MuzaqiState();
}

class _MuzaqiState extends State<Muzaqi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MUZAQI", style: TextStyle(fontFamily: 'montserrat', fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
    );
  }
}
