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
    apiKey: 'AIzaSyCvc8uFvOddXfQGSOWPIPFG_EDh6CA20PQ',
    appId: '1:351879037478:web:8417eadd32223406125ce7',
    messagingSenderId: '351879037478',
    projectId: 'cardapio-8545a',
    authDomain: 'cardapio-8545a.firebaseapp.com',
    storageBucket: 'cardapio-8545a.appspot.com',
    measurementId: 'G-3XBGJ8WCKK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDWdqJ8dYk4zJ6cxyoMbI5Lgz7fq0Y5dUA',
    appId: '1:351879037478:android:aefd335763bf4075125ce7',
    messagingSenderId: '351879037478',
    projectId: 'cardapio-8545a',
    storageBucket: 'cardapio-8545a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDNJjRQ-7q9BaxxhplGRNUrM5ROSZrFRQ0',
    appId: '1:351879037478:ios:57003b594230ea97125ce7',
    messagingSenderId: '351879037478',
    projectId: 'cardapio-8545a',
    storageBucket: 'cardapio-8545a.appspot.com',
    iosBundleId: 'com.fatec.cardapioRestaurante',
  );
}
