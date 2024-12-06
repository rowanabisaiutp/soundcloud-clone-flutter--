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
    apiKey: 'AIzaSyAvXEZMSvjuUCyX__4Nvi6D3BIdCP4wssE',
    appId: '1:276719021239:web:7c55a26dd2927e59067132',
    messagingSenderId: '276719021239',
    projectId: 'soundcloud-b7963',
    authDomain: 'soundcloud-b7963.firebaseapp.com',
    storageBucket: 'soundcloud-b7963.firebasestorage.app',
    measurementId: 'G-X4F0TP9GGL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCP8kYYgXsR8d0hHbQeKhV1WzHqiO4KQSI',
    appId: '1:276719021239:android:a02cee3cbe9ab15c067132',
    messagingSenderId: '276719021239',
    projectId: 'soundcloud-b7963',
    storageBucket: 'soundcloud-b7963.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA_lwKY14krNdoEI8QMbxK32DwSnQDf8Hw',
    appId: '1:276719021239:ios:291b09128a201a44067132',
    messagingSenderId: '276719021239',
    projectId: 'soundcloud-b7963',
    storageBucket: 'soundcloud-b7963.firebasestorage.app',
    androidClientId: '276719021239-4vojnd8fjs6fes78dtscquvbkp1umdgi.apps.googleusercontent.com',
    iosClientId: '276719021239-49kfjb6t3b1fgtebnk725sb4gprg7vpt.apps.googleusercontent.com',
    iosBundleId: 'com.example.music',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA_lwKY14krNdoEI8QMbxK32DwSnQDf8Hw',
    appId: '1:276719021239:ios:291b09128a201a44067132',
    messagingSenderId: '276719021239',
    projectId: 'soundcloud-b7963',
    storageBucket: 'soundcloud-b7963.firebasestorage.app',
    androidClientId: '276719021239-4vojnd8fjs6fes78dtscquvbkp1umdgi.apps.googleusercontent.com',
    iosClientId: '276719021239-49kfjb6t3b1fgtebnk725sb4gprg7vpt.apps.googleusercontent.com',
    iosBundleId: 'com.example.music',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAvXEZMSvjuUCyX__4Nvi6D3BIdCP4wssE',
    appId: '1:276719021239:web:147c30f4f6ec50aa067132',
    messagingSenderId: '276719021239',
    projectId: 'soundcloud-b7963',
    authDomain: 'soundcloud-b7963.firebaseapp.com',
    storageBucket: 'soundcloud-b7963.firebasestorage.app',
    measurementId: 'G-21VF4BQQFZ',
  );
}
