import 'package:flutter/material.dart';

class ResetPassScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(243, 244, 252, 1),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(28, 8, 28, 8),
            child: Image.asset(
              'assets/images/logo.png',
              height: 200,
              width: 200,
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(8, 2, 0, 2),
            child: Text(
              'Reset your password',
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, wordSpacing: 4),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(8, 2, 0, 2),
            child: Text(
              'lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextFormField(
              key: const ValueKey('resetPass'),
              autocorrect: false,
              enableSuggestions: true,
              textCapitalization: TextCapitalization.none,
              validator: (val) {
                if (val!.isEmpty || !val.contains('@')) {
                  return "Please enter a valid email address";
                }
                return null;
              },
              //   onSaved: (val) => _email = val!,
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
                    Icons.email,
                    color: Color.fromRGBO(241, 76, 76, 1),
                  )),
              style: TextStyle(),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
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
                            'Send',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onPressed: null,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
