
import 'package:flutter/material.dart';

class ResponsiveLayout {

  BuildContext context;
  var width;
  var height;

  ResponsiveLayout(this.context){
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }

  double miniPadding = 4;

  double smallPadding = 8;

  double mediumPadding = 16;

  double largePadding = 32;

  double _horizontalWidth(double small,double medium, double large){

    if(width < 768 && width > 320) {
      return medium;
    } else if(width >= 768) {
      return large;
    } else if(width <= 320) {
      return small;
    }

  }

  double containerWidth() {
    return _horizontalWidth(width * 95, width * 90, width * 90);
  }

}