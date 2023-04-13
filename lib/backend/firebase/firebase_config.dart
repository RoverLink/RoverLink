import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAtrUHirZRKVft74-2KEDe1Awewmx1Vito",
            authDomain: "roverhub-roverlink.firebaseapp.com",
            projectId: "roverhub-roverlink",
            storageBucket: "roverhub-roverlink.appspot.com",
            messagingSenderId: "902226075536",
            appId: "1:902226075536:web:1038d92cc8914a32935d15",
            measurementId: "G-HP938PBTNP"));
  } else {
    await Firebase.initializeApp();
  }
}
