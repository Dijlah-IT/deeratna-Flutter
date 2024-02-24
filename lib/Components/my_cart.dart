import 'package:deeratna/Constants/constants.dart';
import 'package:flutter/material.dart';

class MyCart extends StatelessWidget {
  final String title;
  final String description;
  final Widget icon;

  const MyCart({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Constants.isDarkModeEnabled
            ? Constants.itemColorNight
            : Constants.itemColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          textDirection: TextDirection.rtl,
          children: <Widget>[
            Container(
              width: 70,
              height: 70,
              margin: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    width: 1,
                    color: Constants.isDarkModeEnabled
                        ? Constants.lineColorNight
                        : Constants.lineColor,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: icon,
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.rtl,
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      color: Constants.isDarkModeEnabled
                          ? Constants.textColorNight
                          : Constants.textColor,
                      fontFamily: 'Jazeera-Bold',
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.rtl,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    description,
                    style: TextStyle(
                      color: Constants.isDarkModeEnabled
                          ? Constants.textColorNight
                          : Constants.textColor,
                      fontSize: 12,
                      fontFamily: 'Jazeera-Regular',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
