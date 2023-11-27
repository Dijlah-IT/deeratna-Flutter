import 'dart:async';

import 'package:deeratna/Api/login_api.dart';
import 'package:deeratna/Api/message_posts.dart';
import 'package:deeratna/Components/input_costum.dart';
import 'package:deeratna/Constants/constants.dart';
import 'package:deeratna/Pages/root_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:number_editing_controller/number_editing_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String routName = "RootPage";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const maxSecondesSMS = 20;
  int secondes = maxSecondesSMS;
  String userPhoneNumber = "";
  final loginKey = GlobalKey<FormState>();

  Timer? timer;
  String test = " ";
  void startTimer() {
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

  int _step = 0;
  bool _login = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controllerRegisterPhone = TextEditingController();
    final controllerRegisterSMS = TextEditingController();
    final controllerRegisterPassword = TextEditingController();
    final controllerRegisterPasswordConfirm = TextEditingController();
    final controllerLoginPhone = NumberEditingTextController.integer();
    final controllerLoginPassword = TextEditingController();

    @override
    void dispose() {
      controllerRegisterPhone.dispose();
      controllerRegisterSMS.dispose();
      controllerRegisterPassword.dispose();
      controllerRegisterPasswordConfirm.dispose();
      controllerLoginPhone.dispose();
      controllerLoginPassword.dispose();
      super.dispose();
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
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
                          color: _login
                              ? Colors.transparent
                              : Constants.headerColor,
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
                          color: _login
                              ? Constants.headerColor
                              : Colors.transparent,
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
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                                FocusScope.of(context).unfocus();

                                switch (_step) {
                                  case 0:
                                    test = "";
                                    debugPrint(controllerRegisterPhone.text);
                                    setState(() {
                                      userPhoneNumber =
                                          controllerRegisterPhone.text;
                                      registerPhone(userPhoneNumber)
                                          .then((value) {
                                        setState(() {
                                          test = Constants.message;
                                          if (Constants.statusCode == 200) {
                                            _step++;
                                          }
                                        });
                                      });
                                    });
                                    break;
                                  case 1:
                                    setState(() {
                                      _step++;
                                    });
                                    // startTimer();
                                    debugPrint(secondes.toString());
                                  case 2:
                                    test = "";
                                    setState(() {
                                      register(
                                              userPhoneNumber,
                                              controllerRegisterPassword.text,
                                              controllerRegisterPasswordConfirm
                                                  .text,
                                              "note-10")
                                          .then((value) {
                                        if (Constants.statusCode == 200) {
                                          getUserInformations(
                                                  Constants.userToken)
                                              .then((value) {
                                            debugPrint(
                                                "${ConstUserInformations.name}<-----");
                                            setState(() {
                                              if (Constants.statusCode == 200) {
                                                _step++;
                                              }
                                            });
                                          });
                                        } else {
                                          setState(() {
                                            test = Constants.message;
                                          });
                                        }
                                      });
                                    });
                                    break;
                                  case 3:
                                    Navigator.popAndPushNamed(
                                      context,
                                      RootPage.routName,
                                    );
                                    break;
                                }
                                ;
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
                                      : Constants.headerColor,
                                ),
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
                          state: _step > 0
                              ? StepState.complete
                              : StepState.indexed,
                          // RegisterPhone
                          content: TextFormFieldCostum(
                            isEmptyTitle: "أدخل رقم هاتفك المحمول",
                            maxLength: 12,
                            lengthErrorTitle:
                                "أدخل رقم هاتفك المحمول بشكل صحيح",
                            labelTitle: "رقم الهاتف الجوال",
                            helperTitle: test,
                            inputType: TextInputType.text,
                            obscureText: false,
                            inputIcon: Icons.phone_android_rounded,
                            controller: controllerRegisterPhone,
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
                          state: _step > 1
                              ? StepState.complete
                              : StepState.indexed,
                          title: const Text(""),
                          content: Column(
                            children: [
                              // RegisterSMS
                              TextFormFieldCostum(
                                isEmptyTitle: "يرجى ادخال الرمز بشكل صحيح",
                                maxLength: 1000,
                                lengthErrorTitle: "",
                                labelTitle: "رمز التحقق",
                                helperTitle:
                                    "اكتب رمز التحقق الذي يصل على رقم هاتفك",
                                inputType: TextInputType.phone,
                                obscureText: false,
                                inputIcon: Icons.sms,
                                controller: controllerRegisterSMS,
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
                                            decoration:
                                                TextDecoration.underline,
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
                                                child:
                                                    CircularProgressIndicator(
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
                          state: _step > 2
                              ? StepState.complete
                              : StepState.indexed,
                          title: const Text(""),
                          content: Column(
                            children: <Widget>[
                              TextFormFieldCostum(
                                isEmptyTitle: "أدخل رقم هاتفك المحمول",
                                maxLength: 1000,
                                lengthErrorTitle:
                                    "أدخل رقم هاتفك المحمول بشكل صحيح",
                                labelTitle: "كلمة المرور",
                                helperTitle: test,
                                inputType: TextInputType.text,
                                obscureText: true,
                                inputIcon: Icons.password,
                                controller: controllerRegisterPassword,
                              ),
                              const SizedBox(height: 20),
                              TextFormFieldCostum(
                                isEmptyTitle: "أدخل رقم هاتفك المحمول",
                                maxLength: 1000,
                                lengthErrorTitle:
                                    "أدخل رقم هاتفك المحمول بشكل صحيح",
                                labelTitle: "تكرار كلمة المرور",
                                helperTitle: test,
                                inputType: TextInputType.text,
                                obscureText: true,
                                inputIcon: Icons.password,
                                controller: controllerRegisterPasswordConfirm,
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
                          state: _step > 3
                              ? StepState.complete
                              : StepState.indexed,
                          title: const Text(""),
                          content: Text(
                            "اهلا بك يا ${ConstUserInformations.name}",
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

            Positioned(
              width: size.width,
              height: 40,
              bottom: 210,
              child: Center(
                child: test != ""
                    ? const Text("")
                    : SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                            color: Constants.headerColor,
                            strokeWidth: 2.0,
                            semanticsValue: "mohammad"),
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
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Form(
                      key: loginKey,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 20),
                          TextFormFieldCostum(
                            isEmptyTitle: "أدخل رقم هاتفك المحمول",
                            maxLength: 11000,
                            lengthErrorTitle:
                                "أدخل رقم هاتفك المحمول بشكل صحيح",
                            labelTitle: "رقم الهاتف الجوال",
                            helperTitle:
                                "يجب ادخال الرقم المسجل في قاعدة بيانات النظام",
                            inputType: TextInputType.text,
                            obscureText: false,
                            inputIcon: Icons.phone_android_rounded,
                            controller: controllerLoginPhone,
                          ),
                          const SizedBox(height: 20),
                          TextFormFieldCostum(
                            isEmptyTitle: "اكتب كلمة المرور",
                            maxLength: 1000,
                            lengthErrorTitle: "",
                            labelTitle: "كلمة المرور",
                            helperTitle: "يرجى التأكد من كلمة المرور",
                            inputType: TextInputType.text,
                            obscureText: true,
                            inputIcon: Icons.password,
                            controller: controllerLoginPassword,
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
                              if (loginKey.currentState!.validate()) {
                                debugPrint("qqqq");
                                test = "";
                                debugPrint(controllerLoginPhone.text);
                                setState(() {
                                  login(
                                          controllerLoginPhone.text,
                                          controllerLoginPassword.text,
                                          "note-10")
                                      .then((value) {
                                    getUserInformations(Constants.userToken)
                                        .then((value) {
                                          if(Constants.statusCode == 200){
                                            
                                          }
                                        });
                                  });
                                });
                              }
                            },
                            child: const Text(
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
      ),
    );
  }
}
