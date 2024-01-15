import 'package:deeratna/Constants/constants.dart';
import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String title;
  const Heading({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(
                Icons.circle,
                color: Constants.isDarkModeEnabled
                    ? Constants.lineColorNight
                    : Constants.lineColor,
                size: 11,
              ),
              Expanded(
                child: Container(
                  height: 1,
                  color: Constants.isDarkModeEnabled
                      ? Constants.lineColorNight
                      : Constants.lineColor,
                ),
              ),
              Icon(
                Icons.circle,
                color: Constants.isDarkModeEnabled
                    ? Constants.lineColorNight
                    : Constants.lineColor,
                size: 11,
              ),
            ],
          ),
          Positioned(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: Constants.isDarkModeEnabled
                    ? Constants.backGroundColorNight
                    : Constants.backGroundColor,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  width: 1.3,
                  color: Constants.isDarkModeEnabled
                      ? Constants.lineColorNight
                      : Constants.lineColor,
                ),
              ),
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Jazeera-Regular',
                  fontSize: 13,
                  color: Constants.isDarkModeEnabled
                      ? Constants.textColorNight
                      : Colors.black87,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
