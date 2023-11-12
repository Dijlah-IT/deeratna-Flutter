import 'package:deeratna/Constants/constants.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  static String routName = "/ProfilePage";

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final List<String> profileItemText = [
      "اسم",
      "رقم الهاتف",
      "المدينة",
      "الزون",
    ];
    final List<String> profileItemText2 = [
      "علاء محمود عبدالله",
      "07818100222",
      "الأمل١",
      "zn-am1",
    ];
    return Scaffold(
      backgroundColor: Constants.backGroundColor,
      body: SingleChildScrollView(
        child: Container(
          color: Constants.backGroundColor,
          height: size.height * 0.8,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 180,
                height: 180,
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Constants.headerColor,
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: Constants.backGroundColor,
                  backgroundImage:
                      const ExactAssetImage('./Assets/images/Profile.jpg'),
                ),
              ),
              const SizedBox(height: 40),
              Column(
                children: List.generate(
                    profileItemText.length,
                    (index) => ProfileItem(
                          title: profileItemText[index],
                          subTitle: profileItemText2[index],
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final String title;
  final String subTitle;

  const ProfileItem({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        // border: Border.all(width: 1.0, color: Constants.lineColor) ,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            width: 180,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Text(
              subTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontFamily: 'Jazeera-Bold',
              ),
            ),
          ),
          Container(
            color: Constants.textColor,
            width: 120,
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontFamily: 'Jazeera-Regular',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
