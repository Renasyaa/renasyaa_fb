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
    apiKey: 'AIzaSyAkBEFfUA1Rpx1vjrV34burriivvc_dYv4',
    appId: '1:875424997321:web:d1edd746035845490c9218',
    messagingSenderId: '875424997321',
    projectId: 'renasyaa-fb',
    authDomain: 'renasyaa-fb.firebaseapp.com',
    storageBucket: 'renasyaa-fb.appspot.com',
    measurementId: 'G-4H7CK1QGW7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCpG75DhzAWk78YmBDMEQmd_AFH_ykWLRc',
    appId: '1:875424997321:android:ff8453fa8ed995020c9218',
    messagingSenderId: '875424997321',
    projectId: 'renasyaa-fb',
    storageBucket: 'renasyaa-fb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAA9UlVCVpqGVcQV8v1WPPUz-G4jSoVJ6U',
    appId: '1:875424997321:ios:cb8e79bf000da1900c9218',
    messagingSenderId: '875424997321',
    projectId: 'renasyaa-fb',
    storageBucket: 'renasyaa-fb.appspot.com',
    iosBundleId: 'com.example.renasyaaFb',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAA9UlVCVpqGVcQV8v1WPPUz-G4jSoVJ6U',
    appId: '1:875424997321:ios:e4c2d9f5fdcca1160c9218',
    messagingSenderId: '875424997321',
    projectId: 'renasyaa-fb',
    storageBucket: 'renasyaa-fb.appspot.com',
    iosBundleId: 'com.example.renasyaaFb.RunnerTests',
  );
}
