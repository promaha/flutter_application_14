import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_14/components/custom_buttons.dart';
import 'package:flutter_application_14/constants.dart';
import 'package:flutter_application_14/controller/auth_controller.dart';
import 'package:flutter_application_14/login_screen/login_screen.dart';
import 'package:flutter_application_14/model/profile_model.dart';
import 'package:flutter_application_14/screens/home_screen/home_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

late bool _passwordVisible;

class SignupScreen extends StatefulWidget {
  static String routeName = 'SignupScreen';

  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _foemKey = GlobalKey<FormState>();
  final controllerModel = ProfileModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = true;
  }

  AuthController auth = AuthController();
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
                          BuildUsernameField(auth.usernameController),
                          sizedBox,
                          BuildEmailField(auth.emailController),
                          sizedBox,
                          BuildPasswordField(auth.passController),
                          sizedBox,
                          BuildConformPasswordField(
                              auth.passController, auth.confimPassController),
                          sizedBox,
                          EasyLoadButton(
                            onPress: () async {
                              // print("عادني فوق");
                              if (_foemKey.currentState!.validate()) {
                                // print("دخلت بالاف الاولى");
                                try {
                                  final credential = await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                    email: auth.emailController.text,
                                    password: auth.passController.text,
                                  );
                                  // if (credential.user!.emailVerified) {
                                  //   Get.offAllNamed("HomeScreen");
                                  //   controllerModel.addUser(
                                  //       "", "", auth.emailController.text, "");
                                  // } else {
                                  // FirebaseAuth.instance.currentUser!
                                  //     .sendEmailVerification();
                                  // AwesomeDialog(
                                  //   context: context,
                                  //   dialogType: DialogType.info,
                                  //   animType: AnimType.rightSlide,
                                  //   title: 'العنوان',
                                  //   desc:
                                  //       'الرجاء التوجه الى بريدك الالكتروني والضغط على رابط التحقق من البريد حتى يتم تفعيل حسابك  ',
                                  // ).show();
                                  Get.offAllNamed("HomeScreen");
                                  controllerModel.addUser(
                                      "", "", auth.emailController.text, "");
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'email-already-in-use') {
                                    print(
                                        'The account already exists for that email.');
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.info,
                                      animType: AnimType.rightSlide,
                                      title: 'عنوان الخطا',
                                      desc: e.message,
                                    ).show();
                                    //print(e.message);
                                  }
                                } catch (e) {
                                  // print(" دخلت الاكسبشن الثانية ");
                                  // print(e);
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.info,
                                    animType: AnimType.rightSlide,
                                    title: 'الخطا',
                                    desc:
                                        "لديك خطأ في انشاء الحساب قم بالتاكد من صحة البيانات",
                                  ).show();
                                }
                              } else {
                                print("not valid");
                              }
                            },
                            title: " إنشاء حساب",
                            // iconData: Icons.arrow_forward_ios_outlined,
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
  TextFormField BuildPasswordField(TextEditingController controller) {
    return TextFormField(
      obscureText: _passwordVisible,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.visiblePassword,
      controller: controller,
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

  TextFormField BuildConformPasswordField(
      TextEditingController passwordController,
      TextEditingController confirmPasswordController) {
    return TextFormField(
      obscureText: _passwordVisible,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.visiblePassword,
      controller: confirmPasswordController,
      style: const TextStyle(
        color: kTextBlackColor,
        fontSize: 17.0,
        fontWeight: FontWeight.w300,
      ),
      decoration: InputDecoration(
        labelText: "تأكيد كلمة المرور",
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
        if (value!.isEmpty) {
          return "يرجى تأكيد كلمة المرور";
        } else if (value != passwordController.text) {
          return "كلمة المرور غير متطابقة";
        }
        return null;
      },
    );
  }

  // ignore: non_constant_identifier_names
  TextFormField BuildEmailField(TextEditingController controller) {
    return TextFormField(
      textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      style: const TextStyle(
        color: kTextBlackColor,
        fontSize: 17.0,
        fontWeight: FontWeight.w300,
      ),
      decoration: const InputDecoration(
        labelText: "البريد الالكتروني",
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

TextFormField BuildUsernameField(TextEditingController controller) {
  return TextFormField(
    textAlign: TextAlign.start,
    keyboardType: TextInputType.emailAddress,
    controller: controller,
    style: const TextStyle(
      color: kTextBlackColor,
      fontSize: 17.0,
      fontWeight: FontWeight.w300,
    ),
    decoration: const InputDecoration(
      labelText: "اسم المستخدم",
      floatingLabelBehavior: FloatingLabelBehavior.always,
      isDense: true,
    ),
    validator: (username) {
      // Username must be between 4 and 20 characters long
      if (username!.length < 4 || username.length > 20) {
        return "عدد الاحرف غير مقبولة ";
      }

      // Username must only contain alphanumeric characters and underscores
      RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9_]+$');
      if (!usernameRegex.hasMatch(username)) {
        return " يجب ان يحتوي على احرف انجليزية او ارقام وبدون مسافات";
      }

      // Username must not start or end with an underscore
      if (username.startsWith('_') || username.endsWith('_')) {
        return "لا يجب ان يبدأ أو ينتهي ب '_'";
      }

      // If all checks pass, the username is valid
      return null;
    },
  );
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
