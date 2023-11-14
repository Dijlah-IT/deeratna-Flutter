import 'package:deeratna/Components/my_cart.dart';
import 'package:deeratna/Constants/constants.dart';
import 'package:deeratna/Pages/accessCard_page.dart';
import 'package:flutter/material.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.backGroundColor,
      body: Center(
        child: SingleChildScrollView(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            children: <Widget>[
              // Slider one
              FanCarouselImageSlider(
                imagesLink: sampleImages,
                isAssets: true,
                sliderHeight: size.height * 0.3,
                imageRadius: 15,
                sidesOpacity: 0.4,
                autoPlay: true,
                showArrowNav: false,
                imageFitMode: BoxFit.fill,
                userCanDrag: true,
                turns: 270,
                expandImageHeight: size.height * 0.792,
                indicatorActiveColor: Constants.textColor,
                indicatorDeactiveColor: Constants.textColor,
                autoPlayInterval: const Duration(milliseconds: 3000),
                currentItemShadow: const [
                  BoxShadow(
                      offset: Offset(1, 1),
                      color: Colors.white,
                      blurRadius: 10),
                ],
                sliderDuration: const Duration(milliseconds: 300),
                expandedCloseBtn: Container(
                  height: 500,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Constants.headerColor,
                      ],
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      const Positioned(
                        top: 320,
                        right: 20,
                        child: Text(
                          "لوريم إيبسوم",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Jazeera-Bold',
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 355,
                        right: 20,
                        child: SizedBox(
                          width: size.width * 0.8,
                          child: const Text(
                            "لوريم إيبسوم هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر.",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Jazeera-Regular',
                              fontSize: 18,
                            ),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.justify,
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                expandedCloseBtnDecoration: const BoxDecoration(),
              ),

              Container(
                width: size.width,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Stack(
                  children: <Widget>[
                    Divider(
                      height: 20,
                      thickness: 1,
                      endIndent: 80,
                      color: Constants.lineColor,
                    ),
                    Positioned(
                      top: -3,
                      right: 10,
                      child: Text(
                        "الطلبات",
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Constants.textColor,
                          fontFamily: 'Jazeera-Bold',
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 100,
                width: size.width,
                child: ListView.builder(
                  reverse: true,
                  scrollDirection: Axis.horizontal,
                  physics: const PageScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return const MyCart(
                      description:
                          " لوريم إيبسوم هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر.",
                      title: "لوريم إيبسوم",
                      icon: Icons.person_pin,
                    );
                  },
                ),
              ),

              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: SizedBox(
                  height: size.height * 0.3,
                  child: GridView.count(
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    crossAxisCount: 3,
                    children: List.generate(
                      servicesItemText.length,
                      (index) => ServiceItem(
                        servicesItemText: servicesItemText[index],
                        servicesItemIcon: servicesItemIcon[index],
                        itemTag: index,
                      ),
                    ),
                  ),
                ),
              )
            ],
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
          color: Colors.white,
          border: Border.all(color: const Color.fromARGB(255, 233, 232, 232)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              servicesItemIcon,
              size: 30,
              color: Constants.textColor,
            ),
            const SizedBox(height: 20),
            Text(
              servicesItemText,
              style: TextStyle(
                color: Constants.textColor,
                fontFamily: 'Jazeera-Regular',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
