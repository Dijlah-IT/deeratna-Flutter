import 'package:deeratna/Constants/constants.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  static String routName = "/AboutPage";
  const AboutPage({
    super.key,
  });

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
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
              ? Constants.lineColorNight
              : Constants.lineColor,
        ),
        title: Align(
          child: Padding(
            padding: const EdgeInsets.only(right: 55),
            child: Text(
              arguments['title'],
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
      body: arguments['isAbout']
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "شركة رائدة في مجال العقارات وإنشاء المدن السكنية وتسويقها وبيعها على شكل قطع سكنية ضمن مربعات سكنية واقــعه ضـمن وحدات جوار بموجب مخططات حضرية رسمية ومعتمدة من الجهــات الحكومـية ذات الأختصاص.\nهدفنا كسب ثقة كل شرائح المجتمع وذالك من خلال تجهيز مشاريع سكنية حضرية حديثة باسعار ميسرة بحيث يكون في متناول جميع فئات المجتمع حيث يتوفر نظام البيع بالأقساط المريحة والميسرة لهذة المشاريع وبهذا يستطيع ذوي الدخل المحدود إمتلاك قطعة أرض .\nالي جانب السجل العقاري ودفتر غرفة الصناعة والتجارة لدينا تصاريح مزاولة المهنة صادرة من هيئة الأراضي والمساحة والتخطيط العمراني بالحديدة، والى جانب هذا نمتلك أكثر من شهادة تقدير وأوسمة من جهات رسمية ومنظمات حقوقية يمنية وعربية الي جانب ذلك لدينا العديد من الشهادات المعتمدة من كل الجهات الحكومية ذات الإختصاص .",
                  style: TextStyle(
                    fontFamily: 'Jazeera-Regular',
                    fontSize: 17,
                    color: Constants.isDarkModeEnabled
                        ? Constants.textColorNight
                        : Constants.textColor,
                  ),
                  textAlign: TextAlign.justify,
                  textDirection: TextDirection.rtl,
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "بامكانك التواصل مع خدمة الدعم الفني على مدار الاسبوع عبر الارقام التالية:\n0780000000\n0770000000",
                style: TextStyle(
                  fontFamily: 'Jazeera-Regular',
                  fontSize: 17,
                  color: Constants.isDarkModeEnabled
                      ? Constants.textColorNight
                      : Constants.textColor,
                ),
                textAlign: TextAlign.justify,
                textDirection: TextDirection.rtl,
              ),
            ),
    );
  }
}
