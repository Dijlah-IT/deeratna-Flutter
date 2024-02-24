import 'package:deeratna/Api/login_api.dart';
import 'package:deeratna/Components/heading.dart';
import 'package:deeratna/Components/input_costum.dart';
import 'package:deeratna/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class QRPage extends StatefulWidget {
  const QRPage({
    super.key,
  });

  static String routName = "/qrcode";
  @override
  State<QRPage> createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  final _controllerGuestName = TextEditingController();
  final _controllerGuestTime = TextEditingController();

  bool _showQrCode = false;
  bool _hasobligation = false;
  final _guestKey = GlobalKey<FormState>();
  final _guestTimeKey = GlobalKey<FormState>();
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
              ? Constants.textColorNight
              : Constants.textColor,
        ),
        title: Align(
          child: Padding(
            padding: const EdgeInsets.only(right: 55),
            child: Text(
              'QR خطار',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Constants.isDarkModeEnabled
                    ? Constants.textColorNight
                    : Constants.textColor,
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
                    Form(
                      key: _guestKey,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextFormField(
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'يرجى كتابة اسم الزائر بشكل صحيح';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                            color: Constants.isDarkModeEnabled
                                ? Constants.textColorNight
                                : Constants.textColor,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                              borderSide: BorderSide(
                                color: Constants.isDarkModeEnabled
                                    ? Constants.textColorNight
                                    : Constants.textColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Constants.isDarkModeEnabled
                                    ? Constants.textColorNight
                                    : Constants.textColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                              borderSide: BorderSide(
                                color: Constants.isDarkModeEnabled
                                    ? Constants.textColorNight
                                    : Constants.textColor,
                              ),
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                            labelText: 'اسم الزائر',
                            helperText: '',
                            labelStyle: TextStyle(
                              color: Constants.isDarkModeEnabled
                                  ? Constants.textColorNight
                                  : Constants.textColor,
                            ),
                            icon: Icon(
                              Icons.person,
                              color: Constants.isDarkModeEnabled
                                  ? Constants.textColorNight
                                  : Constants.textColor,
                            ),
                          ),
                          obscureText: false,
                          controller: _controllerGuestName,
                        ),
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
                          Flexible(
                            child: Form(
                              key: _guestTimeKey,
                              child: TextFormField(
                                validator: (String? value) {
                                  return null;
                                },
                                style: TextStyle(
                                  color: Constants.isDarkModeEnabled
                                      ? Constants.textColorNight
                                      : Constants.textColor,
                                ),
                                controller: _controllerGuestTime,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
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
                        FocusScope.of(context).unfocus();
                        if (_guestKey.currentState!.validate()) {
                          if (_controllerGuestTime.text.isEmpty) {
                            const snackBar = SnackBar(
                              content: Text('يرجى ملئ حقل الساعة'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            debugPrint(
                                (int.parse(_controllerGuestTime.text) * 60)
                                    .toString());
                            setState(() {
                              generateQrCode(
                                _controllerGuestName.text,
                                (int.parse(_controllerGuestTime.text) * 60)
                                    .toString(),
                                Constants.userToken,
                              ).then((value) {
                                debugPrint('THEN');
                                if (Constants.statusCode == 200) {
                                  if (_hasobligation) {
                                    setState(() {
                                      _showQrCode = !_showQrCode;
                                    });
                                  }
                                }
                              });
                            });
                          }
                        }
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
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    QrImageView(
                      backgroundColor: Colors.white,
                      data: ConstUserInformations.qrCode!,
                      version: QrVersions.auto,
                      size: 200.0,
                    ),
                    const SizedBox(
                      height: 20,
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
                          child: InkWell(
                            onTap: () => _shareQRImage(),
                            child: Icon(
                              Icons.share,
                              size: 30,
                              color: Constants.isDarkModeEnabled
                                  ? Constants.textColorNight
                                  : Constants.textColor,
                            ),
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
                          child: InkWell(
                            onTap: () => _dialogBuilder(context),
                            child: Icon(
                              Icons.settings,
                              size: 30,
                              color: Constants.isDarkModeEnabled
                                  ? Constants.textColorNight
                                  : Constants.textColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Constants.isDarkModeEnabled
              ? Constants.headerColorNight
              : Constants.headerColor,
          title: Container(
            height: 200,
            color: Constants.isDarkModeEnabled
                ? Constants.headerColorNight
                : Constants.headerColor,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'تغيير الفترة الزمنية',
                    style: TextStyle(
                      fontSize: 17,
                      color: Constants.isDarkModeEnabled
                          ? Constants.textColorNight
                          : Constants.textColor,
                    ),
                  ),
                  TextFormField(
                    validator: (String? value) {
                      return null;
                    },
                    style: TextStyle(
                      color: Constants.isDarkModeEnabled
                          ? Constants.textColorNight
                          : Constants.textColor,
                    ),
                    controller: _controllerGuestTime,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                  ElevatedButton(
                    child: Text(
                      'تأكيد',
                      style: TextStyle(
                        color: Constants.isDarkModeEnabled
                            ? Constants.headerColorNight
                            : Constants.headerColor,
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future _shareQRImage() async {
    final image = await QrPainter(
      data: ConstUserInformations.qrCode!,
      version: QrVersions.auto,
      gapless: false,
      color: Colors.black,
      emptyColor: Colors.white,
    ).toImageData(200.0);

    const filename = 'qr_code.png';
    final tempDir = await getTemporaryDirectory();
    final file = await File('${tempDir.path}/$filename').create();
    var bytes = image!.buffer.asUint8List();
    await file.writeAsBytes(bytes);
    final path = await Share.shareFiles([file.path],
        text: 'QR code for ${ConstUserInformations.json?['name']}',
        subject: 'QR Code',
        mimeTypes: ['image/png']);
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
