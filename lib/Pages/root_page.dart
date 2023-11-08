import 'package:deeratna/Constants/constants.dart';
import 'package:deeratna/Pages/home_page.dart';
import 'package:flutter/material.dart';

import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});
  static String routName = "/RootPage";
  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> with TickerProviderStateMixin {
  MotionTabBarController? _motionTabBarController;
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
    return Scaffold(
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
              onPressed: () {},
              icon: Icon(
                Icons.person,
                color: Constants.lineColor,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: Constants.lineColor,
                size: 30,
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        // controller: _tabController,
        controller: _motionTabBarController,
        children: const <Widget>[
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
            child: Text("about"),
          ),
          Center(
            child: Text("call"),
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
    );
  }
}
