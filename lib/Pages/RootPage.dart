import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});
  static String routName = "/RootPage";
  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
