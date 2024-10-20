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
// web       1:970386558463:web:849eaaecc3e06987e76bca
// android   1:970386558463:android:7a386507ac6824d9e76bca
// ios       1:970386558463:ios:52ebd4fbfc6d0f2de76bca
// macos     1:970386558463:ios:52ebd4fbfc6d0f2de76bca
// windows   1:970386558463:web:5cb9b98510eefea8e76bca
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAGEA85orKzbDENssnDIfJstwSqzV-q-0k',
    appId: '1:970386558463:web:849eaaecc3e06987e76bca',
    messagingSenderId: '970386558463',
    projectId: 'morewin-b80ba',
    authDomain: 'morewin-b80ba.firebaseapp.com',
    storageBucket: 'morewin-b80ba.appspot.com',
    measurementId: 'G-BTVXYT6QZ3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAxj1KTKXHPnNC5VhNraASmaHNrfg0WTy4',
    appId: '1:970386558463:android:7a386507ac6824d9e76bca',
    messagingSenderId: '970386558463',
    projectId: 'morewin-b80ba',
    storageBucket: 'morewin-b80ba.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDReO8kXoefRBqh1rczGMHCMbE1bsIIruQ',
    appId: '1:970386558463:ios:52ebd4fbfc6d0f2de76bca',
    messagingSenderId: '970386558463',
    projectId: 'morewin-b80ba',
    storageBucket: 'morewin-b80ba.appspot.com',
    iosBundleId: 'com.example.morewin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDReO8kXoefRBqh1rczGMHCMbE1bsIIruQ',
    appId: '1:970386558463:ios:52ebd4fbfc6d0f2de76bca',
    messagingSenderId: '970386558463',
    projectId: 'morewin-b80ba',
    storageBucket: 'morewin-b80ba.appspot.com',
    iosBundleId: 'com.example.morewin',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAGEA85orKzbDENssnDIfJstwSqzV-q-0k',
    appId: '1:970386558463:web:5cb9b98510eefea8e76bca',
    messagingSenderId: '970386558463',
    projectId: 'morewin-b80ba',
    authDomain: 'morewin-b80ba.firebaseapp.com',
    storageBucket: 'morewin-b80ba.appspot.com',
    measurementId: 'G-HKRF18H8GZ',
  );
}
