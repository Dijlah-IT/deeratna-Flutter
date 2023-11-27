import 'package:deeratna/Constants/constants.dart';
import 'package:deeratna/Pages/about_page.dart';
import 'package:deeratna/Pages/home_page.dart';
import 'package:deeratna/Pages/login_page.dart';
import 'package:deeratna/Pages/notif_page.dart';
import 'package:deeratna/Pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slide_drawer/flutter_slide_widget.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RootPage extends StatefulWidget {
  const RootPage({
    super.key,
  });
  static String routName = "/RootPage";

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> with TickerProviderStateMixin {
  MotionTabBarController? _motionTabBarController;
  bool showProfile = false;
  double brightnessValue = 0.0;
  double fontsizeValue = 15.0;
  bool isDarkModeEnabled = false;
  deleteToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove('userToken');
  }

  _GetThemeMod() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      isDarkModeEnabled = pref.getBool("isDarkModeEnabled") ?? true;
    });
  }

  _SetThemeMod() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    debugPrint(isDarkModeEnabled.toString());
    await pref.setBool('isDarkModeEnabled', isDarkModeEnabled);
  }

  @override
  void initState() {
    _GetThemeMod();
    super.initState();
    _motionTabBarController = MotionTabBarController(
      initialIndex: 1,
      length: 3,
      vsync: this,
    );
  }

  final GlobalKey<SliderDrawerWidgetState> drawerKey = GlobalKey();

  @override
  void dispose() {
    super.dispose();
    // _tabController.dispose();
    _motionTabBarController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> drawerItemText = [
      "الرئيسية",
      "من نحن",
      "الدعم الفني",
      "شارك التطبيق",
    ];

    final List<IconData> drawerItemIcon = [
      Icons.home,
      Icons.assignment_late_outlined,
      Icons.phone_enabled,
      Icons.share,
    ];

    final Size size = MediaQuery.of(context).size;

    return SliderDrawerWidget(
      key: drawerKey,
      option: SliderDrawerOption(
        backgroundImage: Image.asset(
          "./Assets/images/bg-sw.jpg",
          height: size.height,
          width: size.width,
        ),
        sliderEffectType: SliderEffectType.Rounded,
        backgroundColor: Colors.black,
        upDownScaleAmount: 10,
        radiusAmount: 50,
        direction: SliderDrawerDirection.RTL,
      ),
      drawer: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 70),
            Container(
              width: 130,
              height: 130,
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Constants.headerColor,
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 100,
                foregroundImage: NetworkImage(ConstUserInformations.photoURL),
                backgroundColor: Constants.backGroundColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              ConstUserInformations.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: 'Jazeera-Bold',
              ),
            ),
            const SizedBox(height: 40),
            Column(
              children: List.generate(
                drawerItemText.length,
                (index) => DrawerItems(
                  title: drawerItemText[index],
                  icon: drawerItemIcon[index],
                  tag: index,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(width: 1, color: Constants.headerColor),
              ),
              child: GestureDetector(
                onTap: () {
                  deleteToken();
                  Constants.userToken = "";
                  Navigator.popAndPushNamed(
                    context,
                    LoginPage.routName,
                  );
                },
                child: Text(
                  "تسجيل الخروج",
                  style: TextStyle(
                    color: Constants.textColor,
                    fontFamily: 'Jazeera-Regular',
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: Scaffold(
        backgroundColor: Constants.isDarkModeEnabled
            ? Constants.backGroundColorNight
            : Constants.backGroundColor,
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Constants.isDarkModeEnabled
              ? Constants.headerColorNight
              : Constants.headerColor,
          automaticallyImplyLeading: false,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Visibility(
                visible: false,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      showProfile = !showProfile;
                    });
                  },
                  icon: Icon(
                    Icons.person,
                    color: Constants.isDarkModeEnabled
                        ? Constants.lineColorNight
                        : Constants.lineColor,
                    size: 30,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  debugPrint("Working !!!");
                  drawerKey.currentState!.toggleDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  color: Constants.isDarkModeEnabled
                      ? Constants.lineColorNight
                      : Constants.lineColor,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: <Widget>[
            TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              // controller: _tabController,
              controller: _motionTabBarController,
              children: <Widget>[
                // Notif
                const Center(
                  child: NotifPage(),
                ),
                // HomePage
                const Center(
                  child: HomePage(),
                ),
                // Setting
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "المظهر",
                        style: TextStyle(
                          color: isDarkModeEnabled
                              ? Constants.lineColorNight
                              : Constants.lineColor,
                          fontSize: 18,
                          fontFamily: 'Jazeera-Regular',
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          color: isDarkModeEnabled
                              ? Constants.itemColorNight
                              : Constants.itemColor,
                          border: Border.all(
                            width: 0.4,
                            color: isDarkModeEnabled
                                ? Constants.lineColorNight
                                : Constants.lineColor,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              "فاتح",
                              style: TextStyle(
                                fontFamily: 'Jazeera-Regular',
                                color: isDarkModeEnabled
                                    ? Constants.textColorNight
                                    : Constants.textColor,
                                fontSize: 17,
                              ),
                            ),
                            DayNightSwitcher(
                              dayBackgroundColor: Constants.headerColor,
                              isDarkModeEnabled: isDarkModeEnabled,
                              onStateChanged: (isDarkModeEnabled) {
                                setState(() {
                                  Constants.isDarkModeEnabled =
                                      isDarkModeEnabled;
                                  this.isDarkModeEnabled = isDarkModeEnabled;
                                  _SetThemeMod();
                                });
                              },
                            ),
                            Text(
                              "داكن",
                              style: TextStyle(
                                fontFamily: 'Jazeera-Regular',
                                color: isDarkModeEnabled
                                    ? Constants.textColorNight
                                    : Constants.textColor,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "الاضاءة",
                        style: TextStyle(
                          color: isDarkModeEnabled
                              ? Constants.lineColorNight
                              : Constants.lineColor,
                          fontSize: 18,
                          fontFamily: 'Jazeera-Regular',
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          color: isDarkModeEnabled
                              ? Constants.itemColorNight
                              : Constants.itemColor,
                          border: Border.all(
                            width: 0.4,
                            color: isDarkModeEnabled
                                ? Constants.lineColorNight
                                : Constants.lineColor,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (brightnessValue.toInt() != 0) {
                                    brightnessValue--;
                                  }
                                });
                              },
                              icon: Icon(
                                Icons.lightbulb_outline,
                                size: 23,
                                color: isDarkModeEnabled
                                    ? Constants.textColorNight
                                    : Constants.textColor,
                              ),
                            ),
                            SliderTheme(
                              data: const SliderThemeData(),
                              child: Slider(
                                min: 0,
                                max: 20,
                                value: brightnessValue,
                                divisions: 20,
                                label: brightnessValue.toInt().toString(),
                                onChanged: (double value) {
                                  setState(() {
                                    brightnessValue = value;
                                  });
                                },
                                activeColor: isDarkModeEnabled
                                    ? Constants.textColorNight
                                    : Constants.textColor,
                                inactiveColor: isDarkModeEnabled
                                    ? Constants.backGroundColorNight
                                    : Constants.backGroundColor,
                                thumbColor: isDarkModeEnabled
                                    ? Constants.headerColorNight
                                    : Constants.headerColor,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (brightnessValue.toInt() < 19) {
                                    brightnessValue++;
                                  }
                                });
                              },
                              icon: Icon(
                                Icons.lightbulb,
                                color: isDarkModeEnabled
                                    ? Constants.textColorNight
                                    : Constants.textColor,
                                size: 23,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "حجم النص",
                        style: TextStyle(
                          color: isDarkModeEnabled
                              ? Constants.lineColorNight
                              : Constants.lineColor,
                          fontSize: 18,
                          fontFamily: 'Jazeera-Regular',
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          color: isDarkModeEnabled
                              ? Constants.itemColorNight
                              : Constants.itemColor,
                          border: Border.all(
                            width: 0.4,
                            color: isDarkModeEnabled
                                ? Constants.lineColorNight
                                : Constants.lineColor,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (fontsizeValue.toInt() != 0) {
                                    fontsizeValue--;
                                  }
                                });
                              },
                              icon: Icon(
                                Icons.exposure_minus_1,
                                size: 23,
                                color: isDarkModeEnabled
                                    ? Constants.textColorNight
                                    : Constants.textColor,
                              ),
                            ),
                            Slider(
                              min: 15,
                              max: 32,
                              value: fontsizeValue,
                              divisions: 17,
                              label: fontsizeValue.toInt().toString(),
                              onChanged: (double value) {
                                setState(() {
                                  fontsizeValue = value;
                                });
                              },
                              activeColor: isDarkModeEnabled
                                  ? Constants.textColorNight
                                  : Constants.textColor,
                              inactiveColor: isDarkModeEnabled
                                  ? Constants.backGroundColorNight
                                  : Constants.backGroundColor,
                              thumbColor: isDarkModeEnabled
                                  ? Constants.headerColorNight
                                  : Constants.headerColor,
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (fontsizeValue.toInt() < 31) {
                                    fontsizeValue++;
                                  }
                                });
                              },
                              icon: Icon(
                                Icons.plus_one,
                                color: isDarkModeEnabled
                                    ? Constants.textColorNight
                                    : Constants.textColor,
                                size: 23,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: showProfile ? size.height : 0,
              // ignore: prefer_const_constructors
              child: ProfilePage(),
            ),
          ],
        ),
        bottomNavigationBar: MotionTabBar(
          controller: _motionTabBarController,
          initialSelectedTab: "الرئيسية",
          labels: const [
            "الاشعارات",
            "الرئيسية",
            "الاعدادات",
          ],
          icons: const [
            Icons.notifications,
            Icons.home,
            Icons.settings,
          ],
          tabSize: 50,
          tabBarHeight: 55,
          textStyle: TextStyle(
            fontSize: 13,
            color: Constants.isDarkModeEnabled
                ? Constants.lineColorNight
                : Constants.lineColor,
            fontFamily: 'Jazeera-Regular',
            fontWeight: FontWeight.w500,
          ),
          tabIconColor: Constants.isDarkModeEnabled
              ? Constants.lineColorNight
              : Constants.lineColor,
          tabIconSize: 28.0,
          tabIconSelectedSize: 28.0,
          tabSelectedColor: Constants.isDarkModeEnabled
              ? Constants.lineColorNight
              : Constants.lineColor,
          tabIconSelectedColor: Colors.white,
          tabBarColor: Constants.isDarkModeEnabled
              ? Constants.headerColorNight
              : Constants.headerColor,
          onTabItemSelected: (int value) {
            setState(() {
              _motionTabBarController!.index = value;
            });
          },
        ),
      ),
    );
  }
}

class DrawerItems extends StatelessWidget {
  final String title;
  final IconData icon;
  final int tag;

  const DrawerItems({
    super.key,
    required this.title,
    required this.icon,
    required this.tag,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      child: GestureDetector(
        onTap: () {
          debugPrint(tag.toString());
          switch (tag) {
            case 0:
              break;
            case 1:
              Navigator.pushNamed(
                context,
                AboutPage.routName,
                arguments: {
                  "title": "من نحن",
                  "isAbout": true,
                },
              );
              break;
            case 2:
              Navigator.pushNamed(
                context,
                AboutPage.routName,
                arguments: {
                  "title": "الدعم الفني",
                  "isAbout": false,
                },
              );
              break;
          }
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Jazeera-Regular',
                fontSize: 18,
                color: Constants.lineColor,
              ),
            ),
            const SizedBox(width: 5),
            Icon(
              icon,
              color: Constants.lineColor,
            )
          ],
        ),
      ),
    );
  }
}
