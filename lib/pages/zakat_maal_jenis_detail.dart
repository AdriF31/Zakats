import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ZakatJenisDetail extends StatefulWidget {
  final DocumentSnapshot post;

  ZakatJenisDetail({this.post});
  @override
  _ZakatJenisDetailState createState() => _ZakatJenisDetailState();
}

class _ZakatJenisDetailState extends State<ZakatJenisDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post.data["title"],style: TextStyle(fontFamily: 'montserrat',fontWeight: FontWeight.bold),),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width,

                  child: Image.network(widget.post.data["img"], width:MediaQuery.of(context).size.width ,height: MediaQuery.of(context).size.height*0.3,fit: BoxFit.fill,)
              )
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  width: MediaQuery.of(context).size.width,

                  child: Text(widget.post.data["content"].replaceAll("\\n", "\n"), textAlign: TextAlign.justify,
                    style: TextStyle(fontFamily: 'montserrat',fontSize: 17),))
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height*0.06,
        child: RaisedButton(
          color: Color(0xFF56A74D),
          onPressed: (){
            Navigator.pushNamed(context, widget.post.data["nextPage"]);
          },
          child: Center(
            child: Text("Hitung Zakatmu",style: TextStyle(fontFamily: 'montserrat',fontWeight: FontWeight.bold,fontSize: 20, color: Colors.white),),
          ),
        ),
      ),
    );
  }
}