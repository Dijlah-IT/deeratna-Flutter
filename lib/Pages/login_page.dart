import 'package:deeratna/Constants/constants.dart';
import 'package:deeratna/Constants/functions.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String routName = "RootPage";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int step = 0;
  bool _login = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            './Assets/images/login-p.jpg',
            width: size.width,
            height: size.height,
            fit: BoxFit.fill,
          ),
          Positioned(
            width: size.width * 0.7,
            height: 40,
            top: 255,
            right: size.width * 0.15,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Constants.textColor,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 1, color: Constants.headerColor),
              ),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      debugPrint(_login.toString());
                      setState(() {
                        _login = false;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      height: 40,
                      width: (size.width * 0.347),
                      decoration: BoxDecoration(
                        color:
                            _login ? Colors.transparent : Constants.headerColor,
                      ),
                      child: const Center(
                        child: Text(
                          "مستخدم جديد",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Jazeera-Bold',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      debugPrint(_login.toString());
                      setState(() {
                        _login = true;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      height: 40,
                      width: (size.width * 0.347),
                      decoration: BoxDecoration(
                        color:
                            _login ? Constants.headerColor : Colors.transparent,
                      ),
                      child: const Center(
                        child: Text(
                          "تسجيل الدخول",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Jazeera-Bold',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            width: size.width,
            height: size.height * 0.5,
            top: 290,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Theme(
                data: ThemeData(
                  shadowColor: Colors.transparent,
                  canvasColor: Colors.transparent,
                  primarySwatch: getMaterialColor(Constants.headerColor),
                ),
                child: Stepper(
                  controlsBuilder: (context, details) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            if (step > 0) {
                              setState(() {
                                step--;
                              });
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  width: 0.3,
                                  color: Constants.headerColor,
                                )),
                            child: const Text(
                              'السابق',
                              style: TextStyle(
                                fontFamily: 'Jazeera-Regular',
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              if (step < 3) {
                                step++;
                              }
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  width: 0.3,
                                  color: Constants.headerColor,
                                )),
                            child: const Text(
                              'التالي',
                              style: TextStyle(
                                fontFamily: 'Jazeera-Regular',
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  type: StepperType.horizontal,
                  currentStep: step,
                  steps: <Step>[
                    Step(
                      isActive: step != 0 ? false : true,
                      title: Text(""),
                      content: Text(""),
                      label: Text(
                        "الهاتف",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Jazeera-Regular',
                          color:
                              step != 0 ? Colors.grey : Constants.headerColor,
                        ),
                      ),
                    ),
                    Step(
                      isActive: step != 1 ? false : true,
                      title: Text(""),
                      content: Text("2wqeweqw"),
                      label: Text(
                        "التحقق",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Jazeera-Regular',
                          color:
                              step != 1 ? Colors.grey : Constants.headerColor,
                        ),
                      ),
                    ),
                    Step(
                      isActive: step != 2 ? false : true,
                      title: Text(""),
                      content: Text("3ewqwqewe"),
                      label: Text(
                        "الرمز",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Jazeera-Regular',
                          color:
                              step != 2 ? Colors.grey : Constants.headerColor,
                        ),
                      ),
                    ),
                    Step(
                      isActive: step != 3 ? false : true,
                      title: Text(""),
                      content: Text("313222222222"),
                      label: Text(
                        "النهاية",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Jazeera-Regular',
                          color:
                              step != 3 ? Colors.grey : Constants.headerColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
