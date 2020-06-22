import 'package:flutter/material.dart';

class SizeConfig{
    static MediaQueryData _mediaQueryData;
    static double screenWidth;
    static double screenHeight;
    static double width;
    static double height;

    void init (BuildContext context)
    {
      _mediaQueryData = MediaQuery.of(context);
      screenWidth = _mediaQueryData.size.width;
      screenHeight = _mediaQueryData.size.height;
      width = screenWidth / 100;
      height = screenHeight / 100;
    }
}