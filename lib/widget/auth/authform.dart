import 'package:flutter/material.dart';
import 'package:is_it_busy/screens/authScreen.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../screens/resetPassScreen.dart';

class AuthForm extends StatefulWidget {
  final void Function(
      {required String name,
      required String email,
      required String password,
      required BuildContext ctx}) submiFun;

  AuthForm({required this.submiFun});

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final TextEditingController _passController = TextEditingController();
  final GlobalKey<FormState> formsKey = GlobalKey();

  bool _obscureText = true;

  void GoToRest() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) {
        return ResetPassScreen();
      }),
    );
  }

  void goTo_signUp() {
    setState(() {
      AuthScreenState.isSignUp = !AuthScreenState.isSignUp;
      AuthScreenState.isBusiness = false;
      AuthScreenState.userName = '';
      AuthScreenState.email = '';
      AuthScreenState.password = '';
    });
  }

  void _submit() async {
    final isValid = formsKey.currentState?.validate();
    FocusScope.of(context).unfocus();
    if (isValid!) {
      formsKey.currentState!.save();
      widget.submiFun(
          name: AuthScreenState.userName,
          email: AuthScreenState.email,
          password: AuthScreenState.password,
          ctx: context);
    }

    //   setState(() {
    //     AuthScreenState.email ='';
    //     AuthScreenState.password= '';
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formsKey,
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            if (!AuthScreenState.isSignUp)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        print('feaceBook');
                      },
                      icon: const Icon(
                        Icons.facebook,
                        size: 25,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Facebook',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 35),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.blue),
                        elevation: MaterialStateProperty.all(13),
                        // overlayColor:
                        //     MaterialStateProperty.all(Colors.lightBlueAccent),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.5),
                            child: Image.asset(
                              'assets/images/applyIcon.png',
                              color: Colors.black,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                          const Text(
                            'Apple',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ],
                      ),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              vertical: 24, horizontal: 58),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            side:
                                const BorderSide(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => const Color.fromRGBO(243, 244, 252, 1)),
                        elevation: MaterialStateProperty.all(13),
                        overlayColor: MaterialStateProperty.all(Colors.black12),
                      ),
                    ),
                  ],
                ),
              ),
            if (!AuthScreenState.isSignUp)
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Center(
                  child: Text(
                    'or sign up with email',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black38,
                    ),
                  ),
                ),
              ),
            if (AuthScreenState.isSignUp)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: ToggleSwitch(
                    // animate: true,
                    changeOnTap: true,
                    radiusStyle: true,
                    activeFgColor: Colors.black,
                    borderColor: const [Colors.white],
                    inactiveBgColor: Colors.white,
                    inactiveFgColor: Colors.grey,
                    borderWidth: 10,
                    activeBgColor: const [Color.fromRGBO(248, 247, 251, 1)],
                    customWidths: const [200.0, 200.0],
                    cornerRadius: 50,
                    initialLabelIndex: 0,
                    totalSwitches: 2,
                    labels: const ['User', 'Business'],
                    onToggle: (indx) {
                   setState(() {
                     print(indx);
                     print(AuthScreenState.isBusiness);
                     if (indx == 0) {
                       AuthScreenState.isBusiness = false;
                     }
                     if (indx == 1) {
                       AuthScreenState.isBusiness = true;
                     }
                     print(AuthScreenState.isBusiness);
                   });
                    },
                  ),
                ),
              ),
            if (AuthScreenState.isSignUp)
              Padding(
                padding: const EdgeInsets.all(8.0),
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
              padding: const EdgeInsets.all(8.0),
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
            if (AuthScreenState.isBusiness == true)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  key: const ValueKey('location'),
                  autocorrect: true,
                  obscureText: false,
                  enableSuggestions: true,
                  textCapitalization: TextCapitalization.words,
                  validator: (val) {
                    if (val!.isEmpty || val.length < 4) {
                      return "Please enter your business location";
                    }
                    return null;
                  },
                  onSaved: (val) => AuthScreenState.bussLocation = val!,
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
                      'Location',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    prefixIcon: const Icon(
                      Icons.location_on_outlined,
                      color: Color.fromRGBO(241, 76, 76, 1),
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _passController,
                key: ValueKey('password'),
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
                    'Password',
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
            if (!AuthScreenState.isSignUp)
              TextButton(
                onPressed: GoToRest,
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            if (AuthScreenState.isSignUp)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  key: const ValueKey('confirmPassword'),
                  autocorrect: true,
                  obscureText: _obscureText,
                  enableSuggestions: true,
                  textCapitalization: TextCapitalization.none,
                  validator: (val) {
                    if (val!.isEmpty && val != AuthScreenState.password) {
                      return "passwords is not same";
                    }
                    return null;
                  },
                  onSaved: (val) => AuthScreenState.password = val!,
                  keyboardType: TextInputType.visiblePassword,
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
                      'Confirm Password',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: const Color.fromRGBO(241, 76, 76, 1),
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
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
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              AuthScreenState.isSignUp == true
                                  ? 'Sign up'
                                  : 'Sign in',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: _submit,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AuthScreenState.isSignUp == true
                        ? 'Already have account?  '
                        : 'Don\'t have an account?  ',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  RawMaterialButton(
                    onPressed: goTo_signUp,
                    child: Text(
                      AuthScreenState.isSignUp == true ? 'Sign in' : 'Sign up',
                      style: const TextStyle(
                        color: Color.fromRGBO(241, 76, 76, 1),
                      ),
                    ),
                    fillColor: Colors.red[200],
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    splashColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
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
