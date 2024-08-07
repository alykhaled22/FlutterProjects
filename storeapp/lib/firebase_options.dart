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
    apiKey: 'AIzaSyBFDxHemP6Lv7xaIJ4QiPOw8R5nuJYGVCQ',
    appId: '1:635523414693:web:603011b130084260abab4c',
    messagingSenderId: '635523414693',
    projectId: 'store-app-c736c',
    authDomain: 'store-app-c736c.firebaseapp.com',
    storageBucket: 'store-app-c736c.appspot.com',
    measurementId: 'G-ZC8QZ5WNKK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCJc4EG1mQwh6ofRKolAyyj-m8yVNnmdr0',
    appId: '1:635523414693:android:370e0bfe2b80689babab4c',
    messagingSenderId: '635523414693',
    projectId: 'store-app-c736c',
    storageBucket: 'store-app-c736c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAV6ahcM-hst5a-I8Wa_DA_s9YOKZNkdUc',
    appId: '1:635523414693:ios:af713bf06c483df8abab4c',
    messagingSenderId: '635523414693',
    projectId: 'store-app-c736c',
    storageBucket: 'store-app-c736c.appspot.com',
    iosBundleId: 'com.example.storeapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAV6ahcM-hst5a-I8Wa_DA_s9YOKZNkdUc',
    appId: '1:635523414693:ios:af713bf06c483df8abab4c',
    messagingSenderId: '635523414693',
    projectId: 'store-app-c736c',
    storageBucket: 'store-app-c736c.appspot.com',
    iosBundleId: 'com.example.storeapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBFDxHemP6Lv7xaIJ4QiPOw8R5nuJYGVCQ',
    appId: '1:635523414693:web:bb0a2adedda8eaecabab4c',
    messagingSenderId: '635523414693',
    projectId: 'store-app-c736c',
    authDomain: 'store-app-c736c.firebaseapp.com',
    storageBucket: 'store-app-c736c.appspot.com',
    measurementId: 'G-D67N20JQ4W',
  );
}
