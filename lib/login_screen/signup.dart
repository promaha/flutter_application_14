import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_14/components/custom_buttons.dart';
import 'package:flutter_application_14/constants.dart';
import 'package:flutter_application_14/login_screen/login_screen.dart';
import 'package:flutter_application_14/screens/home_screen/home_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

late bool _passwordVisible;

class SignupScreen extends StatefulWidget {
  static String routeName = 'SignupScreen';

  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _foemKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = true;
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
                      Text("صفحة انشاء حساب",
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
                          BuildConformPasswordField(),
                          sizedBox,
                          DefaultButton(
                            onPress: () async {
                              if (_foemKey.currentState!.validate()) {
                                Navigator.pushNamedAndRemoveUntil(context,
                                    HomeScreen.routeName, (route) => false);
                              }

                              //   try {
                              //     final credential = await FirebaseAuth.instance
                              //         .createUserWithEmailAndPassword(
                              //       email: emailAddress,
                              //       password: password,
                              //     );
                              //   } on FirebaseAuthException catch (e) {
                              //     if (e.code == 'weak-password') {
                              //       print('The password provided is too weak.');
                              //     } else if (e.code == 'email-already-in-use') {
                              //       print(
                              //           'The account already exists for that email.');
                              //     }
                              //   } catch (e) {
                              //     print(e);
                              //   }
                            },
                            title: " إنشاء حساب",
                            iconData: Icons.arrow_forward_ios_outlined,
                          ),
                          sizedBox,
                        ],
                      ),
                    ),
                    sizedBox,
                    Row(
                      children: [
                        SizedBox(
                          width: 320,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildSocialMediaBtn(
                                color: const Color.fromARGB(255, 59, 89, 152),
                                icon: FontAwesomeIcons.facebook,
                              ),
                              _buildSocialMediaBtn(
                                color: const Color.fromARGB(255, 219, 68, 55),
                                icon: FontAwesomeIcons.google,
                              ),
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
                              context, LoginScreen.routeName);
                        },
                        child: const Text.rich(
                          TextSpan(children: [
                            TextSpan(
                              text: "لديك حساب؟   ",
                              style: TextStyle(
                                  color: kTextBlackColor,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: "تسجيل الدخول",
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

  TextFormField BuildConformPasswordField() {
    return TextFormField(
      obscureText: _passwordVisible,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.visiblePassword,
      style: const TextStyle(
        color: kTextBlackColor,
        fontSize: 17.0,
        fontWeight: FontWeight.w300,
      ),
      decoration: InputDecoration(
        labelText: " تأكيد كلمة المرور",
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
Widget _buildSocialMediaBtn({required Color color, required IconData icon}) {
  return GestureDetector(
    onTap: () {
      // _facebookLogin();
    },
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
