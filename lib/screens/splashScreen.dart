import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:is_it_busy/screens/homeScreen.dart';
import 'package:is_it_busy/screens/welcomeScreen.dart';

import '../widget/home/homeBussScreen.dart';

class Splash_screen extends StatefulWidget {
  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  // var userData;
  UserCredential? authResult;
  final user = FirebaseAuth.instance.currentUser;
  // void getData() async {
  //   CollectionReference dataa = FirebaseFirestore.instance
  //       .collection('users')
  //       .doc('businessUser')
  //       .collection('authData')
  //       .doc(authResult.user!.uid) as CollectionReference<Object?>;
  //   await dataa.get().then((value) {
  //     value.docs.forEach((element) {
  //       setState(() {
  //         print('$element');
  //         print('$userData');
  //         userData = element.data();
  //         print('$userData');
  //       });
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: EasySplashScreen(
          logoSize: 270,
          logo: Image.asset('assets/images/logo.png'),
          backgroundColor: const Color.fromRGBO(243, 244, 252, 1),
          showLoader: false,
          navigator: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (ctx, snapShot) {
              if (snapShot.hasData) {
                return HomeBussScreen();
                // return HomeScreen();
              } else {
                return WelcomeScreen();
              }

              // var userData = snapShot.data!.docs;

              // if (snapShot.hasData) {
              //   return HomeScreen();
              // } else {
              //   return WelcomeScreen();
              // }
              // FirebaseFirestore.instanceFirebaseAuth.instance.authStateChanges(),
              //     .collection('users')
              //     .doc('narmalUser')
              //     .collection('authData')
              //     .doc(user!.uid)
              //     .snapshots(),
              // var userData = snapShot.data.docs;
              //print('${userData['isBusiness']}');
              // if (snapShot.hasError) {
              //   print('Error loading data: ${snapShot.error!}');
              // }
              // if (snapShot.hasData &&
              //     userData['isBusiness'] == true &&
              //     userData['isBusiness'] != null) {
              //   return HomeBussScreen();
              // } else if (snapShot.hasData && userData['isBusiness'] == null) {
              //   return HomeScreen();
              // } else {
              //   return WelcomeScreen();
              // }
              /*
              if (snapShot.hasData && snapShot.data!['isBusiness'] == true) {
                return HomeBussScreen();
              } else if (snapShot.hasError &&
                  snapShot.data!['isBusiness'] == false) {
                return HomeScreen();
              } else {
                return WelcomeScreen();
              }


               */
            },
          ),
          durationInSeconds: 3,
        ),
      ),
    );
  }
}
