import 'package:deeratna/Constants/constants.dart';
import 'package:deeratna/Pages/root_page.dart';
import 'package:flutter/material.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});
  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  double brightnessValue = 0.0;
  double fontsizeValue = 15.0;
  bool isDarkModeEnabled = false;

  _GetThemeMod() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      isDarkModeEnabled = pref.getBool("isDarkModeEnabled") ?? true;
    });
  }

  _SetThemeMod() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    debugPrint(isDarkModeEnabled.toString());
    await pref.setBool('isDarkModeEnabled', isDarkModeEnabled);
  }

  @override
  void initState() {
    _GetThemeMod();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (BuildContext context) {
        isDarkModeEnabled;
      },
      child: Container(
        decoration: BoxDecoration(
          color: isDarkModeEnabled
              ? Constants.backGroundColorNight
              : Constants.backGroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                "المظهر",
                style: TextStyle(
                  color: isDarkModeEnabled
                      ? Constants.lineColorNight
                      : Constants.lineColor,
                  fontSize: 18,
                  fontFamily: 'Jazeera-Regular',
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  color: isDarkModeEnabled
                      ? Constants.itemColorNight
                      : Constants.itemColor,
                  border: Border.all(
                    width: 0.4,
                    color: isDarkModeEnabled
                        ? Constants.lineColorNight
                        : Constants.lineColor,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "فاتح",
                      style: TextStyle(
                        fontFamily: 'Jazeera-Regular',
                        color: isDarkModeEnabled
                            ? Constants.textColorNight
                            : Constants.textColor,
                        fontSize: 17,
                      ),
                    ),
                    DayNightSwitcher(
                      dayBackgroundColor: Constants.headerColor,
                      isDarkModeEnabled: isDarkModeEnabled,
                      onStateChanged: (isDarkModeEnabled) {
                        setState(() {
                          this.isDarkModeEnabled = isDarkModeEnabled;
                          _SetThemeMod();
                        });
                      },
                    ),
                    Text(
                      "داكن",
                      style: TextStyle(
                        fontFamily: 'Jazeera-Regular',
                        color: isDarkModeEnabled
                            ? Constants.textColorNight
                            : Constants.textColor,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "الاضاءة",
                style: TextStyle(
                  color: isDarkModeEnabled
                      ? Constants.lineColorNight
                      : Constants.lineColor,
                  fontSize: 18,
                  fontFamily: 'Jazeera-Regular',
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: isDarkModeEnabled
                      ? Constants.itemColorNight
                      : Constants.itemColor,
                  border: Border.all(
                    width: 0.4,
                    color: isDarkModeEnabled
                        ? Constants.lineColorNight
                        : Constants.lineColor,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (brightnessValue.toInt() != 0) {
                            brightnessValue--;
                          }
                        });
                      },
                      icon: Icon(
                        Icons.lightbulb_outline,
                        size: 23,
                        color: isDarkModeEnabled
                            ? Constants.textColorNight
                            : Constants.textColor,
                      ),
                    ),
                    SliderTheme(
                      data: SliderThemeData(),
                      child: Slider(
                        min: 0,
                        max: 20,
                        value: brightnessValue,
                        divisions: 20,
                        label: brightnessValue.toInt().toString(),
                        onChanged: (double value) {
                          setState(() {
                            brightnessValue = value;
                          });
                        },
                        activeColor: Constants.textColor,
                        inactiveColor: Constants.backGroundColor,
                        thumbColor: Constants.headerColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (brightnessValue.toInt() < 19) {
                            brightnessValue++;
                          }
                        });
                      },
                      icon: Icon(
                        Icons.lightbulb,
                        color: isDarkModeEnabled
                            ? Constants.textColorNight
                            : Constants.textColor,
                        size: 23,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "حجم النص",
                style: TextStyle(
                  color: isDarkModeEnabled
                      ? Constants.lineColorNight
                      : Constants.lineColor,
                  fontSize: 18,
                  fontFamily: 'Jazeera-Regular',
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: isDarkModeEnabled
                      ? Constants.itemColorNight
                      : Constants.itemColor,
                  border: Border.all(
                    width: 0.4,
                    color: isDarkModeEnabled
                        ? Constants.lineColorNight
                        : Constants.lineColor,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (fontsizeValue.toInt() != 0) {
                            fontsizeValue--;
                          }
                        });
                      },
                      icon: Icon(
                        Icons.exposure_minus_1,
                        size: 23,
                        color: isDarkModeEnabled
                            ? Constants.textColorNight
                            : Constants.textColor,
                      ),
                    ),
                    Slider(
                      min: 15,
                      max: 32,
                      value: fontsizeValue,
                      divisions: 17,
                      label: fontsizeValue.toInt().toString(),
                      onChanged: (double value) {
                        setState(() {
                          fontsizeValue = value;
                        });
                      },
                      activeColor: Constants.textColor,
                      inactiveColor: Constants.backGroundColor,
                      thumbColor: Constants.headerColor,
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (fontsizeValue.toInt() < 31) {
                            fontsizeValue++;
                          }
                        });
                      },
                      icon: Icon(
                        Icons.plus_one,
                        color: isDarkModeEnabled
                            ? Constants.textColorNight
                            : Constants.textColor,
                        size: 23,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
