import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Zakatpedia extends StatefulWidget {
  @override
  _ZakatpediaState createState() => _ZakatpediaState();
}

class _ZakatpediaState extends State<Zakatpedia> {
  var _index = 0;
  Widget _builderStep() => Container(
    margin: EdgeInsets.only(top: 10),
    color: Colors.white,
    child: Stepper(
      steps: [
        Step(
          title: Text("Pengertian Zakat",style: TextStyle(fontFamily: 'montserrat', fontSize: 17),),
          content: Text(
            'Zakat adalah sejumlah harta yang wajib dikeluarkan oleh umat Muslim untuk diberikan kepada golongan yang berhak menerima, seperti fakir miskin dan semacamnya, sesuai dengan yang ditetapkan oleh syariah.',
            style: TextStyle(fontFamily: 'montserrat', fontSize: 17, ),textAlign:TextAlign.justify
          ),
        ),
        Step(
          title: Text("Syarat Wajib Zakat",style: TextStyle(fontFamily: 'montserrat', fontSize: 17),),
          content: Text(
            'Seorang muslim diwajibkan untuk berzakat apabila sudah memenuhi syarat berikut : islam, merdeka, sempurna milik, merupakan hasil usaha yang baik, cukup nishab, cukup haul.',
            style: TextStyle(fontFamily: 'montserrat', fontSize: 17),textAlign:TextAlign.justify
          ),
        ),
        Step(
          title: Text("Hukum Zakat",style: TextStyle(fontFamily: 'montserrat', fontSize: 17),),
          content: Text(
            'Zakat hukumnya wajib tanpa pengecualian bagi setiap umat islam yang mampu.',
            style: TextStyle(fontFamily: 'montserrat', fontSize: 17),textAlign:TextAlign.justify
          ),
        ),
        Step(
          title: Text("Macam-macam Zakat",style: TextStyle(fontFamily: 'montserrat', fontSize: 17),),
          content: Text(
            'Zakat terbagi menjadi dua macam yaitu zakat fitrah yang wajib dikeluarkan muslim menjelang idul fitri dan zakat maal atau zakat harta yang wajib dikeluarkan seorang muslim ssesuai dengan nishab dan haulnya.',
            style: TextStyle(fontFamily: 'montserrat', fontSize: 17),textAlign:TextAlign.justify
          ),
        ),
        Step(
          title: Text("Nisab",style: TextStyle(fontFamily: 'montserrat', fontSize: 17),),
          content: Text(
            'Nisab adalah jumlah batasan kepemilikan seorang muslim selama satu tahun untuk wajib mengeluarkan zakat.',
            style: TextStyle(fontFamily: 'montserrat', fontSize: 17),textAlign:TextAlign.justify
          ),
        ),
        Step(
          title: Text("Haul",style: TextStyle(fontFamily: 'montserrat', fontSize: 17),),
          content: Text(
            'Haul merupakan batas waktu aatau masa dalam sebuah periode tahun hijriah dimana harta itu harus dikeluarkan zakatnya.',
            style: TextStyle(fontFamily: 'montserrat', fontSize: 17),textAlign:TextAlign.justify
          ),
        ),
      ],
      currentStep: _index,
      onStepTapped: (index) {
        setState(() {
          _index = index;
        });
      },
      controlsBuilder: (BuildContext context,
          {VoidCallback onStepContinue, VoidCallback onStepCancel}) =>
          Container(),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("ZAKATPEDIA", style: TextStyle(fontFamily: 'montserrat', fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[_builderStep(), SizedBox(height: 700)],
        ),
      ),
    );
  }
}
