import 'package:deeratna/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotifPage extends StatefulWidget {
  const NotifPage({super.key});
  static String routName = "/NotifPage";

  @override
  State<NotifPage> createState() => _NotifPageState();
}

class _NotifPageState extends State<NotifPage> {
  List<String> titleContent = [];
  List<String> bodyContent = [];
  _getContents() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      titleContent = pref.getStringList("titleContent") ?? [];
      bodyContent = pref.getStringList("bodyContent") ?? [];
    });
  }

  @override
  void initState() {
    _getContents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    debugPrint("${titleContent.length}Notif Size");
    return Container(
      height: size.height,
      padding: const EdgeInsets.all(15),
      child: bodyContent.isNotEmpty
          ? SingleChildScrollView(
              child: Column(
                children: List.generate(
                  bodyContent.length,
                  (index) => NotifItem(
                    body: bodyContent[index],
                    title: titleContent[index],
                  ),
                ),
              ),
            )
          : Center(
              child: Text(
                "لا توجد اشعارات حاليا",
                style: TextStyle(
                    fontFamily: 'Jazeera-Regular',
                    fontSize: 16,
                    color: Constants.isDarkModeEnabled
                        ? Constants.textColorNight
                        : Constants.textColor),
              ),
            ),
    );
  }
}

class NotifItem extends StatelessWidget {
  final String title;
  final String body;
  const NotifItem({
    super.key,
    required this.title,
    required this.body,
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
            color: Constants.isDarkModeEnabled
                ? Constants.headerColorNight
                : Constants.headerColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(7),
              topRight: Radius.circular(7),
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: Constants.isDarkModeEnabled
                  ? Constants.lineColorNight
                  : Constants.lineColor,
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
              color: Constants.isDarkModeEnabled
                  ? Constants.itemColorNight
                  : Constants.itemColor,
              border: Border.all(color: Constants.headerColor, width: 0.1)),
          child: Text(
            body,
            style: const TextStyle(
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
