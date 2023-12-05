import 'package:deeratna/Components/my_cart.dart';
import 'package:deeratna/Constants/constants.dart';
import 'package:deeratna/Pages/accessCard_page.dart';
import 'package:deeratna/Pages/housespecifications_page.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lottie/lottie.dart';

import '../Components/heading.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<String> sampleImages = [
    './Assets/images/d-s001.jpg',
    './Assets/images/d-s002.jpg',
    './Assets/images/d-s003.jpg',
    './Assets/images/d-s004.jpg',
    './Assets/images/d-s005.jpg',
  ];
  static const List<String> servicesItemText = [
    "بطاقة دخول",
    "ملصق السيارات",
    "صيانة",
    "ادارة معلومات",
    "حجز ملعب",
    "حجز مسبح",
  ];
  static const List<IconData> servicesItemIcon = [
    Icons.card_membership,
    Icons.car_crash_outlined,
    Icons.car_crash_outlined,
    Icons.add_location_alt_outlined,
    Icons.phonelink_lock_sharp,
    Icons.mood_bad_sharp,
  ];
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final CarouselController _controller = CarouselController();
    return Scaffold(
      backgroundColor: Constants.isDarkModeEnabled
          ? Constants.backGroundColorNight
          : Constants.backGroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: size.width,
            child: Column(
              children: <Widget>[
                // Slider one
                Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 220.0,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                      ),
                      items: [0, 1, 2, 3, 4].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  HouseSpecificationsPage.routName,
                                  arguments: {
                                    "imageUrl": sampleImages[i],
                                  },
                                );
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      clipBehavior: Clip.antiAlias,
                                      width: size.width,
                                      decoration: const BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 4,
                                            offset:
                                                Offset(0, 0), // Shadow position
                                          ),
                                        ],
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      child: Image.asset(
                                        sampleImages[i],
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Positioned(
                                      top: 60,
                                      right: 0,
                                      left: 0,
                                      height: 150,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          ),
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.transparent,
                                              Constants.isDarkModeEnabled
                                                  ? Constants.lineColorNight
                                                  : Constants.headerColor,
                                            ],
                                          ),
                                        ),
                                        child: const Padding(
                                            padding: EdgeInsets.only(
                                              left: 10,
                                              top: 90,
                                              right: 10,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: <Widget>[
                                                Text(
                                                  "الامل ١",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Jazeera-Bold',
                                                    fontSize: 18,
                                                  ),
                                                  textAlign: TextAlign.right,
                                                  textDirection:
                                                      TextDirection.rtl,
                                                ),
                                                Text(
                                                  "A26-F3-P14",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13,
                                                  ),
                                                  textAlign: TextAlign.right,
                                                  textDirection:
                                                      TextDirection.rtl,
                                                ),
                                              ],
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: sampleImages.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => _controller.animateToPage(entry.key),
                            child: Container(
                              width: 8.0,
                              height: 8.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Constants.isDarkModeEnabled
                                          ? Constants.lineColorNight
                                          : Constants.headerColor)
                                      .withOpacity(
                                          _current == entry.key ? 0.9 : 0.4)),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                const Heading(
                  title: 'الطلبات',
                ),

                SizedBox(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 100.0,
                      autoPlay: false,
                      enlargeCenterPage: true,
                    ),
                    items: [0, 1, 2, 3, 4].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return const MyCart(
                            description:
                                " لوريم إيبسوم هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر.",
                            title: "لوريم إيبسوم",
                            icon: Icons.person_pin,
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 280,
                  child: GridView.count(
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    crossAxisCount: 3,
                    controller: ScrollController(keepScrollOffset: false),
                    children: List.generate(
                      servicesItemText.length,
                      (index) => ServiceItem(
                        servicesItemText: servicesItemText[index],
                        servicesItemIcon: servicesItemIcon[index],
                        itemTag: index,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ServiceItem extends StatelessWidget {
  final String servicesItemText;
  final IconData servicesItemIcon;
  final int itemTag;

  const ServiceItem({
    super.key,
    required this.servicesItemText,
    required this.servicesItemIcon,
    required this.itemTag,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint(itemTag.toString());
        debugPrint("Click !");
        Navigator.pushNamed(
          context,
          AccessCard.routName,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 0.2,
              offset: Offset(0, 0), // Shadow position
            ),
          ],
          color: Constants.isDarkModeEnabled
              ? Constants.itemColorNight
              : Constants.itemColor,
          border: Border.all(
              color: Constants.isDarkModeEnabled
                  ? Constants.lineColorNight
                  : Constants.lineColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Lottie.asset(
            //   './Assets/images/15.json',
            //   width: 50,
            //   height: 50,
            //   reverse: true,
            //   repeat: false,
            //   options: LottieOptions(
            //     enableMergePaths: true,
            //     enableApplyingOpacityToLayers: true,
            //   ),
            // ),
            Icon(
              servicesItemIcon,
              color: Constants.isDarkModeEnabled
                  ? Constants.textColorNight
                  : Constants.textColor,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              servicesItemText,
              style: TextStyle(
                color: Constants.isDarkModeEnabled
                    ? Constants.textColorNight
                    : Constants.textColor,
                fontFamily: 'Jazeera-Regular',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
