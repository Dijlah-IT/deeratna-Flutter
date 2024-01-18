import 'package:deeratna/Pages/information_management_page.dart';
import 'package:deeratna/Pages/text_page.dart';
import 'package:deeratna/Pages/access_card_page.dart';
import 'package:deeratna/Pages/car_sticker_page.dart';
import 'package:deeratna/Pages/housespecifications_page.dart';
import 'package:deeratna/Pages/login_page.dart';
import 'package:deeratna/Pages/profile_page.dart';
import 'package:deeratna/Pages/qr_page.dart';
import 'package:deeratna/Pages/root_page.dart';
import 'package:deeratna/Pages/splash_page.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashPage.routName: (context) => const SplashPage(),
  RootPage.routName: (context) => const RootPage(),
  ProfilePage.routName: (context) => const ProfilePage(),
  AccessCard.routName: (context) => const AccessCard(),
  CarSticker.routName: (context) => const CarSticker(),
  InformationManagementPage.routName: (context) => const InformationManagementPage(),
  LoginPage.routName: (context) => const LoginPage(),
  TextPage.routName: (context) => const TextPage(),
  QRPage.routName: (context) => const QRPage(),
  HouseSpecificationsPage.routName: (context) =>
      const HouseSpecificationsPage(),
  // NotifPage.routName: (context) => const NotifPage(),
};
