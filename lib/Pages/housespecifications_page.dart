import 'package:deeratna/Components/custom_line.dart';
import 'package:deeratna/Components/heading.dart';
import 'package:deeratna/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
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
    var myDouble =
        double.parse(ConstUserInformations.json?['houses'][0]['house_price']);

    final double remainingAmount =
        myDouble - (ConstUserInformations.json!['houses'][0]['paid']);
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
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
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
                              border: Border.all(
                                  width: 1,
                                  color:
                                      const Color.fromARGB(255, 174, 192, 163)),
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
                                            color: Constants.textColor,
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
                                                style: const TextStyle(
                                                  fontFamily: 'Jazeera-Bold',
                                                  fontSize: 16,
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
                                                style: const TextStyle(
                                                  fontFamily: 'Jazeera-Regular',
                                                  fontSize: 12,
                                                  color: Colors.black54,
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
                                            controller: ScrollController(
                                                keepScrollOffset: false),
                                            childAspectRatio: (((size.height -
                                                        kToolbarHeight) /
                                                    2) /
                                                (size.width / 2.5)),
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            children: List.generate(
                                              _specificationsTitle.length,
                                              (index) => Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                ),
                                                child: SpecificationsItem(
                                                  subtitle:
                                                      specificationsSubTitle[
                                                              index]
                                                          .toString(),
                                                  title: _specificationsTitle[
                                                      index],
                                                  icon:
                                                      specificationsIcon[index],
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
                                CostumAccordion(
                                  headerWidget: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                          Text(
                                            '${ConstUserInformations.json!['houses'][0]['house_price']!} IQD',
                                            style: const TextStyle(
                                              fontFamily: 'Jazeera-Regular',
                                              fontSize: 15,
                                              color: Colors.white,
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
                                        percent: ConstUserInformations
                                            .json!['houses'][0]['paid_ratio']
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
                                      CostumPayment(
                                        paymentTitle: 'المبلغ المسدد',
                                        payment: ConstUserInformations
                                            .json!['houses'][0]['paid']
                                            .toString(),
                                      ),
                                      const SizedBox(height: 5),
                                      CostumPayment(
                                        paymentTitle: 'المبلغ المتبقي',
                                        payment: remainingAmount.toString(),
                                      ),
                                      const SizedBox(height: 20),
                                      Column(
                                        children: List.generate(
                                          instalments.length,
                                          (index) => InstalmentsWidget(
                                            instalments: instalments,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                CustomHeadLine(size: size.width * 0.4),
                                CostumAccordion(
                                  headerWidget: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    textDirection: TextDirection.rtl,
                                    children: <Widget>[
                                      const Text(
                                        'الخدمات',
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
                                  contentWidget: Column(
                                    children: [
                                      Text('data'),
                                    ],
                                  ),
                                ),
                                CustomHeadLine(size: size.width * 0.4),
                                CostumAccordion(
                                  headerWidget: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    textDirection: TextDirection.rtl,
                                    children: <Widget>[
                                      const Text(
                                        'الكهرباء',
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
                                  contentWidget: Column(
                                    children: [
                                      Text('111111'),
                                    ],
                                  ),
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
                                  color:
                                      const Color.fromARGB(255, 174, 192, 163)),
                              color: Constants.isDarkModeEnabled
                                  ? Colors.white.withOpacity(0.1)
                                  : const Color.fromARGB(255, 226, 238, 218),
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
                                    (((size.height - kToolbarHeight) / 2.0) /
                                        (size.width / 1.0)),
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
                          CostumAccordion(
                            headerWidget: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              textDirection: TextDirection.rtl,
                              children: <Widget>[
                                const Text(
                                  'الخارطة',
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

class CostumPayment extends StatelessWidget {
  final String paymentTitle;
  final String payment;
  const CostumPayment({
    super.key,
    required this.paymentTitle,
    required this.payment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(payment),
          Text(
            paymentTitle,
            style: const TextStyle(
              fontFamily: 'Jazeera-Regular',
            ),
          ),
        ],
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
          ? Constants.headerColorNight
          : Constants.headerColor,
      contentBackgroundColor:
          Constants.isDarkModeEnabled ? Colors.black54 : Colors.white,
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
      child: Column(
        children: <Widget>[
          DottedBorder(
            radius: const Radius.circular(5),
            color: Constants.textColor,
            dashPattern: const <double>[7, 4],
            borderType: BorderType.RRect,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              width: 60,
              height: 60,
              child: SvgPicture.asset(
                icon,
                width: 32,
                height: 32,
                fit: BoxFit.fill,
                color: Constants.textColor,
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
                  color: Constants.headerColor,
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
