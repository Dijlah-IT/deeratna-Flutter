import 'dart:io';

import 'package:deeratna/Components/heading.dart';
import 'package:deeratna/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';

class HouseSpecificationsPage extends StatefulWidget {
  const HouseSpecificationsPage({
    super.key,
  });
  static String routName = "/HouseSpecificationsPage";
  @override
  State<HouseSpecificationsPage> createState() =>
      _HouseSpecificationsPageState();
}

class _HouseSpecificationsPageState extends State<HouseSpecificationsPage> {
  static const List<String> facilitiesTitle = [
    'مقاهي',
    'مطاعم',
    'قاعة رياضية',
    'طرق',
    'أمن',
    'تسوق',
    'موقف',
    'مسبح',
    'ترفيه',
  ];

  static const List<IconData> facilitiesIcon = [
    Icons.alarm,
    Icons.dangerous,
    Icons.table_chart_outlined,
    Icons.yard_outlined,
    Icons.h_mobiledata,
    Icons.highlight,
    Icons.radio,
    Icons.back_hand_rounded,
    Icons.cabin,
  ];

  static const List<String> SpecificationsTitle = [
    'المساحة',
    'الطوابق',
    'غرف النوم',
  ];

  static const List<String> SpecificationsSubTitle = [
    '٢٠٠ متر',
    '٢ طابق',
    '٣ غرف',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      backgroundColor: Constants.isDarkModeEnabled
          ? Constants.backGroundColorNight
          : Constants.backGroundColor,
      appBar: AppBar(
        backgroundColor: Constants.isDarkModeEnabled
            ? Constants.headerColorNight
            : Constants.headerColor,
        iconTheme: IconThemeData(
          color: Constants.isDarkModeEnabled
              ? Constants.lineColorNight
              : Constants.lineColor,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          textDirection: TextDirection.rtl,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.person),
            const SizedBox(width: 10),
            Text(
              ConstUserInformations.name,
              style: TextStyle(
                fontFamily: 'Jazeera-Regular',
                fontSize: 16,
                color: Constants.isDarkModeEnabled
                    ? Constants.lineColorNight
                    : Constants.lineColor,
              ),
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
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
                  child: Image.asset(
                    arguments["imageUrl"],
                    fit: BoxFit.fill,
                    height: 300,
                    width: size.width,
                  ),
                ),
                const SizedBox(height: 20),
                const Heading(title: "تفاصیل العقار"),
                Container(
                  width: size.width,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Constants.isDarkModeEnabled
                          ? Colors.white.withOpacity(0.1)
                          : Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        textDirection: TextDirection.rtl,
                        children: <Widget>[
                          const Directionality(
                            textDirection: TextDirection.rtl,
                            child: SpecificationsItem(
                              subtitle: 'z2-b4-ii8',
                              title: 'الامل',
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 7, 110, 43),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Text(
                              "ساکن",
                              style: TextStyle(
                                fontFamily: 'Jazeera-Bold',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(color: Constants.headerColor),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: GridView.count(
                            crossAxisCount: 2,
                            controller:
                                ScrollController(keepScrollOffset: false),
                            childAspectRatio:
                                (((size.height - kToolbarHeight) / 2) /
                                    (size.width / 2.5)),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: List.generate(
                              SpecificationsTitle.length,
                              (index) => SpecificationsItem(
                                subtitle: SpecificationsSubTitle[index],
                                title: SpecificationsTitle[index],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(color: Constants.headerColor),
                      Stack(
                        children: <Widget>[
                          Accordion(
                            headerBackgroundColorOpened:
                                Constants.isDarkModeEnabled
                                    ? Constants.headerColorNight
                                    : Constants.headerColor,
                            contentBackgroundColor: Constants.isDarkModeEnabled
                                ? Colors.black54
                                : Colors.white,
                            contentBorderColor: Constants.isDarkModeEnabled
                                ? Constants.lineColorNight
                                : Constants.lineColor,
                            headerBackgroundColor: Constants.isDarkModeEnabled
                                ? Constants.headerColorNight
                                : Constants.headerColor,
                            contentBorderWidth: 1,
                            contentHorizontalPadding: 20,
                            scaleWhenAnimating: false,
                            disableScrolling: true,
                            openAndCloseAnimation: true,
                            children: <AccordionSection>[
                              AccordionSection(
                                isOpen: false,
                                headerBorderColor: Constants.isDarkModeEnabled
                                    ? Constants.lineColorNight
                                    : Constants.lineColor,
                                headerBorderColorOpened:
                                    Constants.isDarkModeEnabled
                                        ? Constants.lineColorNight
                                        : Constants.lineColor,
                                headerBorderWidth: 1,
                                contentVerticalPadding: 20,
                                headerPadding: const EdgeInsets.all(20),
                                rightIcon: const Text(""),
                                header: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  textDirection: TextDirection.rtl,
                                  children: <Widget>[
                                    Text(
                                      'خطة الدفع',
                                      style: TextStyle(
                                        fontFamily: 'Jazeera-Regular',
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'عرض الخطة',
                                      style: TextStyle(
                                        fontFamily: 'Jazeera-Regular',
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                content: const Text(
                                  "لوريم إيبسوم هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في لوريم إيبسوم هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر.لوريم إيبسوم هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر.لوريم إيبسوم هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النلوريم إيبسوم هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر.شر. المطابع ودور النشر.",
                                  style: TextStyle(
                                    fontFamily: 'Jazeera-Regular',
                                  ),
                                  textAlign: TextAlign.justify,
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                            ],
                          ),
                          // Positioned(
                          //   right: 50,
                          //   top: 75,
                          //   child: CustomPaint(
                          //     painter: TrianglePainter(
                          //       strokeColor: Constants.isDarkModeEnabled
                          //           ? Constants.textColorNight
                          //           : Colors.white,
                          //       strokeWidth: 10,
                          //       paintingStyle: PaintingStyle.fill,
                          //     ),
                          //     child: SizedBox(
                          //       height: show ? 15 : 0,
                          //       width: show ? 20 : 0,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Heading(title: "مرافق المدينة"),
                Container(
                  width: size.width,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: GridView.count(
                      crossAxisCount: 4,
                      mainAxisSpacing: 20.0,
                      controller: ScrollController(keepScrollOffset: false),
                      childAspectRatio:
                          (((size.height - kToolbarHeight) / 6.8) /
                              (size.width / 4.0)),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: List.generate(
                        facilitiesTitle.length,
                        (index) => FacilitiesItem(
                          icon: facilitiesIcon[index],
                          title: facilitiesTitle[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FacilitiesItem extends StatelessWidget {
  final String title;
  final IconData icon;
  const FacilitiesItem({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              style: BorderStyle.solid,
              color: Constants.isDarkModeEnabled
                  ? Constants.lineColorNight
                  : Constants.lineColor,
            ),
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.5),
          ),
          child: Icon(
            icon,
            color: Constants.isDarkModeEnabled ? Colors.white : Colors.black54,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(
            fontFamily: 'Jazeera-Regular',
            color: Constants.isDarkModeEnabled ? Colors.white : Colors.black,
          ),
        ),
      ],
    );
  }
}

class SpecificationsItem extends StatelessWidget {
  final String title;
  final String subtitle;
  const SpecificationsItem({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Image.asset(
          './Assets/images/logo.png',
          width: 50,
          height: 50,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 17,
                color:
                    Constants.isDarkModeEnabled ? Colors.white : Colors.black,
                fontFamily: 'Jazeera-Bold',
              ),
            ),
            Text(
              subtitle,
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 15,
                color:
                    Constants.isDarkModeEnabled ? Colors.white : Colors.black,
                fontFamily: 'Jazeera-Regular',
              ),
            ),
          ],
        )
      ],
    );
  }
}
