import 'package:deeratna/Constants/constants.dart';
import 'package:deeratna/Pages/about_page.dart';
import 'package:deeratna/Pages/home_page.dart';
import 'package:deeratna/Pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:day_night_switcher/day_night_switcher.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});
  static String routName = "/RootPage";
  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> with TickerProviderStateMixin {
  MotionTabBarController? _motionTabBarController;
  bool showProfile = false;
  bool isDarkModeEnabled = false;
  double brightnessValue = 0.0;
  double fontsizeValue = 15.0;
  // ignore: deprecated_member_use
  final brightness = MediaQueryData.fromView(WidgetsBinding.instance.window)
      .platformBrightness;
  @override
  void initState() {
    super.initState();
    _motionTabBarController = MotionTabBarController(
      initialIndex: 2,
      length: 5,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    // _tabController.dispose();
    _motionTabBarController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> drawerItemText = [
      "بطاقة دخول",
      "ملصق السيارات",
      "صيانة",
      "ادارة معلومات",
      "حجز ملعب",
      "حجز مسبح",
    ];
    final ZoomDrawerController drawerController = ZoomDrawerController();
    final List<IconData> drawerItemIcon = [
      Icons.person,
      Icons.access_alarm_outlined,
      Icons.add_alert,
      Icons.add_location_alt_outlined,
      Icons.phonelink_lock_sharp,
      Icons.mood_bad_sharp,
    ];
    final Size size = MediaQuery.of(context).size;

    return ZoomDrawer(
      controller: drawerController,
      borderRadius: 50,
      showShadow: true,
      angle: 0,
      openDragSensitivity: 0,
      closeDragSensitivity: 0,
      androidCloseOnBackTap: true,
      isRtl: true,
      mainScreenTapClose: true,
      openCurve: Curves.fastOutSlowIn,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      duration: const Duration(milliseconds: 500),
      // angle: 0.0,
      menuBackgroundColor: isDarkModeEnabled
          ? Constants.backGroundColorNight
          : Constants.backGroundColor,
      mainScreen: Scaffold(
        backgroundColor: isDarkModeEnabled
            ? Constants.backGroundColorNight
            : Constants.backGroundColor,
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Constants.headerColor,
          automaticallyImplyLeading: false,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  setState(() {
                    showProfile = !showProfile;
                  });
                },
                icon: Icon(
                  Icons.person,
                  color: Constants.lineColor,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {
                  debugPrint("Working !!!");
                  drawerController.toggle!();
                },
                icon: Icon(
                  Icons.menu,
                  color: Constants.lineColor,
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
                Center(
                  child: Text("Dashboard"),
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
                          color: Constants.lineColor,
                          fontSize: 18,
                          fontFamily: 'Jazeera-Regular',
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 0.4,
                            color: Constants.lineColor,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
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
                            DayNightSwitcher(
                              dayBackgroundColor: Constants.headerColor,
                              isDarkModeEnabled: isDarkModeEnabled,
                              onStateChanged: (isDarkModeEnabled) {
                                setState(() {
                                  this.isDarkModeEnabled = isDarkModeEnabled;
                                });
                              },
                            ),
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
                          ],
                        ),
                      ),
                      Text(
                        "الاضاءة",
                        style: TextStyle(
                          color: Constants.lineColor,
                          fontSize: 18,
                          fontFamily: 'Jazeera-Regular',
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 0.4,
                            color: Constants.lineColor,
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
                                    debugPrint(brightnessValue.toString());
                                  }
                                });
                              },
                              icon: const Icon(
                                Icons.lightbulb_outline,
                                size: 23,
                              ),
                            ),
                            SliderTheme(
                              data: SliderThemeData(),
                              child: Slider(
                                min: 0,
                                max: 20,
                                value: brightnessValue,
                                divisions: 20,
                                label: brightnessValue.toInt().toString(),
                                onChanged: (double value) {
                                  setState(() {
                                    debugPrint("working");
                                    brightnessValue = value;
                                  });
                                },
                                activeColor: Constants.textColor,
                                inactiveColor: Constants.backGroundColor,
                                thumbColor: Constants.headerColor,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  debugPrint(brightnessValue.toString());
                                  if (brightnessValue.toInt() < 19) {
                                    brightnessValue++;
                                  }
                                });
                              },
                              icon: const Icon(
                                Icons.lightbulb,
                                size: 23,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "حجم النص",
                        style: TextStyle(
                          color: Constants.lineColor,
                          fontSize: 18,
                          fontFamily: 'Jazeera-Regular',
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 0.4,
                            color: Constants.lineColor,
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
                                    debugPrint(fontsizeValue.toString());
                                  }
                                });
                              },
                              icon: const Icon(
                                Icons.exposure_minus_1,
                                size: 23,
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
                                  debugPrint("working");
                                  fontsizeValue = value;
                                });
                              },
                              activeColor: Constants.textColor,
                              inactiveColor: Constants.backGroundColor,
                              thumbColor: Constants.headerColor,
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  debugPrint(fontsizeValue.toString());
                                  if (fontsizeValue.toInt() < 31) {
                                    fontsizeValue++;
                                  }
                                });
                              },
                              icon: const Icon(
                                Icons.plus_one,
                                size: 23,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: HomePage(),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "شركة تقنية عراقية رائدة ذات خبرة طويلة في مجال التصميم والخدمات الرقمية.\n المجال: تصميم مواقع الويب، التطبيقات، أرشفة المواقع، تصميم هوية رقمية بجودة عالية، وكل ما يتبع ذلك من خدمات تفصيلية تخدم حاجة العميل وتطلعاته. \nالهدف: نسعى لترك بصمة مميزة في المحتوى التقني من خلال ما نقدمه من خدمات رقمية ينجزها أفضل الخبراء والمحترفين مع الاهتمام بأدق التفاصيل للوصول إلى أعلى معايير الجودة.\n- بدأت العمل سنة 1998 مع بداية اتساع العالم الافتراضي وتحول الميديا الى الشاشة الصغيرة، واكتسبت تجربة ثرية بعد ان سجلّتْ في دفتر يومياتها إنجاز اكثر من 500 موقعا الكترونيا رصينا و 200 تطبيقا حمل مواصفات عالية في دقة الانجاز والتصميم.\n- تهتم الشركة بأدق التفاصيل للوصول إلى أعلى معايير الجودة. \n- يتم دراسة المشاريع قبل تنفيذها لضمان نجاح وتميز المشاريع. \n- ايجاد الحلول المناسبة للمشاريع والافكار المتميزة والمبتكرة. \n- نمتلك الخبرة الكافية في أحدث التكنولوجيا المستخدمة حالياً. \n- هدفنا الاتقان والتفرد في الانجاز والجمالية في التصميم والامن في الحفاظ على المعلومات.\n- تنشط في ١٤ بلدا باعمال وبلغات مختلفة.",
                      style: TextStyle(
                        fontFamily: 'Jazeera-Regular',
                        fontSize: 17,
                        color: isDarkModeEnabled
                            ? Constants.textColorNight
                            : Constants.textColor,
                      ),
                      textAlign: TextAlign.justify,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
                Center(
                  child: Text("call"),
                ),
              ],
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: showProfile ? size.height : 0,
              child: const ProfilePage(),
            ),
          ],
        ),
        bottomNavigationBar: MotionTabBar(
          controller: _motionTabBarController,
          initialSelectedTab: "الرئيسية",
          labels: const [
            "الاشعارات",
            "الاعدادات",
            "الرئيسية",
            "من نحن",
            "الدعم الفني",
          ],
          icons: const [
            Icons.notifications,
            Icons.settings,
            Icons.home,
            Icons.info_outline,
            Icons.call,
          ],
          tabSize: 50,
          tabBarHeight: 55,
          textStyle: TextStyle(
            fontSize: 13,
            color: Constants.lineColor,
            fontFamily: 'Jazeera-Regular',
            fontWeight: FontWeight.w500,
          ),
          tabIconColor: Constants.lineColor,
          tabIconSize: 28.0,
          tabIconSelectedSize: 28.0,
          tabSelectedColor: Constants.lineColor,
          tabIconSelectedColor: Colors.white,
          tabBarColor: Constants.headerColor,
          onTabItemSelected: (int value) {
            setState(() {
              _motionTabBarController!.index = value;
            });
          },
        ),
      ),
      // moveMenuScreen: false,
      menuScreen: Scaffold(
        backgroundColor: Constants.backGroundColor,
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
                backgroundColor: Constants.backGroundColor,
                backgroundImage:
                    const ExactAssetImage('./Assets/images/Profile.jpg'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "محمدونکی",
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Jazeera-Bold',
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(2.0, 2.0),
                    blurRadius: 3.0,
                    color: Colors.black87,
                  ),
                  Shadow(
                    offset: Offset(10.0, 10.0),
                    blurRadius: 8.0,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Column(
              children: List.generate(
                drawerItemText.length,
                (index) => DrawerItems(
                  title: drawerItemText[index],
                  icon: drawerItemIcon[index],
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
              child: Text(
                "تسجيل الخروج",
                style: TextStyle(
                  color: Constants.textColor,
                  fontFamily: 'Jazeera-Regular',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DrawerItems extends StatelessWidget {
  final String title;
  final IconData icon;
  const DrawerItems({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Jazeera-Regular',
              fontSize: 18,
            ),
          ),
          const SizedBox(width: 20),
          IconButton(
            onPressed: () {},
            icon: Icon(icon),
          ),
        ],
      ),
    );
  }
}
