import 'package:flutter/material.dart';

class Mustahik extends StatefulWidget {
  @override
  _MustahikState createState() => _MustahikState();
}

class _MustahikState extends State<Mustahik> {
  var _index = 0;

  Widget _builderStep() => Container(
        margin: EdgeInsets.only(top: 10),
        color: Colors.white,
        child: Stepper(
          steps: const <Step>[
            Step(
              title: Text(
                "Fakir",
                style: TextStyle(fontFamily: 'montserrat', fontSize: 17),
              ),
              content: Text(
                  'Orang yang tidak mempunyai harta dan usaha untuk mencukupi kebutuhan hidupnya sehari-hari.',
                  style: TextStyle(fontFamily: 'montserrat', fontSize: 17),
                  textAlign: TextAlign.justify),
            ),
            Step(
              title: Text(
                "Miskin",
                style: TextStyle(fontFamily: 'montserrat', fontSize: 17),
              ),
              content: Text(
                  'Orang yang tidak cukup penghidupannya dan dalam keadaan serbakekurangan.',
                  style: TextStyle(fontFamily: 'montserrat', fontSize: 17),
                  textAlign: TextAlign.justify),
            ),
            Step(
              title: Text(
                "Amil",
                style: TextStyle(fontFamily: 'montserrat', fontSize: 17),
              ),
              content: Text(
                  'Orang yang mengurusi proses terselenggaranya zakat(pengurus zakat.',
                  style: TextStyle(fontFamily: 'montserrat', fontSize: 17),
                  textAlign: TextAlign.justify),
            ),
            Step(
              title: Text(
                "Mualaf",
                style: TextStyle(fontFamily: 'montserrat', fontSize: 17),
              ),
              content: Text(
                  'orang yang ada harapan untuk masuk Islam atau orang yang baru masuk Islam yang kemungkinan imannya masih lemah. Mereka ini juga termasuk yang berhak menerima zakat.',
                  style: TextStyle(fontFamily: 'montserrat', fontSize: 17),
                  textAlign: TextAlign.justify),
            ),
            Step(
              title: Text(
                "Riqab",
                style: TextStyle(fontFamily: 'montserrat', fontSize: 17),
              ),
              content: Text(
                  'Riqab adalah memerdekakan budak.   Orang yang menjadi budak dapat menggunakan bantuan zakat untuk memerdekakan diri. Saat ini perbudakan sudah dilarang sehingga tidak ada lagi budak.',
                  style: TextStyle(fontFamily: 'montserrat', fontSize: 17),
                  textAlign: TextAlign.justify),
            ),
            Step(
              title: Text(
                "Gharim",
                style: TextStyle(fontFamily: 'montserrat', fontSize: 17),
              ),
              content: Text(
                  'Gharimin diartikan sebagai orang yang terlilit hutang. Salah satu golongan penerima zakat ini dikategorikan sebagai penerima zakat yang wajib kita berikan yang terbagi menjadi 2 jenis, yaitu:Ghârim limaslahati nafsihi (Terlilit hutang demi kemaslahatan atau kebutuhan dirinya) dan Ghârim li ishlâhi dzatil bain ( Terlilit hutang karena mendamaikan manusia, qabilah atau suku)',
                  style: TextStyle(fontFamily: 'montserrat', fontSize: 17),
                  textAlign: TextAlign.justify),
            ),
            Step(
              title: Text(
                "fisabilillah",
                style: TextStyle(fontFamily: 'montserrat', fontSize: 17),
              ),
              content: Text(
                  'orang yang berjuang untuk kepentingan Islam dan para muslimin. Dalam hal ini, pada masa modern, sabilillah tidak dapat dimaknai hanya semata-mata sebagai orang yang berperang secara fisik, tetapi juga mereka yang mengerjakan kebajikan untuk kemaslahatan umat',
                  style: TextStyle(fontFamily: 'montserrat', fontSize: 17),
                  textAlign: TextAlign.justify),
            ),
            Step(
              title: Text(
                "Ibnu Sabil",
                style: TextStyle(fontFamily: 'montserrat', fontSize: 17),
              ),
              content: Text(
                'orang yang sedang dalam perjalanan dan bukan yang menderita dalam perjalanan dengan tujuan bermaksiat.',
                style: TextStyle(fontFamily: 'montserrat', fontSize: 17),
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
        title: Text(
          "MUSTAHIK",
          style:
              TextStyle(fontFamily: 'montserrat', fontWeight: FontWeight.bold),
        ),
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
