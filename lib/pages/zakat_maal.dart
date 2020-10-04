import 'package:flutter/material.dart';
import 'package:zakats/pages/zakat_maal_info.dart';
import 'package:zakats/pages/zakat_maal_jenis.dart';

class ZakatMaal extends StatefulWidget {
  @override
  _ZakatMaalState createState() => _ZakatMaalState();
}

class _ZakatMaalState extends State<ZakatMaal> with SingleTickerProviderStateMixin {
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
            Tab(icon: Icon(Icons.info),text: 'Zalat Maal',),
            Tab(icon: Icon(Icons.menu),text: 'Jenis Zakat Maal',),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          ZakatMaalInfo(),
          ZakatJenis(),
        ],
      ),
    );
  }
}
