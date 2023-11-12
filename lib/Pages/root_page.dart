import 'package:deeratna/Constants/constants.dart';
import 'package:deeratna/Pages/about_page.dart';
import 'package:deeratna/Pages/home_page.dart';
import 'package:deeratna/Pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  static String routName = "/RootPage";

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> with TickerProviderStateMixin {
  MotionTabBarController? _motionTabBarController;
  bool showProfile = false;
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
      menuBackgroundColor: Constants.backGroundColor,
      mainScreen: Scaffold(
        backgroundColor: Constants.backGroundColor,
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
                  drawerController.open?.call();
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
                Center(
                  child: Text("Profile"),
                ),
                Center(
                  child: HomePage(),
                ),
                Center(
                  child: Text("call"),
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
            Icons.support_agent,
          ],
          tabSize: 50,
          tabBarHeight: 55,
          textStyle: TextStyle(
            fontSize: 14,
            color: Constants.lineColor,
            fontFamily: 'Jazeera-Regular',
            fontWeight: FontWeight.w500,
          ),
          tabIconColor: Constants.lineColor,
          tabIconSize: 28.0,
          tabIconSelectedSize: 26.0,
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
