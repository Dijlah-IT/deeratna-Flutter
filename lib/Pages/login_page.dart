import 'dart:async';

import 'package:deeratna/Api/login_api.dart';
import 'package:deeratna/Components/input_costum.dart';
import 'package:deeratna/Constants/constants.dart';
import 'package:deeratna/Pages/root_page.dart';
import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String routName = "RootPage";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String userPhoneNumber = "";
  String messageAPI = " ";
  int _step = 0;
  bool _login = true;

  final loginKey = GlobalKey<FormState>();
  final registerPhoneKey = GlobalKey<FormState>();
  final registerSMSKey = GlobalKey<FormState>();
  final registerPasswordKey = GlobalKey<FormState>();

  Timer? timer;
  static const maxSecondesSMS = 20;
  int secondes = maxSecondesSMS;

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

  final controllerRegisterPhone = TextEditingController();
  final controllerRegisterSMS = TextEditingController();
  final controllerRegisterPassword = TextEditingController();
  final controllerRegisterPasswordConfirm = TextEditingController();
  final controllerLoginPhone = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                      colorScheme: ColorScheme.light(primary: Constants.headerColor),
                      canvasColor: Colors.transparent,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stepper(
                        elevation: 0,
                        onStepTapped: (step) {},
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
                                      if (registerPhoneKey.currentState!
                                          .validate()) {
                                        debugPrint("mmmmmmMmmmmmm");
                                        setState(() {
                                          messageAPI = "";
                                          debugPrint(
                                              controllerRegisterPhone.text);
                                          setState(() {
                                            userPhoneNumber =
                                                controllerRegisterPhone.text;
                                            registerPhone(userPhoneNumber)
                                                .then((value) {
                                              setState(() {
                                                messageAPI = Constants.message;
                                                if (Constants.statusCode ==
                                                    200) {
                                                  _step++;
                                                }
                                              });
                                            });
                                          });
                                        });
                                      }

                                      break;
                                    case 1:
                                      if (registerSMSKey.currentState!
                                          .validate()) {
                                        _step++;
                                      } else {
                                        setState(() {
                                          startTimer();
                                        });
                                      }
                                    case 2:
                                      if (registerPasswordKey.currentState!
                                          .validate()) {
                                        messageAPI = "";
                                        setState(() {
                                          register(
                                                  userPhoneNumber,
                                                  controllerRegisterPassword
                                                      .text,
                                                  controllerRegisterPasswordConfirm
                                                      .text,
                                                  "note-10")
                                              .then((value) {
                                            if (Constants.statusCode == 200) {
                                              getUserInformations(
                                                      Constants.userToken)
                                                  .then((value) {
                                                debugPrint(
                                                    "${ConstUserInformations.json?['name']}<-----");
                                                setState(() {
                                                  if (Constants.statusCode ==
                                                      200) {
                                                    _step++;
                                                  }
                                                });
                                              });
                                            } else {
                                              setState(() {
                                                messageAPI = Constants.message;
                                              });
                                            }
                                          });
                                        });
                                      }
                                      break;
                                    case 3:
                                      Navigator.popAndPushNamed(
                                        context,
                                        RootPage.routName,
                                      );
                                      break;
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
                            content: Form(
                              key: registerPhoneKey,
                              child: TextFormFieldCostum(
                                isEmptyTitle: "أدخل رقم هاتفك المحمول",
                                maxLength: 12,
                                lengthErrorTitle:
                                    "أدخل رقم هاتفك المحمول بشكل صحيح",
                                labelTitle: "رقم الهاتف الجوال",
                                helperTitle: messageAPI,
                                inputType: TextInputType.phone,
                                obscureText: false,
                                inputIcon: Icons.phone_android_rounded,
                                controller: controllerRegisterPhone,
                              ),
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
                            content: Form(
                              key: registerSMSKey,
                              child: Column(
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
                                                      value: secondes /
                                                          maxSecondesSMS,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 3),
                                                child: Center(
                                                  child: Text(
                                                    '$secondes',
                                                    style: const TextStyle(
                                                      fontFamily:
                                                          'Jazeera-Regular',
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
                            content: Form(
                              key: registerPasswordKey,
                              child: Column(
                                children: <Widget>[
                                  TextFormFieldCostum(
                                    isEmptyTitle: "كلمة المرور غير صحيحة",
                                    maxLength: 1000,
                                    lengthErrorTitle:
                                        "أدخل رقم هاتفك المحمول بشكل صحيح",
                                    labelTitle: "كلمة المرور",
                                    helperTitle: messageAPI,
                                    inputType: TextInputType.text,
                                    obscureText: true,
                                    inputIcon: Icons.password,
                                    controller: controllerRegisterPassword,
                                  ),
                                  const SizedBox(height: 20),
                                  TextFormFieldCostum(
                                    isEmptyTitle: "كلمة المرور غير صحيحة",
                                    maxLength: 1000,
                                    lengthErrorTitle:
                                        "أدخل رقم هاتفك المحمول بشكل صحيح",
                                    labelTitle: "تكرار كلمة المرور",
                                    helperTitle: messageAPI,
                                    inputType: TextInputType.text,
                                    obscureText: true,
                                    inputIcon: Icons.password,
                                    controller:
                                        controllerRegisterPasswordConfirm,
                                  ),
                                ],
                              ),
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
                              "اهلا بك يا ${ConstUserInformations.json?['name']}",
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
            ),

            Positioned(
              width: size.width,
              height: 40,
              bottom: 210,
              child: Center(
                child: messageAPI != ""
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
                            helperTitle: messageAPI,
                            inputType: TextInputType.number,
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
                            helperTitle: messageAPI,
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
                                messageAPI = "";
                                FocusScope.of(context).unfocus();
                                setState(() {
                                  login(
                                          controllerLoginPhone.text,
                                          controllerLoginPassword.text,
                                          "note-10")
                                      .then((value) {
                                    if (Constants.statusCode == 200) {
                                      getUserInformations(Constants.userToken)
                                          .then((value) {
                                        if (Constants.statusCode == 200) {
                                          final snackBar = SnackBar(
                                            elevation: 0,
                                            margin: const EdgeInsets.only(
                                                bottom: 80),
                                            behavior: SnackBarBehavior.floating,
                                            backgroundColor: Colors.transparent,
                                            content: Directionality(
                                              textDirection: TextDirection.rtl,
                                              child: AwesomeSnackbarContent(
                                                color: Constants
                                                        .isDarkModeEnabled
                                                    ? Constants.lineColorNight
                                                    : Constants.headerColor,
                                                title: 'اهلا بك',
                                                message:
                                                    "اهلا بك يا ${ConstUserInformations.json?['name']}",
                                                contentType:
                                                    ContentType.success,
                                              ),
                                            ),
                                          );
                                          Navigator.popAndPushNamed(
                                            context,
                                            RootPage.routName,
                                          );
                                          ScaffoldMessenger.of(context)
                                            ..hideCurrentSnackBar()
                                            ..showSnackBar(snackBar);
                                        }
                                      });
                                    } else {
                                      setState(() {
                                        messageAPI = Constants.message;
                                      });
                                    }
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
