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
    apiKey: 'AIzaSyDOguBm7_W1cGKl5GKVkcVQ9Fu9Pb9OT7s',
    appId: '1:909932873535:web:c83b4b1c084c3b1059758a',
    messagingSenderId: '909932873535',
    projectId: 'tesla-login-c2e18',
    authDomain: 'tesla-login-c2e18.firebaseapp.com',
    storageBucket: 'tesla-login-c2e18.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBIb1wNKU1UmrOeWVIMOIPS398-owPwlPA',
    appId: '1:909932873535:android:b48349ed82c24a2f59758a',
    messagingSenderId: '909932873535',
    projectId: 'tesla-login-c2e18',
    storageBucket: 'tesla-login-c2e18.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyArUAYBzEB-NiGHf1QHE0OtmapxDZXQYVo',
    appId: '1:909932873535:ios:4acfe0b54e79a43b59758a',
    messagingSenderId: '909932873535',
    projectId: 'tesla-login-c2e18',
    storageBucket: 'tesla-login-c2e18.appspot.com',
    iosBundleId: 'com.example.teslalogin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyArUAYBzEB-NiGHf1QHE0OtmapxDZXQYVo',
    appId: '1:909932873535:ios:bd8c1b619a9c866259758a',
    messagingSenderId: '909932873535',
    projectId: 'tesla-login-c2e18',
    storageBucket: 'tesla-login-c2e18.appspot.com',
    iosBundleId: 'com.example.teslalogin.RunnerTests',
  );
}
