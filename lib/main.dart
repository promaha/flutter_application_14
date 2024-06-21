import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_14/firebase_options.dart';
import 'package:flutter_application_14/login_screen/login_screen.dart';
import 'package:flutter_application_14/screens/home_screen/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_14/constants.dart';
import 'package:flutter_application_14/routes.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //to support arabic language
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        // Locale('en'), // English
        Locale('ar'), // arabic
      ],
      locale: const Locale('ar', 'SA'),
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          primaryColor: kPrimaryColor,
          appBarTheme: AppBarTheme(
            color: kPrimaryColor,
            elevation: 0,
          ),
          textTheme: GoogleFonts.sourceSans3TextTheme(
            Theme.of(context).textTheme.apply().copyWith(
                  bodyLarge: const TextStyle(
                      color: kTextWhiteColor,
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold),
                  titleMedium: const TextStyle(
                      color: kTextWhiteColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300),
                ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            labelStyle:
                TextStyle(fontSize: 15, color: kTextLightColor, height: 0.5),
            hintStyle:
                TextStyle(fontSize: 16, color: kTextBlackColor, height: 0.5),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: kTextLightColor,
                width: 0.7,
              ),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: kTextLightColor,
              ),
            ),
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: kTextLightColor,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: kPrimaryColor,
                width: 0.7,
              ),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: kErrorBorderColor,
                width: 1.2,
              ),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: kErrorBorderColor,
                width: 1.2,
              ),
            ),
          )),
      // initialRoute: OnBoardScreen.routeName,
      //initialRoute: EditProfileScreen.routeName,

      initialRoute: (FirebaseAuth.instance.currentUser != null &&
              FirebaseAuth.instance.currentUser!.emailVerified)
          ? HomeScreen.routeName
          : LoginScreen.routeName,

      // initialRoute: (FirebaseAuth.instance.currentUser == null)
      //     ? LoginScreen.routeName
      //     : HomeScreen.routeName,
      routes: routs,
    );
  }
}
