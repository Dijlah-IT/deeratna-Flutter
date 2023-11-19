import 'package:deeratna/Pages/splash_page.dart';
import 'package:deeratna/Route/routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Deeratna());
}

class Deeratna extends StatefulWidget {
  const Deeratna({super.key});

  @override
  State<Deeratna> createState() => _DeeratnaState();
}

class _DeeratnaState extends State<Deeratna> {
  bool isNightTheme = false;

  _GetThemeMod() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      isNightTheme = pref.getBool("isDarkModeEnabled") ?? true;
    });
  }

  @override
  void initState() {
    _GetThemeMod();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(isNightTheme.toString()+"main");
    return Provider(
      create: (context) => isNightTheme,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Deeratna',
        initialRoute: SplashPage.routName,
        routes: routes,
      ),
    );
  }
}
