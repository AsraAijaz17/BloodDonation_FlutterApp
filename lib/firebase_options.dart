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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDZQHqjIGqOvFOgde7XNRWzmIJEeB-EEvM',
    appId: '1:732802697439:web:c332b12565a7842fd1016a',
    messagingSenderId: '732802697439',
    projectId: 'flutterproj2-b498e',
    authDomain: 'flutterproj2-b498e.firebaseapp.com',
    storageBucket: 'flutterproj2-b498e.appspot.com',
    measurementId: 'G-NMN6SH13H3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAosrQ4KHHG7OZY-_qb2LH9ClomXvum65c',
    appId: '1:732802697439:android:ad8d09cac1692fb6d1016a',
    messagingSenderId: '732802697439',
    projectId: 'flutterproj2-b498e',
    storageBucket: 'flutterproj2-b498e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBiVKmr_Iznc1EC_8rLyuTyxIFuMVrrSbc',
    appId: '1:732802697439:ios:430ee07e652897d9d1016a',
    messagingSenderId: '732802697439',
    projectId: 'flutterproj2-b498e',
    storageBucket: 'flutterproj2-b498e.appspot.com',
    iosBundleId: 'com.example.flutterproj2',
  );
}
