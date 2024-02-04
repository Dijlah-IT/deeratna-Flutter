import 'package:deeratna/Api/firebase_api.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:deeratna/Constants/constants.dart';
import 'package:deeratna/Pages/splash_page.dart';
import 'package:deeratna/Route/routes.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.subscribeToTopic("general");
  await FirebaseApi().inintNotifications();
  runApp(const Deeratna());
}

class Deeratna extends StatefulWidget {
  const Deeratna({super.key});

  @override
  State<Deeratna> createState() => _DeeratnaState();
}

class _DeeratnaState extends State<Deeratna> {
  bool isNightTheme = false;
  bool? deviceTheme;
  _getThemeMod() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      isNightTheme = (pref.getBool("isDarkModeEnabled") ?? deviceTheme)!;
      Constants.userToken = pref.getString("userToken") ?? "";
    });
  }

  @override
  void initState() {
    var brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    deviceTheme = brightness == Brightness.dark;
    debugPrint('$deviceTheme<<<<<<<<<<<<<');
    _getThemeMod();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Constants.isDarkModeEnabled = isNightTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.grey,
        ),
      ),
      title: 'Deeratna',
      initialRoute: SplashPage.routName,
      routes: routes,
    );
  }
}
