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
    apiKey: 'AIzaSyAztPNEJdDQ0UIDO-eCyXg5nEfRQuL-r78',
    appId: '1:139709876938:web:93cc69bbcdf84a246cc233',
    messagingSenderId: '139709876938',
    projectId: 'chat-app-947d9',
    authDomain: 'chat-app-947d9.firebaseapp.com',
    storageBucket: 'chat-app-947d9.appspot.com',
    measurementId: 'G-GGWL26SK4F',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB-Q7wWM8XWxa2L44xLf-kmzGqW4AWjE5U',
    appId: '1:139709876938:android:797c0ab0cc6eef3c6cc233',
    messagingSenderId: '139709876938',
    projectId: 'chat-app-947d9',
    storageBucket: 'chat-app-947d9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCiPpnbf6-y6B_fEJh06cT-Tse0nVhZ6Uw',
    appId: '1:139709876938:ios:bdea67c14d693da06cc233',
    messagingSenderId: '139709876938',
    projectId: 'chat-app-947d9',
    storageBucket: 'chat-app-947d9.appspot.com',
    iosClientId: '139709876938-19a0mmtltndrjm5to6fsn3esaphq5t5k.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCiPpnbf6-y6B_fEJh06cT-Tse0nVhZ6Uw',
    appId: '1:139709876938:ios:84162d373edbd9556cc233',
    messagingSenderId: '139709876938',
    projectId: 'chat-app-947d9',
    storageBucket: 'chat-app-947d9.appspot.com',
    iosClientId: '139709876938-a96qps57mua2bmss1a2evt2jniuc8jgt.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}
