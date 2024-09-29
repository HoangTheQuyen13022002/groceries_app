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
    apiKey: 'AIzaSyDFx0kz7FYTsZlx8bgIp_A0wu1gtNOD8ds',
    appId: '1:110767419608:web:3331f647dcb1cb3272e7ad',
    messagingSenderId: '110767419608',
    projectId: 'groceries-app-a936d',
    authDomain: 'groceries-app-a936d.firebaseapp.com',
    storageBucket: 'groceries-app-a936d.appspot.com',
    measurementId: 'G-SY7Y2HRHHR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBWYkRD-azmUJoOBBXBNFSWeMmAlmz9XIc',
    appId: '1:110767419608:android:921ea3864807cc3072e7ad',
    messagingSenderId: '110767419608',
    projectId: 'groceries-app-a936d',
    storageBucket: 'groceries-app-a936d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDWXygMc3tvRnYFqFe25GEQ0FZskeUw700',
    appId: '1:110767419608:ios:32c87b5c99c7490972e7ad',
    messagingSenderId: '110767419608',
    projectId: 'groceries-app-a936d',
    storageBucket: 'groceries-app-a936d.appspot.com',
    iosBundleId: 'com.example.groceriesApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDWXygMc3tvRnYFqFe25GEQ0FZskeUw700',
    appId: '1:110767419608:ios:f2fc7a1dc4f4206072e7ad',
    messagingSenderId: '110767419608',
    projectId: 'groceries-app-a936d',
    storageBucket: 'groceries-app-a936d.appspot.com',
    iosBundleId: 'com.example.groceriesApp.RunnerTests',
  );
}
