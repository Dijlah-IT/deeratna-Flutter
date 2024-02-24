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
              ? Constants.textColorNight
              : Constants.textColor,
        ),
        title: Align(
          child: Padding(
            padding: const EdgeInsets.only(right: 55),
            child: Text(
              "بطاقة دخول",
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Constants.isDarkModeEnabled
                        ? Constants.itemColorNight
                        : Constants.itemColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: size.width,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Constants.isDarkModeEnabled
                              ? Constants.headerColorNight
                              : Constants.headerColor,
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
                              colorFilter: ColorFilter.mode(
                                Constants.isDarkModeEnabled
                                    ? Constants.textColorNight
                                    : Constants.textColor,
                                BlendMode.srcIn,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              arguments['username'],
                              style: TextStyle(
                                fontFamily: 'Jazeera-Regular',
                                color: Constants.isDarkModeEnabled
                                    ? Constants.textColorNight
                                    : Constants.textColor,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 500,
                        decoration: BoxDecoration(
                          color: Constants.isDarkModeEnabled
                              ? Constants.itemColorNight
                              : Constants.itemColor,
                        ),
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: TextFormField(
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  fillColor: Constants.isDarkModeEnabled
                                      ? Constants.itemColorNight
                                      : Constants.itemColor,
                                  filled: true,
                                  labelText: 'رمز البطاقة',
                                  labelStyle: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Jazeera-Regular',
                                    color: Constants.isDarkModeEnabled
                                        ? Colors.white70
                                        : Colors.black87,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Constants.isDarkModeEnabled
                                          ? Colors.white70
                                          : Colors.black87,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Constants.isDarkModeEnabled
                                          ? Colors.white70
                                          : Colors.black87,
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
                                      color: Constants.isDarkModeEnabled
                                          ? Constants.textColorNight
                                          : Constants.textColor,
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
                                      RadioListTile(
                                        tileColor: Colors.red,
                                        visualDensity: const VisualDensity(
                                            horizontal:
                                                VisualDensity.minimumDensity,
                                            vertical:
                                                VisualDensity.minimumDensity),
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        title: Text(
                                          'فعالة',
                                          style: TextStyle(
                                            fontFamily: 'Jazeera-Regular',
                                            fontSize: 13,
                                            color: Constants.isDarkModeEnabled
                                                ? Constants.textColorNight
                                                : Constants.textColor,
                                          ),
                                        ),
                                        groupValue: _arrivalsDepartures,
                                        value: 1,
                                        fillColor: MaterialStateProperty
                                            .resolveWith<Color>(
                                                (Set<MaterialState> states) {
                                          if (states.contains(
                                              MaterialState.disabled)) {
                                            return Colors.grey.withOpacity(.32);
                                          }
                                          return Colors.grey;
                                        }),
                                        onChanged: (value) {
                                          setState(() {
                                            _arrivalsDepartures = 1;
                                          });
                                        },
                                      ),
                                      RadioListTile(
                                        tileColor: Colors.red,
                                        visualDensity: const VisualDensity(
                                            horizontal:
                                                VisualDensity.minimumDensity,
                                            vertical:
                                                VisualDensity.minimumDensity),
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        title: Text(
                                          'غير فعالة',
                                          style: TextStyle(
                                            fontFamily: 'Jazeera-Regular',
                                            fontSize: 13,
                                            color: Constants.isDarkModeEnabled
                                                ? Constants.textColorNight
                                                : Constants.textColor,
                                          ),
                                        ),
                                        groupValue: _arrivalsDepartures,
                                        value: 2,
                                        fillColor: MaterialStateProperty
                                            .resolveWith<Color>(
                                                (Set<MaterialState> states) {
                                          if (states.contains(
                                              MaterialState.disabled)) {
                                            return Colors.grey.withOpacity(.32);
                                          }
                                          return Colors.grey;
                                        }),
                                        onChanged: (value) {
                                          setState(() {
                                            _arrivalsDepartures = 2;
                                          });
                                        },
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
                                      ? Constants.headerColorNight
                                      : Constants.headerColor;
                                }),
                              ),
                              child: Text(
                                'تاريخ النفاذ :   ${BoardDateFormat('yyyy/MM/dd').format(effectiveDate)}',
                                style: TextStyle(
                                  fontFamily: 'Jazeera-Bold',
                                  color: Constants.isDarkModeEnabled
                                      ? Constants.textColorNight
                                      : Constants.textColor,
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
                                    boardTitle: 'تاريخ النفاذ',
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
                                      color: Constants.isDarkModeEnabled
                                          ? Constants.textColorNight
                                          : Constants.textColor,
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
                                              checkColor: Constants
                                                      .isDarkModeEnabled
                                                  ? Constants.textColor
                                                  : Constants.textColorNight,
                                              activeColor:
                                                  Constants.isDarkModeEnabled
                                                      ? Constants.textColorNight
                                                      : Constants.textColor,
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
                                                color: Constants
                                                        .isDarkModeEnabled
                                                    ? Constants.textColorNight
                                                    : Constants.textColor,
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
                      ? Constants.headerColorNight
                      : Constants.headerColor;
                }),
              ),
              child: Text(
                "ارسال",
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
      ),
    );
  }
}
