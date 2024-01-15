import 'package:deeratna/Components/custom_line.dart';
import 'package:deeratna/Components/heading.dart';
import 'package:deeratna/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

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

  static const List<String> facilitiesIcon = [
    './Assets/images/13.svg',
    './Assets/images/14.svg',
    './Assets/images/15.svg',
    './Assets/images/19.svg',
    './Assets/images/16.svg',
    './Assets/images/17.svg',
    './Assets/images/18.svg',
    './Assets/images/20.svg',
    './Assets/images/21.svg',
  ];

  static const List<String> specificationsIcon = [
    './Assets/images/33.svg',
    './Assets/images/34.svg',
    './Assets/images/35.svg',
    './Assets/images/36.svg',
  ];

  static const List<String> _specificationsTitle = [
    'مساحة الارض',
    'مساحة البناء',
    'الطوابق',
    'غرف النوم',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final List<dynamic> instalments =
        ConstUserInformations.json?['houses'][arguments['tag']]['instalments'];

    List<dynamic> specificationsSubTitle = [
      '${ConstUserInformations.json!['houses'][0]['house_type']['land_area']}متر',
      '${ConstUserInformations.json!['houses'][0]['house_type']['building_area']}متر',
      '${ConstUserInformations.json!['houses'][0]['house_type']['floors_count']}طابق',
      '${ConstUserInformations.json!['houses'][0]['house_type']['rooms_count']}غرف',
    ];

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
              ConstUserInformations.json?['name'],
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
                  child: Image.network(
                    arguments["imageUrl"],
                    width: size.width,
                    height: 250,
                    fit: BoxFit.fill,
                    frameBuilder:
                        (context, child, frame, wasSynchronouslyLoaded) {
                      return Container(
                        width: size.width,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Constants.isDarkModeEnabled
                              ? Constants.textColorNight
                              : Constants.textColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: child,
                      );
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Heading(title: "تفاصیل العقار"),
                ),
                Container(
                  width: size.width,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: const Color.fromARGB(255, 174, 192, 163)),
                    color: Constants.isDarkModeEnabled
                        ? Colors.white.withOpacity(0.1)
                        : const Color.fromARGB(255, 226, 238, 218),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        textDirection: TextDirection.rtl,
                        children: <Widget>[
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(
                              children: <Widget>[
                                SvgPicture.asset(
                                  './Assets/images/homeicon.svg',
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.fill,
                                  color: Constants.textColor,
                                ),
                                const RotationTransition(
                                  turns: AlwaysStoppedAnimation(90 / 360),
                                  child: CustomHeadLine(size: 40),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      ConstUserInformations.json?['houses']
                                          [arguments['tag']]['city']['name'],
                                      style: const TextStyle(
                                        fontFamily: 'Jazeera-Bold',
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      ConstUserInformations.json?['houses']
                                                  [arguments['tag']]['zone']
                                              ['name'] +
                                          ' - ' +
                                          ConstUserInformations.json?['houses']
                                              [arguments['tag']]['number'],
                                      style: const TextStyle(
                                        fontFamily: 'Jazeera-Regular',
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                )
                              ],
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
                      const SizedBox(height: 10),
                      Stack(
                        children: <Widget>[
                          CustomHeadLine(size: size.width),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 3,
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
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
                                    _specificationsTitle.length,
                                    (index) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: SpecificationsItem(
                                        subtitle: specificationsSubTitle[index]
                                            .toString(),
                                        title: _specificationsTitle[index],
                                        icon: specificationsIcon[index],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: -50,
                            right: 0,
                            width: size.width,
                            child: Image.asset(
                              './Assets/images/homebg.png',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      CustomHeadLine(size: size.width * 0.4),
                      Accordion(
                        headerBackgroundColorOpened: Constants.isDarkModeEnabled
                            ? Constants.headerColorNight
                            : Constants.headerColor,
                        contentBackgroundColor: Constants.isDarkModeEnabled
                            ? Colors.black54
                            : Colors.white,
                        contentBorderColor: Constants.isDarkModeEnabled
                            ? Constants.lineColorNight
                            : Constants.headerColor,
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
                                : Constants.headerColor,
                            headerBorderColorOpened: Constants.isDarkModeEnabled
                                ? Constants.lineColorNight
                                : Constants.headerColor,
                            headerBorderWidth: 1,
                            contentVerticalPadding: 15,
                            headerPadding: const EdgeInsets.all(20),
                            rightIcon: const Text(""),
                            header: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              textDirection: TextDirection.rtl,
                              children: <Widget>[
                                const Text(
                                  'خطة الدفع',
                                  style: TextStyle(
                                    fontFamily: 'Jazeera-Regular',
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: CustomHeadLine(size: size.width),
                                ),
                              ],
                            ),
                            content: Column(
                              children: List.generate(
                                instalments.length,
                                (index) => InstalmentsWidget(
                                  instalments: instalments,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Heading(
                    title: "مرافق المدينة",
                  ),
                ),
                Container(
                  width: size.width,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: const Color.fromARGB(255, 174, 192, 163)),
                    color: Constants.isDarkModeEnabled
                        ? Colors.white.withOpacity(0.1)
                        : const Color.fromARGB(255, 226, 238, 218),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 0,
                      controller: ScrollController(keepScrollOffset: false),
                      childAspectRatio:
                          (((size.height - kToolbarHeight) / 2.0) /
                              (size.width / 3.0)),
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

class InstalmentsWidget extends StatelessWidget {
  const InstalmentsWidget({
    super.key,
    required this.instalments,
  });

  final List instalments;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textDirection: TextDirection.rtl,
        children: <Widget>[
          Text(
            instalments[0]['amount'],
          ),
          instalments[0]['date'] != null
              ? Text(
                  instalments[0]['date'],
                )
              : Text(
                  instalments[0]['type'],
                  style: const TextStyle(
                    fontFamily: 'Jazeera-Regular',
                  ),
                ),
        ],
      ),
    );
  }
}

class FacilitiesItem extends StatelessWidget {
  final String title;
  final String icon;
  const FacilitiesItem({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Container(
            width: 160,
            height: 46,
            decoration: BoxDecoration(
              color: Constants.textColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Jazeera-Bold',
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 46,
            width: 46,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Constants.headerColor,
            ),
            child: Center(
              child: SvgPicture.asset(
                icon,
                width: 32,
                height: 32,
                fit: BoxFit.fill,
                color: Constants.lineColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SpecificationsItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String icon;
  const SpecificationsItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 0.7,
              color: Constants.headerColor,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: SvgPicture.asset(
            icon,
            width: 29,
            height: 29,
            fit: BoxFit.fill,
            color: Constants.textColor,
          ),
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
                fontSize: 13,
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
                fontSize: 11,
                color:
                    Constants.isDarkModeEnabled ? Colors.white : Colors.black54,
                fontFamily: 'Jazeera-Regular',
              ),
            ),
          ],
        )
      ],
    );
  }
}
