import 'package:deeratna/Pages/RootPage.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  static String routName = "/";
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              RootPage.routName,
              ModalRoute.withName('/'),
            );
          },
          child: Image.asset(
            './Assets/images/p-1.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
