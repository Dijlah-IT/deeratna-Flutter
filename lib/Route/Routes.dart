import 'package:deeratna/Pages/RootPage.dart';
import 'package:deeratna/Pages/SplashPage.dart';
import 'package:flutter/material.dart';

  final Map<String, WidgetBuilder> routes = {
    SplashPage.routName : (context) => const SplashPage(),
    RootPage.routName : (context) => const RootPage(),
  };


