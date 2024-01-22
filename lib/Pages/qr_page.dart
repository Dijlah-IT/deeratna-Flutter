import 'package:deeratna/Components/heading.dart';
import 'package:deeratna/Components/input_costum.dart';
import 'package:deeratna/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:lottie/lottie.dart';

class QRPage extends StatefulWidget {
  const QRPage({
    super.key,
  });

  static String routName = "/qrcode";
  @override
  State<QRPage> createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  final _controllerUserName = TextEditingController();
  bool _showQrCode = false;
  bool _hasobligation = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.isDarkModeEnabled
          ? Constants.backGroundColorNight
          : Constants.backGroundColor,
      appBar: AppBar(
        backgroundColor: Constants.isDarkModeEnabled
            ? Constants.headerColorNight
            : Constants.headerColor,
        toolbarHeight: 60,
        iconTheme: IconThemeData(
          color: Constants.isDarkModeEnabled
              ? Constants.lineColorNight
              : Constants.lineColor,
        ),
        title: Align(
          child: Padding(
            padding: const EdgeInsets.only(right: 55),
            child: Text(
              'QR خطار',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Constants.isDarkModeEnabled
                    ? Constants.lineColorNight
                    : Constants.lineColor,
                fontFamily: 'Jazeera-Regular',
              ),
            ),
          ),
        ),
      ),
      body: !_showQrCode
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextFormFieldCostum(
                        isEmptyTitle: "اسم الزائر",
                        maxLength: 12,
                        lengthErrorTitle: "اسم الزائر بشكل صحيح",
                        labelTitle: "اسم الزائر",
                        helperTitle: "",
                        inputType: TextInputType.text,
                        obscureText: false,
                        inputIcon: Icons.person,
                        controller: _controllerUserName,
                      ),
                    ),
                    const Heading(
                      title: 'الفترة الزمنية',
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Constants.isDarkModeEnabled
                            ? Constants.headerColorNight
                            : Constants.headerColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(10),
                            color: Constants.isDarkModeEnabled
                                ? Constants.itemColorNight
                                : Constants.itemColor,
                            child: Text(
                              "ساعة",
                              style: TextStyle(
                                fontSize: 18,
                                color: Constants.isDarkModeEnabled
                                    ? Constants.textColorNight
                                    : Constants.textColor,
                                fontFamily: 'Jazeera-Regular',
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Flexible(
                            child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.all(10),
                            color: Constants.isDarkModeEnabled
                                ? Constants.itemColorNight
                                : Constants.itemColor,
                            child: Icon(
                              Icons.timer_outlined,
                              color: Constants.isDarkModeEnabled
                                  ? Constants.textColorNight
                                  : Constants.textColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    Lottie.asset(
                      './Assets/images/Animation-1704283213535.json',
                      width: 250,
                      height: 250,
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    const SizedBox(height: 10),
                    Row(
                      textDirection: TextDirection.rtl,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Checkbox(
                          value: _hasobligation,
                          activeColor: Constants.isDarkModeEnabled
                              ? Constants.textColorNight
                              : Constants.textColor,
                          checkColor: Constants.isDarkModeEnabled
                              ? Constants.textColor
                              : Constants.textColorNight,
                          onChanged: (value) {
                            setState(() {
                              _hasobligation = !_hasobligation;
                            });
                          },
                        ),
                        SizedBox(
                          width: size.width * 0.7,
                          child: Text(
                            "اتعهد بتحمل كافة المسؤوليات في حال مخالفة الزائر للقوانين والضوابط الخاصة بالمجمع السكني.",
                            style: TextStyle(
                              fontFamily: 'Jazeera-Bold',
                              color: Constants.isDarkModeEnabled
                                  ? Constants.textColorNight
                                  : Constants.textColor,
                            ),
                            textAlign: TextAlign.justify,
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (_hasobligation) {
                            _showQrCode = !_showQrCode;
                          }
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith((states) {
                          return _hasobligation
                              ? Constants.isDarkModeEnabled
                                  ? Constants.itemColorNight
                                  : Constants.textColor
                              : Colors.grey;
                        }),
                      ),
                      child: const Text(
                        "التالي",
                        style: TextStyle(
                          fontFamily: 'Jazeera-Regular',
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  SvgPicture.asset(
                    './Assets/images/dijlah-qr.svg',
                    width: size.width,
                    allowDrawingOutsideViewBox: true,
                  ),
                  const SizedBox(height: 50),
                  const WarningMessage(
                    message: 'الـ QR مخصص لزائر واحد فقط',
                    icon: Icons.warning_rounded,
                  ),
                  const WarningMessage(
                    message: 'الـ QR صالح لمدة ٢٤ ساعة',
                    icon: Icons.warning_rounded,
                  ),
                  const WarningMessage(
                    message: 'يرجى قراءة الـ QR عند الخروج',
                    icon: Icons.warning_rounded,
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: Constants.isDarkModeEnabled
                              ? Constants.headerColorNight
                              : Constants.headerColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.share,
                          size: 30,
                          color: Constants.isDarkModeEnabled
                              ? Constants.textColor
                              : Constants.textColorNight,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: Constants.isDarkModeEnabled
                              ? Constants.headerColorNight
                              : Constants.headerColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.settings,
                          size: 30,
                          color: Constants.isDarkModeEnabled
                              ? Constants.textColor
                              : Constants.textColorNight,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}

class WarningMessage extends StatelessWidget {
  final String message;
  final IconData icon;
  const WarningMessage({
    super.key,
    required this.message,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        textDirection: TextDirection.rtl,
        children: <Widget>[
          Icon(
            icon,
            color: Constants.isDarkModeEnabled
                ? Constants.textColorNight
                : Constants.textColor,
            size: 25,
          ),
          const SizedBox(width: 10),
          Text(
            message,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: Constants.isDarkModeEnabled
                  ? Constants.textColorNight
                  : Constants.textColor,
              fontFamily: 'Jazeera-Regular',
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
