import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:is_it_busy/widget/auth/authform.dart';

import '../widget/home/homeBussScreen.dart';
import 'homeScreen.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => AuthScreenState();
}

class AuthScreenState extends State<AuthScreen> {
  static bool isSignUp = false;
  static bool isBusiness = false;
  static String bussLocation = '';
  static String email = '';
  static String password = '';
  static String passconfirm = '';
  static String userName = '';
  static final _auth = FirebaseAuth.instance;
  // static final fireStoreDate = FirebaseFirestore.instance.collection('businessUser').doc().snapshots();
  static final user = FirebaseAuth.instance.currentUser;

  _submitAuthForm(
      {required String name,
      required String email,
      required String password,
      required BuildContext ctx}) async {
    UserCredential authResult;
    try {
      if (!isSignUp) {
        authResult = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        Navigator.push(ctx, MaterialPageRoute(builder: (BuildContext context) {
          return HomeScreen();
        }));
      } else if (isSignUp && !isBusiness) {
        authResult = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await FirebaseFirestore.instance
            .collection('users')
            .doc(authResult.user!.uid)
            .set({
          'name': name,
          'password': password,
          'email': email,
          'userId': authResult.user!.uid,
          'isBusiness': isBusiness,
        });
        Navigator.push(ctx, MaterialPageRoute(builder: (BuildContext context) {
          return HomeScreen();
        }));
      } else if (isSignUp && isBusiness) {
        authResult = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await FirebaseFirestore.instance
            .collection('users')
            .doc(authResult.user!.uid)
            .set({
          'name': name,
          'password': password,
          'email': email,
          'userId': authResult.user!.uid,
          'location': bussLocation,
          'isBusiness': isBusiness,
        });
        Navigator.push(ctx, MaterialPageRoute(builder: (BuildContext context) {
          return HomeBussScreen();
        }));
      }
    } on FirebaseAuthException catch (e) {
      String errorMsg = "error Occurred ";
      if (e.code == 'weak-password') {
        errorMsg = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMsg = 'The account already exists for that email.';
      } else if (e.code == 'user-not-found') {
        errorMsg = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMsg = 'Wrong password provided for that user.';
      }
      Scaffold.of(ctx).showSnackBar(SnackBar(
        content: Text(errorMsg),
        backgroundColor: Theme.of(ctx).errorColor,
      ));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // setState(() {
    //   isSignUp = true;
    // });
    return Scaffold(
      backgroundColor: const Color.fromRGBO(243, 244, 252, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 150,
              width: 150,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  const Text(
                    'IS IT BUSY',
                    style: TextStyle(
                      wordSpacing: 2,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  const Text(
                    'lorem ipsum dolor sit amet, consectetur\n addipiscing elit, sed do elusmod',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  AuthForm(
                    submiFun: _submitAuthForm,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
