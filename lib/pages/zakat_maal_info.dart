import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ZakatMaalInfo extends StatefulWidget {
  @override
  _ZakatMaalInfoState createState() => _ZakatMaalInfoState();
}

class _ZakatMaalInfoState extends State<ZakatMaalInfo> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Firestore.instance.collection('ZakatMaal').snapshots(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: SpinKitFadingCircle(
                color: Colors.green,
                duration: Duration(seconds: 2),
              ),
            );
          }else{
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(snapshot.data.documents[0].data["content"].replaceAll("\\n", "\n"),textAlign: TextAlign.justify,
                style: TextStyle(fontFamily: 'montserrat',fontSize: 17),),
            );
          }
        },
      );
  }
}
