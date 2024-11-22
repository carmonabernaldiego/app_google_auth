// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyAAHOzZCxnXz7fNb8YSoQ8nB_T1_Bk4jaU',
    appId: '1:977944060868:web:cfdfe699b0569b69a1fa91',
    messagingSenderId: '977944060868',
    projectId: 'app--auth-flutter',
    authDomain: 'app--auth-flutter.firebaseapp.com',
    storageBucket: 'app--auth-flutter.firebasestorage.app',
    measurementId: 'G-9WC0KKRVVC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBw8mLeUIziwQfB6REF4-1OnSXugyKVASI',
    appId: '1:977944060868:android:7b9d45ba04d483d9a1fa91',
    messagingSenderId: '977944060868',
    projectId: 'app--auth-flutter',
    storageBucket: 'app--auth-flutter.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCLNAmLCdGkKZbZ6qp7FFXfxRqhyMMoqoA',
    appId: '1:977944060868:ios:293eebfb2adc145aa1fa91',
    messagingSenderId: '977944060868',
    projectId: 'app--auth-flutter',
    storageBucket: 'app--auth-flutter.firebasestorage.app',
    iosBundleId: 'com.example.appGoogleAuth',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCLNAmLCdGkKZbZ6qp7FFXfxRqhyMMoqoA',
    appId: '1:977944060868:ios:293eebfb2adc145aa1fa91',
    messagingSenderId: '977944060868',
    projectId: 'app--auth-flutter',
    storageBucket: 'app--auth-flutter.firebasestorage.app',
    iosBundleId: 'com.example.appGoogleAuth',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAAHOzZCxnXz7fNb8YSoQ8nB_T1_Bk4jaU',
    appId: '1:977944060868:web:19ba3c82ba0892bea1fa91',
    messagingSenderId: '977944060868',
    projectId: 'app--auth-flutter',
    authDomain: 'app--auth-flutter.firebaseapp.com',
    storageBucket: 'app--auth-flutter.firebasestorage.app',
    measurementId: 'G-V1C1V3TH4J',
  );
}
