import 'package:deeratna/Pages/SplashPage.dart';
import 'package:deeratna/Route/Routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Deeratna());
}

class Deeratna extends StatelessWidget {
  const Deeratna({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deeratna',
      initialRoute: SplashPage.routName,
      routes: routes,
    );
  }
}
