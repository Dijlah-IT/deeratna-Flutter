import 'package:deeratna/Pages/splash_page.dart';
import 'package:deeratna/Route/routes.dart';
import 'package:flutter/material.dart';

void main() {

  runApp(const Deeratna());
}

class Deeratna extends StatelessWidget {
  const Deeratna({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Deeratna',
      initialRoute: SplashPage.routName,
      routes: routes,
    );
  }
}
