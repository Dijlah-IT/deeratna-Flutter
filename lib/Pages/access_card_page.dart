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
  static final List _doorsList =
      ConstUserInformations.json!['houses'][0]['city']['gates'];
  final Map<String, bool> _doors = {};
  @override
  void initState() {
    super.initState();
    for (var i = 0; i < _doorsList.length; i++) {
      _doors.addAll({
        ConstUserInformations.json!['houses'][0]['city']['gates'][i]['name']:
            false
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
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
        child: Column(
          children: <Widget>[
            Center(
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
                        offset: const Offset(0, 0),
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
                        child: Row(
                          textDirection: TextDirection.rtl,
                          children: <Widget>[
                            SvgPicture.asset(
                              './Assets/images/41.svg',
                              width: 30,
                              height: 30,
                              fit: BoxFit.fill,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              arguments['username'],
                              style: const TextStyle(
                                fontFamily: 'Jazeera-Regular',
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 500,
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
                                  labelText: 'رمز البطاقة',
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
                            const SizedBox(height: 20),
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
                                    controller: ScrollController(
                                        keepScrollOffset: false),
                                    childAspectRatio:
                                        (((size.height - kToolbarHeight) /
                                                2.0) /
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
                                            'فعالة',
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
                            Divider(
                              color: Constants.lineColor.withAlpha(50),
                            ),
                            const SizedBox(height: 10),
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
                                'تاريخ النفاذ :   ${BoardDateFormat('yyyy/MM/dd').format(effectiveDate)}',
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
                            const SizedBox(height: 10),
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                textDirection: TextDirection.rtl,
                                children: [
                                  Text(
                                    'البوابات:',
                                    style: TextStyle(
                                      color: Constants.textColor,
                                      fontSize: 15,
                                      fontFamily: 'Jazeera-Bold',
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    width: size.width,
                                    child: Wrap(
                                      direction: Axis.horizontal,
                                      children: List.generate(
                                        _doors.length,
                                        (index) => Row(
                                          textDirection: TextDirection.rtl,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Checkbox(
                                              value: _doors[
                                                  _doors.keys.elementAt(index)],
                                              checkColor: Colors.white,
                                              activeColor:
                                                  Constants.headerColor,
                                              onChanged: (value) {
                                                setState(() {
                                                  _doors[_doors.keys
                                                          .elementAt(index)] =
                                                      value!;
                                                });
                                              },
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                            ),
                                            Text(
                                              _doors.keys.elementAt(index),
                                              style: TextStyle(
                                                fontFamily: 'Jazeera-Regular',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  return Constants.isDarkModeEnabled
                      ? Constants.itemColorNight
                      : Constants.textColor;
                }),
              ),
              child: const Text(
                "ارسال",
                style: TextStyle(
                  fontFamily: 'Jazeera-Regular',
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
