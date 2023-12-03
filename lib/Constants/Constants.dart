import 'package:flutter/material.dart';

class Constants {
  static Color headerColor = const Color.fromRGBO(12, 85, 68, 1);
  static Color textColor = const Color.fromRGBO(60, 131, 99, 1);
  static Color itemColor = Colors.white;
  static Color lineColor = const Color.fromRGBO(216, 202, 153, 1);
  static Color backGroundColor = const Color.fromRGBO(247, 250, 243, 1);

  static Color headerColorNight = const Color.fromRGBO(7,40,32, 1);
  static Color textColorNight = const Color.fromRGBO(66,146,112, 1);
  static Color itemColorNight = const Color.fromRGBO(7,40,32, 1);
  static Color lineColorNight = const Color.fromRGBO(213,201,149, 1);
  static Color backGroundColorNight = const Color.fromRGBO(14,27,23, 1);

  static int themeDurationChange = 300;
  static int fontSize = 18;
  static bool isDarkModeEnabled = false;
  static String message = "";
  static String userToken = "";
  static int? statusCode;
}

class ConstUserInformations {
  static String name = "";
  static int? id ;
  static String photoURL = "";
}

MaterialColor getMaterialColor(Color color) {
  final int red = color.red;
  final int green = color.green;
  final int blue = color.blue;

  final Map<int, Color> shades = {
    50: Color.fromRGBO(red, green, blue, .1),
    100: Color.fromRGBO(red, green, blue, .2),
    200: Color.fromRGBO(red, green, blue, .3),
    300: Color.fromRGBO(red, green, blue, .4),
    400: Color.fromRGBO(red, green, blue, .5),
    500: Color.fromRGBO(red, green, blue, .6),
    600: Color.fromRGBO(red, green, blue, .7),
    700: Color.fromRGBO(red, green, blue, .8),
    800: Color.fromRGBO(red, green, blue, .9),
    900: Color.fromRGBO(red, green, blue, 1),
  };

  return MaterialColor(color.value, shades);
}
