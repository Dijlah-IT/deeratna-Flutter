import 'dart:async';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:deeratna/Api/login_api.dart';
import 'package:deeratna/Constants/constants.dart';
import 'package:deeratna/Pages/login_page.dart';
import 'package:deeratna/Pages/root_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  static String routName = "/";
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  deleteToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove('userToken');
  }

  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      debugPrint("${Constants.userToken}<--------");
      if (Constants.userToken == "") {
        Navigator.popAndPushNamed(
          context,
          LoginPage.routName,
        );
      } else {
        getUserInformations(Constants.userToken).then((value) {
          debugPrint(
              "${Constants.statusCode}<---------------111111");
          if (Constants.statusCode == 200) {
            Navigator.popAndPushNamed(
              context,
              RootPage.routName,
            );
          } else {
            deleteToken();
            Constants.userToken = "";
            final snackBar = SnackBar(
              elevation: 0,
              margin: const EdgeInsets.only(bottom: 80),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: Directionality(
                textDirection: TextDirection.rtl,
                child: AwesomeSnackbarContent(
                  color: Constants.isDarkModeEnabled
                      ? Constants.lineColorNight
                      : Constants.headerColor,
                  title: 'اهلا بك',
                  message: "اهلا بك يا ${ConstUserInformations.name}",
                  contentType: ContentType.success,
                ),
              ),
            );
            Navigator.popAndPushNamed(
              context,
              LoginPage.routName,
            );
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackBar);
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // bool isDarkModeEnabled = Provider.of(context);
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: <Widget>[
            Image.asset(
              './Assets/images/splash.jpg',
              fit: BoxFit.fill,
              width: size.width,
              height: size.height,
            ),
            Center(
              child: Lottie.asset(
                './Assets/images/deratna-fell.json',
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 100),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CircularProgressIndicator(
                  color: Constants.headerColor,
                  strokeWidth: 2.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
