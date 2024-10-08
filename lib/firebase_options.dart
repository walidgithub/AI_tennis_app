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
    apiKey: 'AIzaSyAfgxigW8DzkCCL3owupfOgPILaKsPmeYM',
    appId: '1:115085900335:web:56d45afd3a47ffbc65e4da',
    messagingSenderId: '115085900335',
    projectId: 'weather-bf071',
    authDomain: 'weather-bf071.firebaseapp.com',
    storageBucket: 'weather-bf071.appspot.com',
    measurementId: 'G-MCM3WKTVNP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyADTim5CKJl6zFwfFiWKmyW2zF9va6Kc5o',
    appId: '1:115085900335:android:70d59c77a93a0e5e65e4da',
    messagingSenderId: '115085900335',
    projectId: 'weather-bf071',
    storageBucket: 'weather-bf071.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDm8GB7nwy8vItJJl0pFsWH-3P07Krz-dE',
    appId: '1:115085900335:ios:11f7db7a15c3c61965e4da',
    messagingSenderId: '115085900335',
    projectId: 'weather-bf071',
    storageBucket: 'weather-bf071.appspot.com',
    iosBundleId: 'com.tennis.weather',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDm8GB7nwy8vItJJl0pFsWH-3P07Krz-dE',
    appId: '1:115085900335:ios:fb81cfc035bb30b565e4da',
    messagingSenderId: '115085900335',
    projectId: 'weather-bf071',
    storageBucket: 'weather-bf071.appspot.com',
    iosBundleId: 'com.example.weatherApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAfgxigW8DzkCCL3owupfOgPILaKsPmeYM',
    appId: '1:115085900335:web:3db8b3c77c9cb2ec65e4da',
    messagingSenderId: '115085900335',
    projectId: 'weather-bf071',
    authDomain: 'weather-bf071.firebaseapp.com',
    storageBucket: 'weather-bf071.appspot.com',
    measurementId: 'G-0VRXG2611Q',
  );

}