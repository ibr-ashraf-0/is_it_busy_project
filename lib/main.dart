import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:is_it_busy/screens/splashScreen.dart';

void main() async {
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAQF7P9lcRgmz8FOvpyw8B5ZTbzP7M8eLw",
      appId: "1:1031538202451:android:ecdaa25198d1fa569233a6",
      messagingSenderId: "1031538202451",
      projectId: "is-it-busy-6584f",
    ),
  );
  runApp(isItBusy_App());
}

class isItBusy_App extends StatelessWidget {
  static const Color primSwatch = Color.fromRGBO(241, 76, 76, 1);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.red,
      ),
      // home: HomeScreen(),
      home: Splash_screen(),
    );
  }
}
