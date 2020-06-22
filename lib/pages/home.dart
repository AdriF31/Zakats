import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(156, 241, 150, 1)
                    ),

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
                        Navigator.pushNamed(context, "/muzaqi");
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
                              "MUZAQI",
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
    );
  }
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


