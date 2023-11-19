import 'package:deeratna/Constants/constants.dart';
import 'package:deeratna/Pages/about_page.dart';
import 'package:deeratna/Pages/home_page.dart';
import 'package:deeratna/Pages/notif_page.dart';
import 'package:deeratna/Pages/profile_page.dart';
import 'package:deeratna/Pages/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slide_drawer/flutter_slide_widget.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  bool isDarkModeEnabled = false;

  _GetThemeMod() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      isDarkModeEnabled = pref.getBool("isDarkModeEnabled") ?? true;
    });
  }

  final GlobalKey<SliderDrawerWidgetState> drawerKey = GlobalKey();
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
  void setState(VoidCallback fn) {
    _GetThemeMod();
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

    final List<IconData> drawerItemIcon = [
      Icons.person,
      Icons.access_alarm_outlined,
      Icons.add_alert,
      Icons.add_location_alt_outlined,
      Icons.phonelink_lock_sharp,
      Icons.mood_bad_sharp,
    ];

    final Size size = MediaQuery.of(context).size;
    debugPrint(isDarkModeEnabled.toString() + "   RootPage");
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
                backgroundColor: Constants.backGroundColor,
                backgroundImage:
                    const ExactAssetImage('./Assets/images/Profile.jpg'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "علاء محمود عبدالله",
              style: TextStyle(
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
      body: Scaffold(
        backgroundColor: isDarkModeEnabled
            ? Constants.backGroundColorNight
            : Constants.backGroundColor,
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: isDarkModeEnabled
              ? Constants.headerColorNight
              : Constants.headerColor,
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
                  color: isDarkModeEnabled
                      ? Constants.lineColorNight
                      : Constants.lineColor,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {
                  debugPrint("Working !!!");
                  drawerKey.currentState!.toggleDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  color: isDarkModeEnabled
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
                // Setting
                const SettingPage(),
                const Center(
                  child: HomePage(),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      "شركة رائدة في مجال العقارات وإنشاء المدن السكنية وتسويقها وبيعها على شكل قطع سكنية ضمن مربعات سكنية واقــعه ضـمن وحدات جوار بموجب مخططات حضرية رسمية ومعتمدة من الجهــات الحكومـية ذات الأختصاص.\nهدفنا كسب ثقة كل شرائح المجتمع وذالك من خلال تجهيز مشاريع سكنية حضرية حديثة باسعار ميسرة بحيث يكون في متناول جميع فئات المجتمع حيث يتوفر نظام البيع بالأقساط المريحة والميسرة لهذة المشاريع وبهذا يستطيع ذوي الدخل المحدود إمتلاك قطعة أرض .\nالي جانب السجل العقاري ودفتر غرفة الصناعة والتجارة لدينا تصاريح مزاولة المهنة صادرة من هيئة الأراضي والمساحة والتخطيط العمراني بالحديدة، والى جانب هذا نمتلك أكثر من شهادة تقدير وأوسمة من جهات رسمية ومنظمات حقوقية يمنية وعربية الي جانب ذلك لدينا العديد من الشهادات المعتمدة من كل الجهات الحكومية ذات الإختصاص .",
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
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "بامكانك التواصل مع خدمة الدعم الفني على مدار الاسبوع عبر الارقام التالية:\n0780000000\n0770000000",
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
            color: isDarkModeEnabled
                ? Constants.lineColorNight
                : Constants.lineColor,
            fontFamily: 'Jazeera-Regular',
            fontWeight: FontWeight.w500,
          ),
          tabIconColor: isDarkModeEnabled
              ? Constants.lineColorNight
              : Constants.lineColor,
          tabIconSize: 28.0,
          tabIconSelectedSize: 28.0,
          tabSelectedColor: isDarkModeEnabled
              ? Constants.lineColorNight
              : Constants.lineColor,
          tabIconSelectedColor: Colors.white,
          tabBarColor: isDarkModeEnabled
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
  const DrawerItems({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
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
          IconButton(
            onPressed: () {},
            icon: Icon(icon),
            color: Constants.lineColor,
          ),
        ],
      ),
    );
  }
}
