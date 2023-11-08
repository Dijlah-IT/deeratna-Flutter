import 'package:deeratna/Constants/constants.dart';
import 'package:flutter/material.dart';

class MyCart extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const MyCart({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: Card(
        child: Center(
          child: ListTile(
            title: Text(
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              title,
              style: TextStyle(
                color: Constants.textColor,
                fontFamily: 'Jazeera-Bold',
              ),
            ),
            trailing: Container(
              padding: const EdgeInsets.only(left: 20),
              height: 100,
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    width: 2,
                    color: Constants.lineColor,
                  ),
                ),
              ),
              child: Icon(
                icon,
                size: 45,
                color: Constants.textColor,
              ),
            ),
            subtitle: Text(
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              softWrap: false,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              description,
              style: TextStyle(
                color: Constants.textColor,
                fontFamily: 'Jazeera-Regular',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
