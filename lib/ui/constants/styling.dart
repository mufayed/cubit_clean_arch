import 'package:flutter/material.dart';

class Styling {
  Styling._();

  static Color primaryColor = const Color(0xff4F198B);
  static Color accentColor = const Color(0xff9D56EB);
  static Color backgroundColor = const Color(0xffffffff);

  static ThemeData appTheme = ThemeData(
      backgroundColor: backgroundColor,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      fontFamily: 'Europa');

  static TextStyle regularFont(Color color, double fontSize) {
    return TextStyle(
        fontWeight: FontWeight.normal, fontSize: fontSize, color: color);
  }

  static TextStyle simiBoldFont(Color color, double fontSize) {
    return TextStyle(
        fontWeight: FontWeight.w600, fontSize: fontSize, color: color);
  }

  static TextStyle boldFont(Color color, double fontSize) {
    return TextStyle(
        fontWeight: FontWeight.bold, fontSize: fontSize, color: color);
  }
}
