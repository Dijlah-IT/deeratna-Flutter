import 'package:deeratna/Constants/constants.dart';
import 'package:flutter/material.dart';

class NotifPage extends StatefulWidget {
  const NotifPage({super.key});
  static String routName = "/NotifPage";
  @override
  State<NotifPage> createState() => _NotifPageState();
}

class _NotifPageState extends State<NotifPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
            children: List.generate(
          10,
          (index) => const NotifItem(),
        )),
      ),
    );
  }
}

class NotifItem extends StatelessWidget {
  const NotifItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(5),
          width: size.width,
          decoration: BoxDecoration(
            color: Constants.headerColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(7),
              topRight: Radius.circular(7),
            ),
          ),
          child: Text(
            "لوريم إيبسوم",
            style: TextStyle(
              color: Constants.lineColor,
              fontFamily: 'Jazeera-Bold',
              fontSize: 18,
            ),
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          width: size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Constants.headerColor, width: 0.1)),
          child: const Text(
            "لوريم إيبسوم هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر.",
            style: TextStyle(
              color: Colors.grey,
              fontFamily: 'Jazeera-Regular',
              fontSize: 16,
            ),
            textAlign: TextAlign.justify,
            textDirection: TextDirection.rtl,
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
