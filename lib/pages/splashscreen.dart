import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:zakats/utils/screenutil.dart';


class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
            () => Navigator.of(context).pushReplacementNamed('/navbar'));
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      allowFontScaling: true,
    )..init(context);
    return Scaffold(
        body: Container(
          color: Color.fromRGBO(156, 241, 150, 1),
          child : Center(
            child: Container(
              child: Image(
                image: AssetImage("assets/img/logo.png"),
                width: 150,
                height: 150,
              ),
            ),
          ),
        )
    );
  }
}
