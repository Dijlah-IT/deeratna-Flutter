import 'package:deeratna/Components/custom_line.dart';
import 'package:deeratna/Components/my_cart.dart';
import 'package:deeratna/Constants/constants.dart';
import 'package:deeratna/Pages/access_card_page.dart';
import 'package:deeratna/Pages/car_sticker_page.dart';
import 'package:deeratna/Pages/housespecifications_page.dart';
import 'package:deeratna/Pages/information_management_page.dart';
import 'package:deeratna/Pages/qr_page.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import '../Components/heading.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _userHouseInformtions = ConstUserInformations.json?['houses'];
  final CarouselController _carouselController = CarouselController();
  int _current = 0;

  static const List<String> servicesItemText = [
    "بطاقة دخول",
    "ملصق السيارات",
    "صيانة",
    "ادارة معلومات",
    "حجز ملعب",
    "حجز مسبح",
  ];
  static const List<String> servicesItemIcon = [
    './Assets/images/41.svg',
    './Assets/images/42.svg',
    './Assets/images/46.svg',
    './Assets/images/44.svg',
    './Assets/images/43.svg',
    './Assets/images/20.svg',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                  children: <Widget>[
                    CarouselSlider.builder(
                      itemCount: _userHouseInformtions.length,
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                          GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            HouseSpecificationsPage.routName,
                            arguments: {
                              'imageUrl': ConstUserInformations.json?['houses']
                                  [itemIndex]['city']['picture_url'],
                              'tag': itemIndex,
                            },
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(vertical: 5.0),
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
                                      offset: Offset(0, 0), // Shadow position
                                    ),
                                  ],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Image.network(
                                  ConstUserInformations.json?['houses']
                                      [itemIndex]['city']['picture_url'],
                                  width: 90,
                                  height: 250,
                                  fit: BoxFit.fill,
                                  frameBuilder: (context, child, frame,
                                      wasSynchronouslyLoaded) {
                                    return Container(
                                      width: 90,
                                      height: 250,
                                      decoration: BoxDecoration(
                                        color: Constants.isDarkModeEnabled
                                            ? Constants.textColorNight
                                            : Constants.textColor,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: child,
                                    );
                                  },
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
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                      top: 90,
                                      right: 10,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Text(
                                          ConstUserInformations.json?['houses']
                                              [itemIndex]['city']['name'],
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Jazeera-Bold',
                                            fontSize: 18,
                                          ),
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                        ),
                                        Text(
                                          ConstUserInformations.json?['houses']
                                                  [itemIndex]['zone']['name'] +
                                              ' - ' +
                                              ConstUserInformations
                                                      .json?['houses']
                                                  [itemIndex]['number'],
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                          ),
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      options: CarouselOptions(
                        height: 220.0,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        disableCenter: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                            _userHouseInformtions.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () =>
                                _carouselController.animateToPage(entry.key),
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Heading(
                    title: 'الطلبات',
                  ),
                ),

                SizedBox(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 100.0,
                      autoPlay: false,
                      enlargeCenterPage: true,
                    ),
                    items: [0, 1, 2, 3].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return MyCart(
                            description:
                                " لوريم إيبسوم هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر.",
                            title: servicesItemText[i],
                            icon: GestureDetector(
                              child: SvgPicture.asset(
                                servicesItemIcon[i],
                                height: 40,
                                fit: BoxFit.fill,
                                color: Constants.textColor,
                              ),
                              onTap: () {
                                debugPrint(i.toString());
                                debugPrint("Click !");
                                switch (i) {
                                  case 0:
                                    Navigator.pushNamed(
                                      context,
                                      InformationManagementPage.routName,
                                      arguments: {
                                        'editInformation': false,
                                      },
                                    );

                                    break;
                                  case 1:
                                    Navigator.pushNamed(
                                      context,
                                      CarSticker.routName,
                                    );
                                    break;
                                  case 3:
                                    Navigator.pushNamed(
                                      context,
                                      InformationManagementPage.routName,
                                      arguments: {
                                        'editInformation': true,
                                      },
                                    );
                                    break;
                                  default:
                                }
                              },
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    right: 20,
                    left: 20,
                    bottom: 0,
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        QRPage.routName,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: <Color>[
                            Constants.headerColor,
                            Constants.textColor,
                          ],
                          tileMode: TileMode.mirror,
                        ),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Row(
                        textDirection: TextDirection.rtl,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Constants.backGroundColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Lottie.asset(
                              './Assets/images/Animation-1704283213535.json',
                              width: 50,
                              height: 50,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'خطار QR',
                            style: TextStyle(
                              fontFamily: 'Jazeera-Regular',
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CustomHeadLine(size: size.width),
                          ),
                        ],
                      ),
                    ),
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
  final String servicesItemIcon;
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
        switch (itemTag) {
          case 0:
            Navigator.pushNamed(
              context,
              InformationManagementPage.routName,
              arguments: {
                'editInformation': false,
              },
            );

            break;
          case 1:
            Navigator.pushNamed(
              context,
              CarSticker.routName,
            );
            break;
          case 3:
            Navigator.pushNamed(
              context,
              InformationManagementPage.routName,
              arguments: {
                'editInformation': true,
              },
            );
            break;
          default:
        }
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
            SvgPicture.asset(
              servicesItemIcon,
              width: 40,
              height: 40,
              fit: BoxFit.fill,
              color: Constants.textColor,
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
