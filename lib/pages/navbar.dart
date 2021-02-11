import 'package:flutter/material.dart';
import 'home.dart';
import 'package:zakats/pages/home.dart';
import 'package:zakats/pages/jadwal_shalat.dart';
import 'package:zakats/utils/icon_app_icons.dart';


class Navigasi extends StatefulWidget {
  @override
  _NavigasiState createState() => _NavigasiState();
}

class _NavigasiState extends State<Navigasi> {
  int currentTab = 0;
  final List<Widget> screens = [
    HomePage(),
    JadwalShalat(),
  ];

  Widget currentScreen = HomePage();
  final PageStorageBucket bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        backgroundColor: Colors.green,
        onPressed: (){
          showAlertDialog(context);
        },
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              color: currentTab==0? Colors.green : Colors.grey[400],
              onPressed: () {
                setState(() {
                  currentScreen = HomePage();
                  currentTab = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(IconApp.muslim),
              color: currentTab==1? Colors.green : Colors.grey[400],
              onPressed: () {
                setState(() {
                  currentScreen = JadwalShalat();
                  currentTab = 1;
                });
              },
            ),
          ],
        ),
        color: Colors.white,
      ),
    );
  }
}
showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Fitur belum tersedia", style: TextStyle(fontFamily: 'montserrat', fontSize: 20, fontWeight: FontWeight.bold),),
    content: Text("Tunggu Update selanjutnya :)", style: TextStyle(fontFamily: 'montserrat', fontSize: 16),),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}