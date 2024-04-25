import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDrn1Jm3IyOXr2pX11rUMPC6kPKtPmaqk4",
            authDomain: "women-help-2xugo0.firebaseapp.com",
            projectId: "women-help-2xugo0",
            storageBucket: "women-help-2xugo0.appspot.com",
            messagingSenderId: "237330718732",
            appId: "1:237330718732:web:b17e163a28afb463f64e29"));
  } else {
    await Firebase.initializeApp();
  }
}
