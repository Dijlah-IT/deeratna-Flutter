import 'package:deeratna/Components/custom_line.dart';
import 'package:deeratna/Components/heading.dart';
import 'package:deeratna/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:dotted_border/dotted_border.dart';

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
  static const List<String> facilitiesLightIcon = [
    './Assets/images/facilitiesIcon/Cafes_li.svg',
    './Assets/images/facilitiesIcon/Restaurants_li.svg',
    './Assets/images/facilitiesIcon/gym_li.svg',
    './Assets/images/facilitiesIcon/Methods_li.svg',
    './Assets/images/facilitiesIcon/security_li.svg',
    './Assets/images/facilitiesIcon/shopping_li.svg',
    './Assets/images/facilitiesIcon/stance_li.svg',
    './Assets/images/facilitiesIcon/pool_li.svg',
    './Assets/images/facilitiesIcon/entertainment_li.svg',
  ];
  static const List<String> facilitiesDarkIcon = [
    './Assets/images/facilitiesIcon/Cafes_da.svg',
    './Assets/images/facilitiesIcon/Restaurants_da.svg',
    './Assets/images/facilitiesIcon/gym_da.svg',
    './Assets/images/facilitiesIcon/Methods_da.svg',
    './Assets/images/facilitiesIcon/security_da.svg',
    './Assets/images/facilitiesIcon/shopping_da.svg',
    './Assets/images/facilitiesIcon/stance_da.svg',
    './Assets/images/facilitiesIcon/pool_da.svg',
    './Assets/images/facilitiesIcon/entertainment_da.svg',
  ];

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

  static const List<String> specificationsLightIcon = [
    './Assets/images/specificationsIcon/LandArea_li.svg',
    './Assets/images/specificationsIcon/buildingErea_li.svg',
    './Assets/images/specificationsIcon/Floors_li.svg',
    './Assets/images/specificationsIcon/bedrooms_li.svg',
  ];

  static const List<String> specificationsDarkIcon = [
    './Assets/images/specificationsIcon/LandArea_da.svg',
    './Assets/images/specificationsIcon/buildingErea_da.svg',
    './Assets/images/specificationsIcon/Floors_da.svg',
    './Assets/images/specificationsIcon/bedrooms_da.svg',
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
              ? Constants.textColorNight
              : Constants.textColor,
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
                    ? Constants.textColorNight
                    : Constants.textColor,
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
        child: Stack(
          children: <Widget>[
            Image.network(
              arguments["imageUrl"],
              width: size.width,
              height: 250,
              fit: BoxFit.fill,
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
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
            DraggableScrollableSheet(
                initialChildSize: 0.7,
                minChildSize: 0.7,
                maxChildSize: 1,
                snap: true,
                snapAnimationDuration: const Duration(milliseconds: 400),
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return SingleChildScrollView(
                    controller: scrollController,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Constants.isDarkModeEnabled
                            ? Constants.backGroundColorNight
                            : Constants.backGroundColor,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Heading(title: "تفاصیل العقار"),
                          ),
                          Container(
                            width: size.width,
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Constants.isDarkModeEnabled
                                  ? Constants.itemColorNight
                                  : Constants.itemColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                            colorFilter: ColorFilter.mode(
                                              Constants.isDarkModeEnabled
                                                  ? Constants.textColorNight
                                                  : Constants.textColor,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          const RotationTransition(
                                            turns: AlwaysStoppedAnimation(
                                                90 / 360),
                                            child: CustomHeadLine(size: 40),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                ConstUserInformations
                                                            .json?['houses']
                                                        [arguments['tag']]
                                                    ['city']['name'],
                                                style: TextStyle(
                                                  fontFamily: 'Jazeera-Bold',
                                                  fontSize: 16,
                                                  color: Constants
                                                          .isDarkModeEnabled
                                                      ? Constants.textColorNight
                                                      : Constants.textColor,
                                                ),
                                              ),
                                              Text(
                                                ConstUserInformations
                                                                .json?['houses']
                                                            [arguments['tag']]
                                                        ['zone']['name'] +
                                                    ' - ' +
                                                    ConstUserInformations
                                                                .json?['houses']
                                                            [arguments['tag']]
                                                        ['number'],
                                                style: TextStyle(
                                                  fontFamily: 'Jazeera-Regular',
                                                  fontSize: 12,
                                                  color: Constants
                                                          .isDarkModeEnabled
                                                      ? Constants.textColorNight
                                                      : Constants.textColor,
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
                                        color: const Color.fromARGB(
                                            255, 7, 110, 43),
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
                                const SizedBox(height: 20),
                                CustomHeadLine(size: size.width),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 0,
                                    vertical: 0,
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 0,
                                    ),
                                    decoration: const BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: GridView.count(
                                        crossAxisCount: 2,
                                        controller: ScrollController(
                                            keepScrollOffset: false),
                                        childAspectRatio:
                                            (((size.height - kToolbarHeight) /
                                                    2) /
                                                (size.width / 2.9)),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        children: List.generate(
                                          _specificationsTitle.length,
                                          (index) => Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                            ),
                                            child: Constants.isDarkModeEnabled
                                                ? SpecificationsItem(
                                                    subtitle:
                                                        specificationsSubTitle[
                                                                index]
                                                            .toString(),
                                                    title: _specificationsTitle[
                                                        index],
                                                    icon:
                                                        specificationsDarkIcon[
                                                            index],
                                                  )
                                                : SpecificationsItem(
                                                    subtitle:
                                                        specificationsSubTitle[
                                                                index]
                                                            .toString(),
                                                    title: _specificationsTitle[
                                                        index],
                                                    icon:
                                                        specificationsLightIcon[
                                                            index],
                                                  ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CostumAccordion(
                            headerWidget: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  textDirection: TextDirection.rtl,
                                  children: <Widget>[
                                    Text(
                                      'خطة الدفع',
                                      style: TextStyle(
                                        fontFamily: 'Jazeera-Regular',
                                        fontSize: 15,
                                        color: Constants.isDarkModeEnabled
                                            ? Constants.textColorNight
                                            : Constants.textColor,
                                      ),
                                    ),
                                    Text(
                                      '${ConstUserInformations.json!['houses'][0]['house_price']!} / ${ConstUserInformations.json!['houses'][0]['paid']!}',
                                      style: TextStyle(
                                        fontFamily: 'Jazeera-Regular',
                                        fontSize: 15,
                                        color: Constants.isDarkModeEnabled
                                            ? Constants.textColorNight
                                            : Constants.textColor,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                LinearPercentIndicator(
                                  animation: true,
                                  lineHeight: 15.0,
                                  animationDuration: 500,
                                  barRadius: const Radius.circular(5),
                                  percent: ConstUserInformations.json!['houses']
                                          [0]['paid_ratio']
                                      ?.toDouble(),
                                  isRTL: true,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0.0),
                                  center: Text(
                                    '${ConstUserInformations.json!['houses'][0]['paid_ratio']}%',
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                    ),
                                  ),
                                  progressColor: Constants.textColor,
                                ),
                              ],
                            ),
                            contentWidget: Column(
                              children: <Widget>[
                                Column(
                                  children: List.generate(
                                    instalments.length,
                                    (index) => InstalmentsWidget(
                                      instalments: instalments,
                                      index: (index),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CostumAccordion(
                            headerWidget: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              textDirection: TextDirection.rtl,
                              children: <Widget>[
                                Text(
                                  'الخدمات',
                                  style: TextStyle(
                                    fontFamily: 'Jazeera-Regular',
                                    fontSize: 15,
                                    color: Constants.isDarkModeEnabled
                                        ? Constants.textColorNight
                                        : Constants.textColor,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: CustomHeadLine(size: size.width),
                                ),
                              ],
                            ),
                            contentWidget: Column(
                              children: [
                                Text('data'),
                              ],
                            ),
                          ),
                          CostumAccordion(
                            headerWidget: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              textDirection: TextDirection.rtl,
                              children: <Widget>[
                                Text(
                                  'الكهرباء',
                                  style: TextStyle(
                                    fontFamily: 'Jazeera-Regular',
                                    fontSize: 15,
                                    color: Constants.isDarkModeEnabled
                                        ? Constants.textColorNight
                                        : Constants.textColor,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: CustomHeadLine(size: size.width),
                                ),
                              ],
                            ),
                            contentWidget: Column(
                              children: [
                                Text('111111'),
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
                            padding: const EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                              color: Constants.isDarkModeEnabled
                                  ? Constants.itemColorNight
                                  : Constants.itemColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: GridView.count(
                                crossAxisCount: 3,
                                mainAxisSpacing: 0,
                                controller:
                                    ScrollController(keepScrollOffset: false),
                                childAspectRatio:
                                    (((size.height - kToolbarHeight) / 1.6) /
                                        (size.width / 1.0)),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: List.generate(
                                  facilitiesTitle.length,
                                  (index) => Constants.isDarkModeEnabled
                                      ? FacilitiesItem(
                                          icon: facilitiesDarkIcon[index],
                                          title: facilitiesTitle[index],
                                        )
                                      : FacilitiesItem(
                                          icon: facilitiesLightIcon[index],
                                          title: facilitiesTitle[index],
                                        ),
                                ),
                              ),
                            ),
                          ),
                          CostumAccordion(
                            headerWidget: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              textDirection: TextDirection.rtl,
                              children: <Widget>[
                                Text(
                                  'الخارطة',
                                  style: TextStyle(
                                    fontFamily: 'Jazeera-Regular',
                                    fontSize: 15,
                                    color: Constants.isDarkModeEnabled
                                        ? Constants.textColorNight
                                        : Constants.textColor,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: CustomHeadLine(size: size.width),
                                ),
                              ],
                            ),
                            contentWidget: Column(
                              children: [
                                Image.network(
                                  ConstUserInformations.json?['houses'][0]
                                      ['map']['picture_url'],
                                  width: 90,
                                  height: 250,
                                  fit: BoxFit.fill,
                                  frameBuilder: (context, child, frame,
                                      wasSynchronouslyLoaded) {
                                    return Container(
                                      width: size.width,
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class CostumAccordion extends StatelessWidget {
  const CostumAccordion({
    super.key,
    required this.contentWidget,
    required this.headerWidget,
  });

  final Widget contentWidget;
  final Widget headerWidget;

  @override
  Widget build(BuildContext context) {
    return Accordion(
      headerBackgroundColorOpened: Constants.isDarkModeEnabled
          ? Constants.itemColorNight
          : Constants.itemColor,
      contentBackgroundColor:
          Constants.isDarkModeEnabled ? Colors.black54 : Colors.white,
      contentBorderColor: Constants.isDarkModeEnabled
          ? Constants.itemColorNight
          : Constants.itemColor,
      headerBackgroundColor: Constants.isDarkModeEnabled
          ? Constants.itemColorNight
          : Constants.itemColor,
      contentBorderWidth: 1,
      contentHorizontalPadding: 20,
      paddingListBottom: 0,
      paddingListHorizontal: 0,
      scaleWhenAnimating: false,
      disableScrolling: true,
      openAndCloseAnimation: true,
      children: <AccordionSection>[
        AccordionSection(
          isOpen: false,
          headerBorderColor: Constants.isDarkModeEnabled
              ? Constants.itemColorNight
              : Constants.itemColor,
          headerBorderColorOpened: Constants.isDarkModeEnabled
              ? Constants.itemColorNight
              : Constants.itemColor,
          headerBorderWidth: 1,
          contentVerticalPadding: 15,
          headerPadding: const EdgeInsets.all(10),
          rightIcon: const Text(""),
          header: headerWidget,
          content: contentWidget,
        ),
      ],
    );
  }
}

class InstalmentsWidget extends StatelessWidget {
  const InstalmentsWidget({
    super.key,
    required this.instalments,
    required this.index,
  });

  final List instalments;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 3),
      decoration: BoxDecoration(
        color: Constants.isDarkModeEnabled
            ? Constants.headerColorNight
            : Constants.headerColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: <Widget>[
          Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(9),
            ),
            child: Center(
              child: Text(
                (index + 1).toString(),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            instalments[0]['amount'],
            style: TextStyle(
              color: Constants.isDarkModeEnabled
                  ? Constants.textColorNight
                  : Constants.textColor,
            ),
          ),
          instalments[0]['date'] != null
              ? Expanded(
                  child: Text(
                    instalments[index]['date'],
                    style: TextStyle(
                      color: Constants.isDarkModeEnabled
                          ? Constants.textColorNight
                          : Constants.textColor,
                    ),
                  ),
                )
              : Expanded(
                  child: instalments[index]['type'] == 'بتاريخ معين'
                      ? Text(
                          instalments[index]['date'],
                          style: TextStyle(
                            fontFamily: 'Jazeera-Regular',
                            color: Constants.isDarkModeEnabled
                                ? Constants.textColorNight
                                : Constants.textColor,
                          ),
                        )
                      : Text(
                          instalments[index]['type'],
                          style: TextStyle(
                            fontFamily: 'Jazeera-Regular',
                            color: Constants.isDarkModeEnabled
                                ? Constants.textColorNight
                                : Constants.textColor,
                          ),
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
      child: Column(
        children: <Widget>[
          DottedBorder(
            radius: const Radius.circular(5),
            color: Constants.lineColor,
            dashPattern: const <double>[2, 3],
            borderType: BorderType.RRect,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Constants.isDarkModeEnabled
                    ? Constants.headerColorNight
                    : Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              width: 80,
              height: 60,
              child: SvgPicture.asset(
                colorFilter:
                    ColorFilter.mode(Colors.transparent, BlendMode.difference),
                icon,
                width: 32,
                height: 32,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Jazeera-Bold',
                  fontSize: 13,
                  color: Constants.isDarkModeEnabled
                      ? Constants.textColorNight
                      : Constants.textColor,
                ),
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
        SvgPicture.asset(
          icon,
          width: 40,
          height: 40,
          fit: BoxFit.fill,
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
