import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:is_it_busy/screens/editScreen.dart';
import 'package:is_it_busy/screens/homeScreen.dart';
import 'package:is_it_busy/screens/splashScreen.dart';
import 'package:is_it_busy/screens/userFavorite.dart';

import 'changePassScreen.dart';

class EditPage extends StatefulWidget {
  @override
  _EditPAgeState createState() => _EditPAgeState();
}

class _EditPAgeState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) {
              return HomeScreen();
            }),
          ),
        ),
        title: const Text(
          'My Profile',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.normal, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: const Color.fromRGBO(243, 244, 252, 1),
        child: ListView(
          children: [
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: Container(
                // alignment: Alignment.topCenter,
                height: 100,
                width: 100,
                child: CircleAvatar(
                  radius: 20,
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(top: 18),
              child: const Text(
                'Renee P. Warren',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w100),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(top: 6),
              child: const Text(
                'renee p_ warren@gmail.com',
                style: TextStyle(
                  color: Color.fromRGBO(155, 153, 151, 1),
                  fontSize: 15,
                  letterSpacing: 0.4,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 140, vertical: 10),
              child: RawMaterialButton(
                splashColor: Colors.red,
                // for long pees color
                fillColor: const Color.fromRGBO(241, 76, 76, 1),
                highlightColor: Colors.red[200],
                padding: const EdgeInsets.all(15),
                focusColor: const Color.fromRGBO(241, 76, 76, 1),
                autofocus: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5.5,
                    ),
                    Text(
                      'Edit Profile',
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) {
                      return EditScreen();
                    }),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: RawMaterialButton(
                splashColor: Colors.black38,
                fillColor: Colors.white,
                highlightColor: Colors.black38,
                padding: const EdgeInsets.all(15),
                focusColor: Colors.white,
                autofocus: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'My Favorite',
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color.fromRGBO(155, 153, 151, 1),
                    )
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) {
                      return UserFavorite();
                    }),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: RawMaterialButton(
                splashColor: Colors.black38,
                fillColor: Colors.white,
                highlightColor: Colors.black38,
                padding: const EdgeInsets.all(15),
                focusColor: Colors.white,
                autofocus: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Change Password',
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color.fromRGBO(155, 153, 151, 1),
                    )
                  ],
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return ChangePAssScreen();
                  }));
                },
              ),
            ),
            const SizedBox(
              height: 65,
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 140, vertical: 10),
              child: RawMaterialButton(
                splashColor: Colors.red[200],
                fillColor: const Color.fromRGBO(243, 244, 252, 1),
                highlightColor: Colors.red[200],
                focusElevation: 0,
                hoverElevation: 0,
                disabledElevation: 0,
                elevation: 0,
                padding: const EdgeInsets.all(15),
                focusColor: const Color.fromRGBO(243, 244, 252, 1),
                autofocus: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.logout,
                      color: Color.fromRGBO(241, 76, 76, 1),
                    ),
                    Text(
                      'Log out',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(241, 76, 76, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                onPressed: () async {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) {
                      return Splash_screen();
                    }),
                  );
                  UserCredential authResult;
                  await FirebaseAuth.instance.signOut();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
