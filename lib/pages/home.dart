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
      body: CustomPaint(
        painter: GreenPainter(),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(

                  height: 300,

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
                      onTap: (){},
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
                      onTap: (){},
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
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){},
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
                      onTap: (){},
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
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class GreenPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size){
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    paint.color = Colors.white;
    canvas.drawPath(mainBackground, paint);

    Path ovalPath = Path();
    ovalPath.moveTo(0,height*0.3);
    ovalPath.quadraticBezierTo(width*0.5, height*0.3, width *0.5, height*0.36);

    paint.color = Color.fromRGBO(156, 241, 150, 1);
    canvas.drawPath(ovalPath, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate){
    return oldDelegate != this;
  }
}

