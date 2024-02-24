import 'package:flutter/material.dart';

class Constants {
  static Color headerColor = const Color.fromRGBO(227, 227, 227, 1);
  static Color textColor = Colors.black87;
  static Color itemColor = const Color.fromRGBO(238, 238, 238, 1);
  static Color lineColor = const Color.fromRGBO(253, 169, 41, 1);
  static Color backGroundColor = Colors.white;

  static Color headerColorNight = const Color.fromRGBO(68, 68, 68, 1);
  static Color textColorNight = Colors.white;
  static Color backGroundColorNight = const Color.fromRGBO(29, 28, 28, 1);
  static Color lineColorNight = const Color.fromRGBO(253, 169, 41, 1);
  static Color itemColorNight = const Color.fromRGBO(51, 51, 51, 1);

  static int themeDurationChange = 300;
  static int fontSize = 18;
  static bool isDarkModeEnabled = false;
  static String message = "";
  static String userToken = "";
  static int? statusCode;
}

class ConstUserInformations {
  static Map<String, dynamic>? json;
  static Map<String, dynamic>? generalJson;
  static String? qrCode;
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

class TrianglePainter extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double strokeWidth;

  TrianglePainter(
      {this.strokeColor = Colors.black,
      this.strokeWidth = 3,
      this.paintingStyle = PaintingStyle.stroke});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = paintingStyle;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(0, y)
      ..lineTo(x / 2, 0)
      ..lineTo(x, y)
      ..lineTo(0, y);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return oldDelegate.strokeColor != strokeColor ||
        oldDelegate.paintingStyle != paintingStyle ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
