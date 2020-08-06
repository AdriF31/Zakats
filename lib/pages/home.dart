import 'package:flutter/cupertino.dart';
/*import 'dart:async';
import 'package:intl/intl.dart';*/
import 'package:flutter/material.dart';
import 'package:draggable_fab/draggable_fab.dart';
import 'package:zakats/utils/icon_app_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /*String _currentTime;
  DateTime _currentDate = new DateTime.now();


  @override
  void initState() {
    // TODO: implement initState
    _currentTime = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    /*String _formattedDate = new DateFormat.yMMMMEEEEd().format(_currentDate);
      String _formattotime = new DateFormat.jm().format(_currentDate);*/
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  ClipPath(
                    clipper: MyClipper(),
                    child: Container(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(156, 241, 150, 1),
                      ),
                     child: Image(
                       image: AssetImage("assets/img/zakat2.png"),
                       fit: BoxFit.fill,
                     )

                      /*Padding(
                       padding: const EdgeInsets.all(15.0),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: <Widget>[
                           Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: <Widget>[
                               Text('$_formattedDate',style: TextStyle(fontFamily: 'montserrat', fontWeight: FontWeight.bold, color: Colors.black, fontSize: MediaQuery.of(context).size.width*0.07),),
                             ],
                           ),
                           Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: <Widget>[
                               Text('$_currentTime',style: TextStyle(fontFamily: 'montserrat', fontWeight: FontWeight.bold, color: Colors.black, fontSize: MediaQuery.of(context).size.width*0.08),),
                             ],
                           ),

                         ],
                       ),
                     ),*/

                    ),
                  )
                ],
              ),
              SizedBox(height: 20,),
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, "/zakatpedia");
                        },
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromRGBO(179, 221, 165, 1),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image(
                                image: AssetImage("assets/img/logo.png"),
                                width: 100,
                                height: 100,
                              ),
                              SizedBox(height: 10,),
                              Text(
                                "ZAKATPEDIA",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'montserrat',
                                  fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, "/zakatfitrah");
                        },
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromRGBO(179, 221, 165, 1),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image(
                                image: AssetImage("assets/img/zakatfitrah.png"),
                                width: 100,
                                height: 100,
                              ),
                              SizedBox(height: 10,),
                              Text(
                                "ZAKAT FITRAH",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'montserrat',
                                    fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, "/mustahik");
                        },
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromRGBO(179, 221, 165, 1),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image(
                                image: AssetImage("assets/img/muslim.png"),
                                width: 100,
                                height: 100,
                              ),
                              SizedBox(height: 10,),
                              Text(
                                "MUSTAHIK",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'montserrat',
                                    fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, "/zakatmaal");
                        },
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromRGBO(179, 221, 165, 1),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image(
                                image: AssetImage("assets/img/money.png"),
                                width: 100,
                                height: 100,
                              ),
                              SizedBox(height: 10,),
                              Text(
                                "ZAKAT MAAL",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'montserrat',
                                    fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: DraggableFab(
        child: Container(
          width: 80,
          height: 80,
          child: FloatingActionButton(
            backgroundColor: Color.fromRGBO(179, 221, 165, 1),
            onPressed: (){
              Navigator.pushNamed(context, "/jadwalsholat");
            },
            child: Icon(IconApp.muslim,size: 60,color: Colors.black,),
          ),
        ),
      ),
    );
  }
  //ini buat ngambil waktu yang udah diubah :)
 /*void _getTime(){
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState((){
      _currentTime = formattedDateTime;
    });
  }

  //ini buat ngubah format waktunya yaa
  String _formatDateTime(DateTime dateTime){
    return DateFormat('HH:mm').format(dateTime);
  }*/
}




class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    var path = Path();
    path.lineTo(0, size.height-40);
    path.quadraticBezierTo(size.width/4, size.height, size.width/2, size.height);
    path.quadraticBezierTo(size.width - (size.width/4), size.height, size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


