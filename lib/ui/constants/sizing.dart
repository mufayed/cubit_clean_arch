import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Sizing {
  // static double screenWidth = 0;
  // static double screenHeight = 0;
  // static bool isPortrait = true;
  static double dpi = 0;

  init(double _dpi) {
    dpi = _dpi;
    // if (orientation == Orientation.portrait) {
    //   screenWidth = constraints.maxWidth;
    //   screenHeight = constraints.maxHeight;
    //   isPortrait = true;
    // } else {
    //   screenWidth = constraints.maxHeight;
    //   screenHeight = constraints.maxWidth;
    //   isPortrait = false;
    // }
    if (kDebugMode) {
      // print('width $screenWidth');
      // print('Height $screenHeight');
      print('DPI $dpi');
      // print('isPortrait $isPortrait');
    }
  }

  static double pixelsToSp(double px) {
    return px * 0.75;
  }
}
