import 'package:deeratna/Components/my_cart.dart';
import 'package:deeratna/Constants/constants.dart';
import 'package:deeratna/Pages/access_card_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InformationManagementPage extends StatefulWidget {
  const InformationManagementPage({
    super.key,
  });
  static String routName = "/InformationManagementPage";
  @override
  State<InformationManagementPage> createState() =>
      _InformationManagementPageState();
}

class _InformationManagementPageState extends State<InformationManagementPage> {
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    debugPrint(arguments['editInformation'].toString());
    final List<dynamic> _children = ConstUserInformations.json?['children'];
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
              ? Constants.lineColorNight
              : Constants.lineColor,
        ),
        title: Align(
          child: Padding(
            padding: const EdgeInsets.only(right: 55),
            child: Text(
              "ادارة معلومات",
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Constants.textColor,
                      blurRadius: 4,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Constants.textColor,
                        blurRadius: 4,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: size.width,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Constants.textColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            './Assets/images/44.svg',
                            width: 40,
                            height: 40,
                            fit: BoxFit.fill,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: List.generate(
                            _children.length,
                            (index) => arguments['editInformation']
                                ? MyCart(
                                    title: _children[index]['name'],
                                    description: _children[index]['pivot']
                                        ['relation'],
                                    icon: GestureDetector(
                                      child: Icon(
                                        Icons.edit,
                                        size: 30,
                                        color: Constants.isDarkModeEnabled
                                            ? Constants.textColorNight
                                            : Constants.textColor,
                                      ),
                                      onTap: () {
                                        debugPrint(index.toString());
                                      },
                                    ),
                                  )
                                : MyCart(
                                    title: _children[index]['name'],
                                    description: _children[index]['pivot']
                                        ['relation'],
                                    icon: GestureDetector(
                                      child: Icon(
                                        Icons.add_task_sharp,
                                        size: 30,
                                        color: Constants.isDarkModeEnabled
                                            ? Constants.textColorNight
                                            : Constants.textColor,
                                      ),
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, AccessCard.routName,
                                            arguments: {
                                              'username': _children[index]['name']
                                            });
                                      },
                                    ),
                                  ),
                          ),
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
                      ? Constants.itemColorNight
                      : Constants.textColor;
                }),
              ),
              child: const Text(
                "اضافة",
                style: TextStyle(
                  fontFamily: 'Jazeera-Regular',
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
