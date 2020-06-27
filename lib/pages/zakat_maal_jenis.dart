import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ZakatJenis extends StatefulWidget {
  @override
  _ZakatJenisState createState() => _ZakatJenisState();
}

class _ZakatJenisState extends State<ZakatJenis> {
  Future getPost() async {
  var firestore = Firestore.instance;

  QuerySnapshot jenisZakat = await firestore.collection("JenisZakatMaal").getDocuments();

  return jenisZakat.documents;
}

navigateToDetail(DocumentSnapshot post){
    Navigator.push(context, MaterialPageRoute(builder: (context) => ZakatJenisDetail(post: post,)));

}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getPost(),
          builder: (_, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child: Text('LOADING'),
          );
        }
        else{
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (_, index){
              return Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: GestureDetector(
                  onTap: () => navigateToDetail(snapshot.data[index]),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(88, 149, 84, 1),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: ListTile(
                      title: Text(snapshot.data[index].data["title"],
                      style: TextStyle(fontFamily: 'montserrat',fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}


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
        title: Text(widget.post.data["title"]),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width,

                  child: Image.network(widget.post.data["img"],)
              )
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                width: MediaQuery.of(context).size.width,

                  child: Text(widget.post.data["content"], textAlign: TextAlign.justify,
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

