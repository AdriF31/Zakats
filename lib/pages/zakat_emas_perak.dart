import 'package:flutter/material.dart';
import 'package:zakats/pages/hitung_emas.dart';
import 'package:zakats/pages/hitung_perak.dart';

class HitungEmasPerak extends StatefulWidget {
  @override
  _HitungEmasPerakState createState() => _HitungEmasPerakState();
}

class _HitungEmasPerakState extends State<HitungEmasPerak> with SingleTickerProviderStateMixin{
  TabController controller;
  @override
  void initState() {
    controller = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ZAKAT MAAL", style: TextStyle(fontFamily: 'montserrat', fontWeight: FontWeight.bold),),
        centerTitle: true,
        bottom: TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(text: 'EMAS',),
            Tab(text: 'PERAK',),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
         HitungEmas(),
         HitungPerak()
        ],
      ),
    );
  }
}
