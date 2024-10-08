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
    apiKey: 'AIzaSyDngchPe95FvBhxHYsU9YyD8uVevw_6xuE',
    appId: '1:386797746887:web:b7a5342b13867c03705ce2',
    messagingSenderId: '386797746887',
    projectId: 'local-notification-flutt-8907c',
    authDomain: 'local-notification-flutt-8907c.firebaseapp.com',
    storageBucket: 'local-notification-flutt-8907c.appspot.com',
    measurementId: 'G-B1K5H2RXLM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDUQyz1IbH7XqDi5zGVn2TAZho89xyTGio',
    appId: '1:386797746887:android:5e73e32ebb01de62705ce2',
    messagingSenderId: '386797746887',
    projectId: 'local-notification-flutt-8907c',
    storageBucket: 'local-notification-flutt-8907c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCa58NjWbPBtd3VFZuzUg3w4Sj00woiBEo',
    appId: '1:386797746887:ios:0c65f2a983641528705ce2',
    messagingSenderId: '386797746887',
    projectId: 'local-notification-flutt-8907c',
    storageBucket: 'local-notification-flutt-8907c.appspot.com',
    iosBundleId: 'com.localNotificationFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCa58NjWbPBtd3VFZuzUg3w4Sj00woiBEo',
    appId: '1:386797746887:ios:0c65f2a983641528705ce2',
    messagingSenderId: '386797746887',
    projectId: 'local-notification-flutt-8907c',
    storageBucket: 'local-notification-flutt-8907c.appspot.com',
    iosBundleId: 'com.localNotificationFlutter',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDngchPe95FvBhxHYsU9YyD8uVevw_6xuE',
    appId: '1:386797746887:web:24ffd8e6f36f32d8705ce2',
    messagingSenderId: '386797746887',
    projectId: 'local-notification-flutt-8907c',
    authDomain: 'local-notification-flutt-8907c.firebaseapp.com',
    storageBucket: 'local-notification-flutt-8907c.appspot.com',
    measurementId: 'G-HK9PMVPWCF',
  );
}
