import 'package:flutter/material.dart';
import 'package:is_it_busy/screens/editPage.dart';

import 'authScreen.dart';

class ChangePAssScreen extends StatefulWidget {
  @override
  _ChangePAssScreenState createState() => _ChangePAssScreenState();
}

class _ChangePAssScreenState extends State<ChangePAssScreen> {
  @override
  Widget build(BuildContext context) {
    // TextEditingController _passController = TextEditingController();
    bool _obscureText = true;
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
          'Change Password',
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
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  TextFormField(
                    // controller: _passController,
                    key: const ValueKey('currentPassword'),
                    autocorrect: true,
                    obscureText: _obscureText,
                    enableSuggestions: true,
                    textCapitalization: TextCapitalization.words,
                    validator: (val) {
                      if (val!.isEmpty || val.length < 4) {
                        return "Please enter at least 4 characters";
                      }
                      return null;
                    },
                    onSaved: (val) => AuthScreenState.password = val!,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      prefix: const Text(
                        '|',
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
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
                      label: Container(
                        padding: EdgeInsets.only(left: 7),
                        child: const Text(
                          'Current password',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Color.fromRGBO(241, 76, 76, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                // controller: _passController,
                key: const ValueKey('newPassword'),
                autocorrect: true,
                obscureText: _obscureText,
                enableSuggestions: true,
                textCapitalization: TextCapitalization.words,
                validator: (val) {
                  if (val!.isEmpty || val.length < 4) {
                    return "Please enter at least 4 characters";
                  }
                  return null;
                },
                onSaved: (val) => AuthScreenState.password = val!,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  prefix: const Text(
                    '|',
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
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
                  label: Container(
                    padding: EdgeInsets.only(left: 7),
                    child: const Text(
                      'New password',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Color.fromRGBO(241, 76, 76, 1),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                // controller: _passController,
                key: const ValueKey('repeatPassword'),
                autocorrect: true,
                obscureText: _obscureText,
                enableSuggestions: true,
                textCapitalization: TextCapitalization.words,
                validator: (val) {
                  if (val!.isEmpty || val.length < 4) {
                    return "Please enter at least 4 characters";
                  }
                  return null;
                },
                onSaved: (val) => AuthScreenState.password = val!,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  prefix: const Text(
                    '|',
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
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
                  label: Container(
                    padding: EdgeInsets.only(left: 7),
                    child: const Text(
                      'Repeat password',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
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
