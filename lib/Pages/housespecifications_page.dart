import 'package:flutter/material.dart';

class HouseSpecificationsPage extends StatefulWidget {
  const HouseSpecificationsPage({super.key});
  static String routName = "/HouseSpecificationsPage";
  @override
  State<HouseSpecificationsPage> createState() =>
      _HouseSpecificationsPageState();
}

class _HouseSpecificationsPageState extends State<HouseSpecificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: "HouseSliderImage",
        child: Image.asset(
          "./Assets/images/d-s001.jpg",
        ),
      ),
    );
  }
}
