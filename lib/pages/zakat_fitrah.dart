import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
      body: StreamBuilder(
        stream: Firestore.instance.collection('ZakatFitrah').snapshots(),
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return Center(
              child: SpinKitFadingCircle(
                color: Colors.green,
                duration: Duration(seconds: 2),
              ),
            );
          }else{
            return ListView(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(snapshot.data.documents[0].data["img"],fit: BoxFit.fill,),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10.0),
                      child: Text(snapshot.data.documents[0].data["content"].replaceAll("\\n", "\n"),textAlign: TextAlign.justify,
                        style: TextStyle(fontFamily: 'montserrat',fontSize: 17),),
                    ),
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
