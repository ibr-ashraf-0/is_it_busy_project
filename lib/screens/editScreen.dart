import 'package:flutter/material.dart';
import 'package:is_it_busy/screens/editPage.dart';

import 'authScreen.dart';

class EditScreen extends StatefulWidget {
  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
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
              return EditPage();
            }),
          ),
        ),
        title: const Text(
          'Edit Profile',
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
              height: 12,
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    // alignment: Alignment.topCenter,
                    height: 100,
                    width: 100,
                    child: CircleAvatar(
                      radius: 20,
                      child: Image.asset('assets/images/logo.png'),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 25, left: 77),
                    // alignment: Alignment.centeerRight,
                    child: const Icon(
                      Icons.add_circle,
                      size: 22,
                      color: Color.fromRGBO(241, 76, 76, 1),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30.0, left: 30),
              child: TextFormField(
                key: const ValueKey('name'),
                autocorrect: true,
                obscureText: false,
                enableSuggestions: true,
                textCapitalization: TextCapitalization.words,
                validator: (val) {
                  if (val!.isEmpty || val.length < 4) {
                    return "Please enter at least 4 characters";
                  }
                  return null;
                },
                onSaved: (val) => AuthScreenState.userName = val!,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide:
                        const BorderSide(width: 0.0, color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide:
                        const BorderSide(width: 3, color: Colors.redAccent),
                  ),
                  label: const Text(
                    'Name',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Color.fromRGBO(241, 76, 76, 1),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30.0, left: 30, top: 20),
              child: TextFormField(
                key: const ValueKey('email'),
                autocorrect: true,
                obscureText: false,
                enableSuggestions: true,
                textCapitalization: TextCapitalization.none,
                validator: (val) {
                  if (val!.isEmpty || val.length < 4) {
                    return "Please enter a valid email address";
                  }
                  return null;
                },
                onSaved: (val) => AuthScreenState.email = val!,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide:
                        const BorderSide(width: 0.0, color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide:
                        const BorderSide(width: 3, color: Colors.redAccent),
                  ),
                  label: const Text(
                    'Email',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Color.fromRGBO(241, 76, 76, 1),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: 850,
              // padding: const EdgeInsets.only(right: 0.5, left: 0.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 400,
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
                        children: const [
                          Expanded(
                            flex: 3,
                            child: Text(
                              'Save',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {},
                    ),
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
// Container(
// padding: const EdgeInsets.only(top: 200, left: 200),
// child: (
// child: Row(
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// const Text('Log out',
// style: TextStyle(
// color: Color.fromRGBO(241, 76, 76, 1),
// fontSize: 18,
// ),
// ),
// ],
// ),
// ),
// ),
