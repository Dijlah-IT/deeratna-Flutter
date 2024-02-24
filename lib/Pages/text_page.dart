import 'package:deeratna/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class TextPage extends StatefulWidget {
  static String routName = "/TextPage";
  const TextPage({
    super.key,
  });

  @override
  State<TextPage> createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
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
              arguments['title'],
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
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Html(
            data: """
      <!DOCTYPE html>
        <html dir='rtl'>
          <body>
          <div style='direction: rtl;'>${arguments['text']}</div>
          </body>
        </html>
      """,
            style: {
              "p": Style(
                textAlign: TextAlign.justify,
              ),
              "div": Style(
                fontFamily: 'Jazeera-Regular',
                lineHeight: const LineHeight(2.1),
                fontSize: FontSize(16),
                textAlign: TextAlign.justify,
              ),
            },
          ),
        ),
      ),
    );
  }
}
