import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:is_it_busy/screens/authScreen.dart';
import 'package:is_it_busy/screens/editBussScreen.dart';
import 'package:is_it_busy/screens/splashScreen.dart';

import '../widget/home/homeBussScreen.dart';
import 'changePassScreen.dart';

class EditBussPage extends StatefulWidget {
  @override
  _EditBussPageState createState() => _EditBussPageState();
}

class _EditBussPageState extends State<EditBussPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(
            context,
            MaterialPageRoute(builder: (BuildContext context) {
              return HomeBussScreen();
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
              height: 28,
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
                'Glendale Galleria',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(top: 7),
              child: const Text(
                'www.glendalegalleria.com',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.8,
                    fontSize: 14,
                    color: Colors.grey),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 65, right: 65),
              child: Expanded(
                child: Container(
                  height: 70,
                  padding: const EdgeInsets.all(10),
                  // height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 30,
                        height: 35,
                        // padding: const EdgeInsets.only(bottom: 12),
                        child: buildBussStates(
                          const Color.fromRGBO(224, 32, 32, 1),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 30,
                        height: 35,
                        // padding: const EdgeInsets.only(bottom: 12),
                        child: buildBussStates(
                          const Color.fromRGBO(250, 100, 0, 1),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 30,
                        height: 35,
                        // padding: const EdgeInsets.only(bottom: 12),
                        child: buildBussStates(
                          const Color.fromRGBO(0, 221, 181, 1),
                        ),
                      ),
                    ],
                  ),
                ),
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
                      'Edit Profile',
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
                      return EditBussScreen();
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
              height: 55,
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
                  print(AuthScreenState.isSignUp);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) {
                      return Splash_screen();
                    }),
                  );
                  //  UserCredential authResult;authResult =
                  await FirebaseAuth.instance.signOut();
                  print(AuthScreenState.isSignUp);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBussStates(Color color) {
    return SizedBox(
      width: 35,
      height: 35,
      child: RawMaterialButton(
        focusElevation: 0,
        disabledElevation: 0,
        elevation: 0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(100))),
        onPressed: () {
          print('Hi');
        },
        autofocus: false,
        fillColor: Colors.white,
        splashColor: color.withOpacity(0.6),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(1.5),
              margin: const EdgeInsets.all(0.2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
              child: Container(
                padding: const EdgeInsets.all(1.2),
                //color: Colors.blue,
                // margin: const EdgeInsets.symmetric(
                //     horizontal: 3),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Container(
                  padding: const EdgeInsets.all(4.5),
                  //color: Colors.blue,
                  child: null,
                  // margin: const EdgeInsets.symmetric(
                  //     horizontal: 3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
