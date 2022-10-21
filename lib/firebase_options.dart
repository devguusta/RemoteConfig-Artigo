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
    apiKey: 'AIzaSyBDwTiwwRsD99jrdzRSA6-KBhjrc6H0jII',
    appId: '1:728178502284:web:a15a31601cabb4ca5f29a9',
    messagingSenderId: '728178502284',
    projectId: 'article-remote-config',
    authDomain: 'article-remote-config.firebaseapp.com',
    storageBucket: 'article-remote-config.appspot.com',
    measurementId: 'G-DL5GZXXVBD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCHDayC2_zDaMjz3REx0xFZpIjTxH9o7e8',
    appId: '1:728178502284:android:7341e2709aa566b75f29a9',
    messagingSenderId: '728178502284',
    projectId: 'article-remote-config',
    storageBucket: 'article-remote-config.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDKKi_Nzm778GfIZq6Om5hG1-qAK8BHsFk',
    appId: '1:728178502284:ios:046a54235a08353f5f29a9',
    messagingSenderId: '728178502284',
    projectId: 'article-remote-config',
    storageBucket: 'article-remote-config.appspot.com',
    iosClientId: '728178502284-72n9agja5utrl5btpbk1f3fius1uj864.apps.googleusercontent.com',
    iosBundleId: 'com.example.remoteArticle',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDKKi_Nzm778GfIZq6Om5hG1-qAK8BHsFk',
    appId: '1:728178502284:ios:046a54235a08353f5f29a9',
    messagingSenderId: '728178502284',
    projectId: 'article-remote-config',
    storageBucket: 'article-remote-config.appspot.com',
    iosClientId: '728178502284-72n9agja5utrl5btpbk1f3fius1uj864.apps.googleusercontent.com',
    iosBundleId: 'com.example.remoteArticle',
  );
}