import 'package:deeratna/Components/my_cart.dart';
import 'package:deeratna/Constants/constants.dart';
import 'package:flutter/material.dart';

class AccessCard extends StatefulWidget {
  const AccessCard({super.key});
  static String routName = "/AccessCard";
  @override
  State<AccessCard> createState() => _AccessCardState();
}

class _AccessCardState extends State<AccessCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backGroundColor,
      appBar: AppBar(
        backgroundColor: Constants.headerColor,
        toolbarHeight: 60,
        iconTheme: IconThemeData(
          color: Constants.lineColor,
        ),
        title:  Align(
          child: Padding(
            padding: const EdgeInsets.only(right: 55),
            child: Text(
              "بطاقة دخول",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Constants.lineColor,
                fontFamily: 'Jazeera-Regular',
              ),
            ),
          ),
        ),
      ),
      body: const Column(
        children: <Widget>[
          MyCart(
              title: "لوريم إيبسوم",
              description:
                  "لوريم إيبسوم هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر",
              icon: Icons.abc_sharp),
          MyCart(
              title: "لوريم إيبسوم",
              description:
                  "لوريم إيبسوم هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر",
              icon: Icons.abc_sharp),
          MyCart(
              title: "لوريم إيبسوم",
              description:
                  "لوريم إيبسوم هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر",
              icon: Icons.abc_sharp),
          MyCart(
              title: "لوريم إيبسوم",
              description:
                  "لوريم إيبسوم هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر",
              icon: Icons.abc_sharp),
        ],
      ),
    );
  }
}
