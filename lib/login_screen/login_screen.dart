import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_14/components/custom_buttons.dart';
import 'package:flutter_application_14/constants.dart';
import 'package:flutter_application_14/controller/auth_controller.dart';
import 'package:flutter_application_14/login_screen/signup.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

late bool _passwordVisible;

class LoginScreen extends StatefulWidget {
  static String routeName = 'LoginScreen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _foemKey = GlobalKey<FormState>();

  final _authController = AuthController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = true;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _authController.emailController.dispose();
    _authController.passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: ListView(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.8,
              // color: kOtherColor,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    "assets/images/splash.png",
                    height: 150,
                    width: 150,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("صفحة تسجيل الدخول",
                          style: TextStyle(
                            fontSize: 25,
                            color: kTextWhiteColor,
                          )),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kDefaultPadding * 3),
                    topRight: Radius.circular(kDefaultPadding * 3)),
                color: kOtherColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(
                  children: [
                    Form(
                      key: _foemKey,
                      child: Column(
                        children: [
                          BuildEmailField(),
                          sizedBox,
                          BuildPasswordField(),
                          sizedBox,
                          DefaultButton(
                            onPress: () async {
                              // print("عادني فوق");

                              if (_foemKey.currentState!.validate()) {
                                // print("دخلت بالاف الاولى");

                                try {
                                  final credential = await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: _authController
                                              .emailController.text,
                                          password: _authController
                                              .passController.text);
                                  // print("نعم انت على صح");
                                  if (credential.user!.emailVerified) {
                                    Get.offAllNamed("HomeScreen");
                                  } else {
                                    FirebaseAuth.instance.currentUser!
                                        .sendEmailVerification();
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.info,
                                      animType: AnimType.rightSlide,
                                      title: 'العنوان',
                                      desc:
                                          'الرجاء التوجه الى بريدك الالكتروني والضغط على رابط التحقق من البريد حتى يتم تفعيل حسابك  ',
                                    ).show();
                                  }
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'user-not-found') {
                                    // print('No user found for that email.');
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.info,
                                      animType: AnimType.rightSlide,
                                      title: 'الخطا',
                                      desc: 'لا يوجد مستخدم بهذا البريد',
                                    ).show();
                                  } else if (e.code == 'wrong-password') {
                                    print(
                                        'Wrong password provided for that user.');
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.info,
                                      animType: AnimType.rightSlide,
                                      title: 'الخطا',
                                      desc: 'كلمة المرور خاطئة',
                                    ).show();
                                  } else if (e.code == 'invalid-credential') {
                                    //لو الايميل خاطئ
                                    print(
                                        'invalid-credential provided for that user.');
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.info,
                                      animType: AnimType.rightSlide,
                                      title: 'الخطا',
                                      desc: 'لا يوجد مستخدم بهذا البريد',
                                    ).show();
                                  } else if (e.message != null &&
                                      e.message!.contains("password")) {
                                    print(
                                        "Wrong password provided for that user.");
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.info,
                                      animType: AnimType.rightSlide,
                                      title: 'الخطا',
                                      desc: 'كلمة المرور خاطئة',
                                    ).show();
                                  } else {
                                    print("email not found");
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.info,
                                      animType: AnimType.rightSlide,
                                      title: 'الخطا',
                                      desc: e.message,
                                    ).show();
                                  }
                                }
                              } else {
                                print("not valide");
                              }
                            },
                            title: "تسجيل الدخول",
                            iconData: Icons.arrow_forward_ios_outlined,
                          ),
                          sizedBox,
                          const Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "نسيت كلمة المرور؟",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: kPrimaryColor, fontSize: 15.0),
                            ),
                          ),
                          sizedBox,
                          Row(
                            children: [
                              SizedBox(
                                width: 320,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    // _buildSocialMediaBtn(
                                    //   color: const Color.fromARGB(
                                    //       255, 59, 89, 152),
                                    //   icon: FontAwesomeIcons.facebook,
                                    // ),
                                    _buildSocialMediaBtn(
                                        color: const Color.fromARGB(
                                            255, 219, 68, 55),
                                        icon: FontAwesomeIcons.google,
                                        onpress: () {
                                          _authController.signInWithGoogle();
                                        }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          sizedBox,
                          Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, SignupScreen.routeName);
                              },
                              child: const Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                    text: "ليس لديك حساب؟   ",
                                    style: TextStyle(
                                        color: kTextBlackColor,
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: "انشاء حساب",
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 15.0,
                                    ),
                                  )
                                ]),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  TextFormField BuildPasswordField() {
    return TextFormField(
      obscureText: _passwordVisible,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.visiblePassword,
      controller: _authController.passController,
      style: const TextStyle(
        color: kTextBlackColor,
        fontSize: 17.0,
        fontWeight: FontWeight.w300,
      ),
      decoration: InputDecoration(
        labelText: "كلمة المرور",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        isDense: true,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
          icon: Icon(_passwordVisible
              ? Icons.visibility_off_outlined
              : Icons.visibility_off_outlined),
        ),
      ),
      validator: (value) {
        if (value!.length < 5) return "يجب ان تكون اكثر من 5 رموز";
        return null;
      },
    );
  }

  // ignore: non_constant_identifier_names
  TextFormField BuildEmailField() {
    return TextFormField(
      textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
      controller: _authController.emailController,
      style: const TextStyle(
        color: kTextBlackColor,
        fontSize: 17.0,
        fontWeight: FontWeight.w300,
      ),
      decoration: const InputDecoration(
        labelText: "رقم الهاتف/الايميل",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        isDense: true,
      ),
      validator: (value) {
        RegExp regExp = RegExp(emailPattern);
        if (value == null || value.isEmpty) {
          return "الرجاء ادخال المطلوب";
        } else if (!regExp.hasMatch(value)) {
          return "الرجاء ادخال ايميل بشكل صحيح";
        }
        return null;
      },
    );
  }
}

// void _facebookLogin() async {
//   final result = await _fb.logIn();

//   switch (result.status) {
//     case FacebookLoginStatus.success:
//       // print(result.accessToken!.token);
//       sendToken(result.accessToken!.token);
//       break;

//     case FacebookLoginStatus.cancel:
//       break;

//     case FacebookLoginStatus.error:
//       print(result.error);
//       break;
//   }
// }
Widget _buildSocialMediaBtn(
    {required Color color,
    required IconData icon,
    required VoidCallback onpress}) {
  // return GFButton(
  //   onPressed: () {},
  //   text: "Google",
  //   icon: FaIcon(icon),
  // );
  return InkWell(
    onTap: onpress,
    child: Container(
      width: 80,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: FaIcon(
          icon,
          color: color,
        ),
      ),
    ),
  );
}
