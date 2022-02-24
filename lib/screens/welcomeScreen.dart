import 'package:flutter/material.dart';
import 'package:is_it_busy/screens/authScreen.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomeScreen extends StatelessWidget {
  String _url = 'https://flutter.dev';
  void _launchURL() async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    void pressedStart() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => AuthScreen(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(243, 244, 252, 1),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/welcomePage_cover.png',
            filterQuality: FilterQuality.medium,
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 18.0),
                child: Text(
                  'Welcome to Is Is Busy',
                  style: TextStyle(
                      fontSize: 35,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 18.0),
                child: Text(
                  'Lorem Ipsum dolor sit amet, consectetur \n'
                  'adipiscing elit, sed do elusmod. ',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 400,
                    child: RawMaterialButton(
                      splashColor: Colors.red,
                      // for long pees color
                      fillColor: Colors.white,
                      highlightColor: Colors.red[200],
                      padding: const EdgeInsets.all(15),
                      focusColor: Colors.white,
                      autofocus: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      textStyle: const TextStyle(color: Colors.white),
                      child: Row(
                        children: const [
                          Expanded(
                            flex: 3,
                            child: Text(
                              'Get Started',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.redAccent,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      onPressed: pressedStart,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Row(
                  children: [
                    const Text(
                      'By clicking below you agree our',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.43),
                      ),
                    ),
                    TextButton(
                      onPressed: _launchURL,
                      child: const Text(
                        'Privacy Policy',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, bottom: 20),
                child: Row(
                  children: [
                    const Text(
                      'and',
                      style:
                          TextStyle(color: Color.fromRGBO(255, 255, 255, 0.43)),
                    ),
                    TextButton(
                      onPressed: _launchURL,
                      child: const Text(
                        'Terms of Service',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
