import 'package:deeratna/Components/my_cart.dart';
import 'package:deeratna/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:board_datetime_picker/board_datetime_picker.dart';

class AccessCard extends StatefulWidget {
  const AccessCard({super.key});
  static String routName = "/AccessCard";
  @override
  State<AccessCard> createState() => _AccessCardState();
}

class _AccessCardState extends State<AccessCard> {
  int _arrivalsDepartures = 1;
  final controller = BoardDateTimeController();
  DateTime dateCreated = DateTime.now();
  DateTime effectiveDate = DateTime.now();

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
              "بطاقة دخول",
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
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Constants.textColor,
                    blurRadius: 4,
                    offset: const Offset(0, 0), // Shadow position
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    width: size.width,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Constants.textColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        SvgPicture.asset(
                          './Assets/images/41.svg',
                          width: 40,
                          height: 40,
                          fit: BoxFit.fill,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 600,
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              fillColor: Constants.backGroundColor,
                              filled: true,
                              labelText: 'رمز الملصق',
                              labelStyle: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Jazeera-Regular',
                                color: Constants.headerColor,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Constants.headerColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Constants.headerColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'الحالة:',
                                style: TextStyle(
                                  color: Constants.textColor,
                                  fontSize: 15,
                                  fontFamily: 'Jazeera-Bold',
                                ),
                              ),
                              GridView.count(
                                crossAxisCount: 2,
                                mainAxisSpacing: 0,
                                controller:
                                    ScrollController(keepScrollOffset: false),
                                childAspectRatio:
                                    (((size.height - kToolbarHeight) / 2.0) /
                                        (size.width / 3.0)),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: <Widget>[
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    
                                    children: <Widget>[
                                      Radio(
                                        value: 1,
                                        groupValue: _arrivalsDepartures,
                                        activeColor: Constants.headerColor,
                                        onChanged: (value) {
                                          setState(() {
                                            _arrivalsDepartures = 1;
                                          });
                                        },
                                      ),
                                      const Text(
                                        'دخول وخروج',
                                        style: TextStyle(
                                          fontFamily: 'Jazeera-Regular',
                                          fontSize: 13,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Radio(
                                        value: 2,
                                        groupValue: _arrivalsDepartures,
                                        activeColor: Constants.headerColor,
                                        onChanged: (value) {
                                          setState(() {
                                            _arrivalsDepartures = 2;
                                          });
                                        },
                                      ),
                                      const Text(
                                        'خروج فقط',
                                        style: TextStyle(
                                          fontFamily: 'Jazeera-Regular',
                                          fontSize: 13,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Radio(
                                        value: 3,
                                        groupValue: _arrivalsDepartures,
                                        activeColor: Constants.headerColor,
                                        onChanged: (value) {
                                          setState(() {
                                            _arrivalsDepartures = 3;
                                          });
                                        },
                                      ),
                                      const Text(
                                        'دخول فقط',
                                        style: TextStyle(
                                          fontFamily: 'Jazeera-Regular',
                                          fontSize: 13,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Radio(
                                        value: 4,
                                        groupValue: _arrivalsDepartures,
                                        activeColor: Constants.headerColor,
                                        onChanged: (value) {
                                          setState(() {
                                            _arrivalsDepartures = 4;
                                          });
                                        },
                                      ),
                                      const Text(
                                        'غير فعالة',
                                        style: TextStyle(
                                          fontFamily: 'Jazeera-Regular',
                                          fontSize: 13,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith((states) {
                              return Constants.isDarkModeEnabled
                                  ? Constants.itemColorNight
                                  : Constants.textColor;
                            }),
                          ),
                          child: Text(
                            'تاريخ الانشاء   ${BoardDateFormat('yyyy/MM/dd').format(dateCreated)}',
                            style: const TextStyle(
                              fontFamily: 'Jazeera-Bold',
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          onPressed: () async {
                            final result = await showBoardDateTimePicker(
                              context: context,
                              pickerType: DateTimePickerType.date,
                              options: BoardDateTimeOptions(
                                activeColor: Constants.textColor,
                                showDateButton: false,
                                pickerFormat: PickerFormat.ymd,
                                boardTitle: 'تاريخ الانشاء',
                                boardTitleTextStyle: TextStyle(
                                  color: Constants.textColor,
                                  fontFamily: 'Jazeera-Bold',
                                  fontSize: 16,
                                ),
                              ),
                            );
                            if (result != null) {
                              setState(() => dateCreated = result);
                            }
                          },
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith((states) {
                              return Constants.isDarkModeEnabled
                                  ? Constants.itemColorNight
                                  : Constants.textColor;
                            }),
                          ),
                          child: Text(
                            'تاريخ النفاذ   ${BoardDateFormat('yyyy/MM/dd').format(effectiveDate)}',
                            style: const TextStyle(
                              fontFamily: 'Jazeera-Bold',
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          onPressed: () async {
                            final result = await showBoardDateTimePicker(
                              context: context,
                              pickerType: DateTimePickerType.date,
                              options: BoardDateTimeOptions(
                                activeColor: Constants.textColor,
                                showDateButton: false,
                                pickerFormat: PickerFormat.ymd,
                                boardTitle: 'تاريخ الانشاء',
                                boardTitleTextStyle: TextStyle(
                                  color: Constants.textColor,
                                  fontFamily: 'Jazeera-Bold',
                                  fontSize: 16,
                                ),
                              ),
                            );
                            if (result != null) {
                              setState(() => effectiveDate = result);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
