import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

class CatatZakat extends StatelessWidget {
  Future getPost() async {
    var firestore = Firestore.instance;

    QuerySnapshot jenisZakat = await firestore.collection("CatatanZakat")
        .getDocuments();

    return jenisZakat.documents;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catatan Zakatmu", style: TextStyle(fontFamily: 'montserrat', fontWeight: FontWeight.bold),),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add,size: 30,),
            onPressed: (){
              Navigator.pushNamed(context, "/add");
            },
          ),
        ],
        centerTitle: true,
      ),
      body:FutureBuilder(
        future: getPost(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: SpinKitFadingCircle(
                color: Colors.green,
                duration: Duration(seconds: 2),
              ),
            );
          }else{
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (_, index){
                  return Padding(
                    padding: EdgeInsets.fromLTRB(10,10,10,0),
                    child: Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width*0.9,
                      child: Card(
                        color: Colors.green,
                        child: ListTile(
                         subtitle: Text(snapshot.data[index].data['jenisZakat'],style: TextStyle(fontFamily: 'montserrat',fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                          title: Text(DateFormat.yMMMd().add_jm().format(DateTime.parse(snapshot.data[index].data['tanggalZakat'].toDate().toString())),
                          style: TextStyle(fontFamily: 'montserrat',fontSize: 18, color: Colors.white),),
                          trailing: Text(snapshot.data[index].data['jumlahZakat'].toString(),style: TextStyle(fontFamily:'montserrat',
                          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),) ,
                        ),
                      ),
                    ),
                  );
                }
            );

          }
        },
      )
    );
  }
}
