// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:is_it_busy/screens/homeScreen.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceDetails extends StatefulWidget {
  const PlaceDetails({Key? key}) : super(key: key);

  @override
  _PlaceDetailsState createState() => _PlaceDetailsState();
}

class _PlaceDetailsState extends State<PlaceDetails> {
  String _url = 'https://flutter.dev';
  void _launchURL() async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  bool isUserRated = false;
  double reviewVal = 0.4;
  late TextEditingController _userRevew;
  @override
  void initState() {
    super.initState();
    String _userReview;
    _userRevew = TextEditingController();
  }

  @override
  void dispose() {
    _userRevew.dispose();
    super.dispose();
  }

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
          'Restuarant',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.normal, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      maxRadius: 45,
                      child: Image.asset('assets/images/logo.png',
                          fit: BoxFit.fill),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'GLENDLE GALLERIA',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.grey,
                          size: 15.0,
                        ),
                        Text(
                          '100 W Broadway Suite 100,United State',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              wordSpacing: 1.5,
                              letterSpacing: 1),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Container(
                      width: 220.0,
                      height: 25,
                      child: RawMaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: buildReviewStar(),
                        onPressed: () {
                          !isUserRated
                              ? showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30))),
                                  builder: (BuildContext ctx) {
                                    return ListView(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          padding:
                                              const EdgeInsets.only(top: 12),
                                          child: const Text(
                                            'Rating',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        buildReviewStarForRating(),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0, horizontal: 20),
                                          child: TextField(
                                            controller: _userRevew,
                                            autofocus: true,
                                            key: const ValueKey('userReview'),
                                            keyboardType: TextInputType.text,
                                            autocorrect: true,
                                            enableSuggestions: true,
                                            textCapitalization:
                                                TextCapitalization.words,
                                            maxLines: 5,
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                  borderSide: const BorderSide(
                                                      width: 0.0,
                                                      color: Color.fromRGBO(
                                                          243, 244, 252, 1)),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                  borderSide: const BorderSide(
                                                      width: 0.0,
                                                      color: Color.fromRGBO(
                                                          243, 244, 252, 1)),
                                                ),
                                                label: const Text(
                                                  'Place leave a review ',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                fillColor: const Color.fromRGBO(
                                                    243, 244, 252, 1),
                                                filled: true,
                                                floatingLabelAlignment:
                                                    FloatingLabelAlignment
                                                        .start,
                                                alignLabelWithHint: true),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12, horizontal: 25),
                                          child: RawMaterialButton(
                                            splashColor: Colors.red,
                                            fillColor: const Color.fromRGBO(
                                                241, 76, 76, 1),
                                            highlightColor: Colors.red[200],
                                            padding: const EdgeInsets.all(12),
                                            focusColor: const Color.fromRGBO(
                                                241, 76, 76, 1),
                                            autofocus: true,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            child: Row(
                                              children: const [
                                                Expanded(
                                                  flex: 3,
                                                  child: Text(
                                                    'ok',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            onPressed: () {
                                              print(isUserRated);
                                              setState(() {
                                                isUserRated = !isUserRated;
                                              });
                                              print(isUserRated);
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                                  })
                              : showBottomSheet();
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    Container(
                      width: 200.0,
                      height: 25,
                      child: RawMaterialButton(
                          onPressed: _launchURL,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Text(
                            'www.glendalegalleria.com',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.black),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Sections',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildPlaceDetails(),
                    buildPlaceDetails(),
                    buildPlaceDetails(),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  showBottomSheet() {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        builder: (ctx) {
          return ListView(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 15.0),
                alignment: Alignment.center,
                child: const Text(
                  'Reviews',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 2.0,
              ),
              buildReviewStar2(),
              buildReviewUser(),
              const SizedBox(
                height: 2.0,
              ),
              buildReviewUser(),
              const SizedBox(
                height: 2.0,
              ),
              buildReviewUser(),
              const SizedBox(
                height: 2.0,
              ),
              buildReviewUser(),
              const SizedBox(
                height: 2.0,
              ),
            ],
          );
        });
  }

  Widget buildPlaceDetails() {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 150,
                  width: 100,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              child: Container(
                width: 25,
                height: 25,
                //color: Colors.blue,
                child: null,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
        const Text('Chain of restaurants')
      ],
    );
  }

  Widget buildReviewStar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: 18.0,
        ),
        const SizedBox(
          width: 0.2,
        ),
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: 18.0,
        ),
        const SizedBox(
          width: 0.2,
        ),
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: 18.0,
        ),
        const SizedBox(
          width: 0.2,
        ),
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: 18.0,
        ),
        const SizedBox(
          width: 0.2,
        ),
        const Icon(
          Icons.star_border,
          color: Colors.grey,
          size: 18.0,
        ),
        const SizedBox(
          width: 4.0,
        ),
        Text(
          '$reviewVal Reviews',
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }

  Widget buildReviewStarForRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.star_border,
          color: Colors.grey,
          size: 18.0,
        ),
        SizedBox(
          width: 0.2,
        ),
        Icon(
          Icons.star_border,
          color: Colors.grey,
          size: 18.0,
        ),
        SizedBox(
          width: 0.2,
        ),
        Icon(
          Icons.star_border,
          color: Colors.grey,
          size: 18.0,
        ),
        SizedBox(
          width: 0.2,
        ),
        Icon(
          Icons.star_border,
          color: Colors.grey,
          size: 18.0,
        ),
        SizedBox(
          width: 0.2,
        ),
        Icon(
          Icons.star_border,
          color: Colors.grey,
          size: 18.0,
        ),
        SizedBox(
          width: 4.0,
        ),
      ],
    );
  }

  Widget buildReviewStar2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.star,
          color: Colors.amber,
          size: 15.0,
        ),
        SizedBox(
          width: 0.2,
        ),
        Icon(
          Icons.star,
          color: Colors.amber,
          size: 15.0,
        ),
        SizedBox(
          width: 0.2,
        ),
        Icon(
          Icons.star,
          color: Colors.amber,
          size: 15.0,
        ),
        SizedBox(
          width: 0.2,
        ),
        Icon(
          Icons.star,
          color: Colors.amber,
          size: 15.0,
        ),
        SizedBox(
          width: 0.2,
        ),
        Icon(
          Icons.star_border,
          color: Colors.grey,
          size: 15.0,
        ),
        SizedBox(
          width: 4.0,
        ),
        Text(
          '${4.5}',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }

  Widget buildReviewUser() {
    return Container(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 18,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 15, top: 8.0),
                child: const CircleAvatar(
                  radius: 25,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Jube Bowman',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 1.5,
                    ),
                    Container(
                      margin: EdgeInsets.all(1.9),
                      child: buildReviewStar2(),
                    ),
                    const SizedBox(
                      height: 1.5,
                    ),
                    Container(
                      width: 350,
                      child: const Text(
                        'It is the best app.. However, there is always a  room for improvement. When the app has ',
                      ),
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    const Text(
                      '5 months ago',
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    )
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
