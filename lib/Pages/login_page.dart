import 'dart:async';

import 'package:deeratna/Components/input_costum.dart';
import 'package:deeratna/Constants/constants.dart';
import 'package:deeratna/Constants/functions.dart';
import 'package:deeratna/Pages/root_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String routName = "RootPage";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const maxSecondesSMS = 20;
  int secondes = maxSecondesSMS;
  Timer? timer;

  void StartTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (secondes > 1) {
          secondes--;
        } else {
          stopTimer();
        }
      });
    });
  }

  void stopTimer() {
    timer?.cancel();
  }

  final _formkey = GlobalKey<FormState>();
  int _step = 0;
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
          // REGISTER
          Positioned(
            width: size.width,
            height: size.height * 0.6,
            top: 290,
            child: Visibility(
              visible: !_login,
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
                          _step != 0 && _step != 3
                              ? TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _step--;
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
                                      'السابق',
                                      style: TextStyle(
                                        fontFamily: 'Jazeera-Regular',
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                )
                              : const Text(""),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                if (_step != 2) {
                                  StartTimer();
                                }

                                if (_step < 3) {
                                  _step++;
                                } else {
                                  Navigator.popAndPushNamed(
                                    context,
                                    RootPage.routName,
                                  );
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
                                  ),
                                  color: _step != 3
                                      ? Colors.transparent
                                      : Constants.headerColor),
                              child: _step != 3
                                  ? const Text(
                                      'التالي',
                                      style: TextStyle(
                                        fontFamily: 'Jazeera-Regular',
                                        fontSize: 16,
                                      ),
                                    )
                                  : const Text(
                                      "دخول",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'Jazeera-Regular',
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      );
                    },
                    type: StepperType.horizontal,
                    currentStep: _step,
                    steps: <Step>[
                      Step(
                        isActive: _step != 0 ? false : true,
                        title: const Text(""),
                        state:
                            _step > 0 ? StepState.complete : StepState.indexed,
                        content: const TextFormFieldCostum(
                          isEmptyTitle: "أدخل رقم هاتفك المحمول",
                          maxLength: 12,
                          lengthErrorTitle: "أدخل رقم هاتفك المحمول بشكل صحيح",
                          labelTitle: "رقم الهاتف الجوال",
                          helperTitle:
                              "يجب ادخال الرقم المسجل في قاعدة بيانات النظام",
                          inputType: TextInputType.phone,
                          obscureText: false,
                          inputIcon: Icons.phone_android_rounded,
                        ),
                        label: Text(
                          "الهاتف",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Jazeera-Regular',
                            color: _step != 0
                                ? Colors.grey
                                : Constants.headerColor,
                          ),
                        ),
                      ),
                      Step(
                        isActive: _step != 1 ? false : true,
                        state:
                            _step > 1 ? StepState.complete : StepState.indexed,
                        title: const Text(""),
                        content: Column(
                          children: [
                            const TextFormFieldCostum(
                              isEmptyTitle: "يرجى ادخال الرمز بشكل صحيح",
                              maxLength: 1000,
                              lengthErrorTitle: "",
                              labelTitle: "رمز التحقق",
                              helperTitle:
                                  "اكتب رمز التحقق الذي يصل على رقم هاتفك",
                              inputType: TextInputType.phone,
                              obscureText: false,
                              inputIcon: Icons.sms,
                            ),
                            const SizedBox(height: 20),
                            Container(
                              child: secondes == 1
                                  ? GestureDetector(
                                      onTap: () {},
                                      child: Text(
                                        "لم تحصل على رمز التحقق؟",
                                        style: TextStyle(
                                          fontFamily: 'Jazeera-Regular',
                                          color: Constants.headerColor,
                                          decoration: TextDecoration.underline,
                                          fontSize: 16,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  : Stack(
                                      children: <Widget>[
                                        Center(
                                          child: SizedBox(
                                            width: 30,
                                            height: 30,
                                            child: Center(
                                              child: CircularProgressIndicator(
                                                strokeWidth: 1.0,
                                                value:
                                                    secondes / maxSecondesSMS,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 3),
                                          child: Center(
                                            child: Text(
                                              '$secondes',
                                              style: const TextStyle(
                                                fontFamily: 'Jazeera-Regular',
                                                fontSize: 15,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                        label: Text(
                          "التحقق",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Jazeera-Regular',
                            color: _step != 1
                                ? Colors.grey
                                : Constants.headerColor,
                          ),
                        ),
                      ),
                      Step(
                        isActive: _step != 2 ? false : true,
                        state:
                            _step > 2 ? StepState.complete : StepState.indexed,
                        title: const Text(""),
                        content: const Column(
                          children: <Widget>[
                            TextFormFieldCostum(
                              isEmptyTitle: "أدخل رقم هاتفك المحمول",
                              maxLength: 1000,
                              lengthErrorTitle:
                                  "أدخل رقم هاتفك المحمول بشكل صحيح",
                              labelTitle: "كلمة المرور",
                              helperTitle: "يرجى التأكد من كلمة المرور",
                              inputType: TextInputType.phone,
                              obscureText: false,
                              inputIcon: Icons.password,
                            ),
                            SizedBox(height: 20),
                            TextFormFieldCostum(
                              isEmptyTitle: "أدخل رقم هاتفك المحمول",
                              maxLength: 1000,
                              lengthErrorTitle:
                                  "أدخل رقم هاتفك المحمول بشكل صحيح",
                              labelTitle: "تكرار كلمة المرور",
                              helperTitle: "يرجى التأكد من مطابقة كلمة المرور",
                              inputType: TextInputType.phone,
                              obscureText: false,
                              inputIcon: Icons.password,
                            ),
                          ],
                        ),
                        label: Text(
                          "الرمز",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Jazeera-Regular',
                            color: _step != 2
                                ? Colors.grey
                                : Constants.headerColor,
                          ),
                        ),
                      ),
                      Step(
                        isActive: _step != 3 ? false : true,
                        state:
                            _step > 3 ? StepState.complete : StepState.indexed,
                        title: const Text(""),
                        content: Text(
                          "اهلا بك يا علی حردان",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Jazeera-Bold',
                            fontSize: 20,
                            color: Constants.headerColor,
                          ),
                        ),
                        label: Text(
                          "النهاية",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Jazeera-Regular',
                            color: _step != 3
                                ? Colors.grey
                                : Constants.headerColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // LOGIN
          Positioned(
            width: size.width,
            height: size.height * 0.6,
            top: 290,
            child: Visibility(
              visible: _login,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
                child: Form(
                  key: _formkey,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 20),
                        const TextFormFieldCostum(
                          isEmptyTitle: "أدخل رقم هاتفك المحمول",
                          maxLength: 12,
                          lengthErrorTitle: "أدخل رقم هاتفك المحمول بشكل صحيح",
                          labelTitle: "رقم الهاتف الجوال",
                          helperTitle:
                              "يجب ادخال الرقم المسجل في قاعدة بيانات النظام",
                          inputType: TextInputType.phone,
                          obscureText: false,
                          inputIcon: Icons.phone_android_rounded,
                        ),
                        const SizedBox(height: 20),
                        const TextFormFieldCostum(
                          isEmptyTitle: "اكتب كلمة المرور",
                          maxLength: 1000,
                          lengthErrorTitle: "",
                          labelTitle: "كلمة المرور",
                          helperTitle: "يرجى التأكد من كلمة المرور",
                          inputType: TextInputType.visiblePassword,
                          obscureText: true,
                          inputIcon: Icons.password,
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith((states) {
                              return Constants.headerColor;
                            }),
                          ),
                          onPressed: () {
                            _formkey.currentState!.validate();
                          },
                          child: Text(
                            "دخول",
                            style: TextStyle(
                              fontFamily: 'Jazeera-Regular',
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
