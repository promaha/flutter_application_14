// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC6xtcKylkaARw4SHRMXezO5e1ZYu_vo5M',
    appId: '1:514940852779:web:08d8c6a7eb7b62094f686e',
    messagingSenderId: '514940852779',
    projectId: 'eshara20241',
    authDomain: 'eshara20241.firebaseapp.com',
    storageBucket: 'eshara20241.appspot.com',
    measurementId: 'G-G59CWPD84X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDvH5UCrnWceI-DrnAaZdPmy8PKkrpfX0Y',
    appId: '1:514940852779:android:2e3134b8146041254f686e',
    messagingSenderId: '514940852779',
    projectId: 'eshara20241',
    storageBucket: 'eshara20241.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCzE5FoZP06W7Bh_aULw3Uf6u2nT_RSN6E',
    appId: '1:514940852779:ios:28fb64e388925f0f4f686e',
    messagingSenderId: '514940852779',
    projectId: 'eshara20241',
    storageBucket: 'eshara20241.appspot.com',
    iosBundleId: 'com.example.flutterApplication14',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCzE5FoZP06W7Bh_aULw3Uf6u2nT_RSN6E',
    appId: '1:514940852779:ios:31b7e57ddf4f1f794f686e',
    messagingSenderId: '514940852779',
    projectId: 'eshara20241',
    storageBucket: 'eshara20241.appspot.com',
    iosBundleId: 'com.example.flutterApplication14.RunnerTests',
  );
}
