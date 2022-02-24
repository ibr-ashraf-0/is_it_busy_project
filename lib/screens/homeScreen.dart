import 'package:flutter/material.dart';
import 'package:is_it_busy/modles/placeM.dart';
import 'package:is_it_busy/screens/editPage.dart';
import 'package:is_it_busy/screens/placeDetails.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

IconData unFavoriteIcon = Icons.favorite_border;

class _HomeScreenState extends State<HomeScreen> {
  List<PlaceModle> placeData = [
    PlaceModle(
      title: 'Sheraton hotel',
      location: '963 Madyson Drive Suite',
      imageUrl: 'assets/images/places/place1.png',
      stateColor: Color.fromRGBO(0, 221, 181, 1),
    ),
    PlaceModle(
        title: 'Glendale Galleria',
        location: '100 W Broadway Suite 100,',
        imageUrl: 'assets/images/places/place2.png',
        stateColor: Color.fromRGBO(250, 100, 0, 1)),
    PlaceModle(
      title: 'shops columbus',
      location: '963 Madyson Drive Suite',
      imageUrl: 'assets/images/places/place3.png',
      stateColor: Color.fromRGBO(224, 32, 32, 1),
    ),
  ];
  late String _searchFor;
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return EditPage();
                      }),
                    );
                  },
                  child: CircleAvatar(
                    child: Image.asset('assets/images/logo.png'),
                    radius: 20,
                  ),
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.location_on_outlined,
                        size: 22.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SingleChildScrollView(
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Location',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.black),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            DropdownButton(
                                style: const TextStyle(color: Colors.black),
                                underline: Container(),
                                icon: const Icon(Icons.keyboard_arrow_down,
                                    color: Colors.black),
                                items: [
                                  DropdownMenuItem(
                                    child: Column(
                                      children: const [
                                        Text(
                                          'San Francisco',
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.black),
                                        ),
                                        DropdownMenuItem(
                                          child: Text(
                                            'California ',
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                    value: 'San Francisco',
                                  ),
                                ],
                                onChanged: (itemIdentifier) {
                                  if (itemIdentifier == 'San Francisco') {}
                                }),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 10),
            child: TextFormField(
              key: const ValueKey('search'),
              autocorrect: true,
              enableSuggestions: true,
              textCapitalization: TextCapitalization.words,
              validator: (val) {
                if (val!.isEmpty) {
                  return "Please enter words to search for it";
                }
                return null;
              },
              onSaved: (val) => _searchFor = val!,
              keyboardType: TextInputType.text,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                fillColor: const Color.fromRGBO(243, 244, 252, 1),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(
                      width: 0.0, color: Color.fromRGBO(243, 244, 252, 1)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(
                      width: 0.0, color: Color.fromRGBO(243, 244, 252, 1)),
                ),
                label: const Text(
                  'Search heres …',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                suffixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          buildPlace(),
        ],
      ),
    );
  }

  Widget buildPlace() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RawMaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return PlaceDetails();
                      }),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 200,
                    child: Stack(
                      //alignment: Alignment.bottomLeft,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset(
                            placeData[0].imageUrl,
                            height: 200,
                            filterQuality: FilterQuality.high,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 9.5, right: 4.5),
                          alignment: Alignment.topRight,
                          child: Container(
                            width: 25,
                            height: 25,
                            child: null,
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: placeData[0].stateColor,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 0, left: 0),
                          height: 200,
                          alignment: Alignment.bottomLeft,
                          child: IconButton(
                            icon: Icon(unFavoriteIcon),
                            onPressed: () {
                              setState(() {
                                isFavorite = !isFavorite;
                                isFavorite == true
                                    ? unFavoriteIcon = Icons.favorite
                                    : Icons.favorite_border;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 2),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 17,
                                  ),
                                  Text('(0.4)'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            placeData[0].title,
                            style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 2.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: Colors.grey,
                              size: 15,
                            ),
                            Text(
                              placeData[0].location,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RawMaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return PlaceDetails();
                      }),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 200,
                    child: Stack(
                      //alignment: Alignment.bottomLeft,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset(
                            placeData[1].imageUrl,
                            height: 200,
                            filterQuality: FilterQuality.high,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 9.5, right: 4.5),
                          alignment: Alignment.topRight,
                          child: Container(
                            width: 25,
                            height: 25,
                            child: null,
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: placeData[1].stateColor,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 0, left: 0),
                          height: 200,
                          alignment: Alignment.bottomLeft,
                          child: IconButton(
                            icon: Icon(unFavoriteIcon),
                            onPressed: () {
                              setState(() {
                                isFavorite = !isFavorite;
                                isFavorite == true
                                    ? unFavoriteIcon = Icons.favorite
                                    : Icons.favorite_border;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 2),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 17,
                                  ),
                                  Text('(0.4)'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            placeData[1].title,
                            style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 2.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: Colors.grey,
                              size: 15,
                            ),
                            Text(
                              placeData[1].location,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 17,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RawMaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) {
                      return PlaceDetails();
                    }),
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 200,
                  child: Stack(
                    //alignment: Alignment.bottomLeft,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(
                          placeData[2].imageUrl,
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 9.5, right: 4.5),
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 25,
                          height: 25,
                          child: null,
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: placeData[2].stateColor,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 0, left: 0),
                        height: 200,
                        alignment: Alignment.bottomLeft,
                        child: IconButton(
                          icon: Icon(unFavoriteIcon),
                          onPressed: () {
                            setState(() {
                              isFavorite = !isFavorite;
                              isFavorite == true
                                  ? unFavoriteIcon = Icons.favorite
                                  : Icons.favorite_border;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 2),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 17,
                                ),
                                Text('(0.4)'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 2),
                        child: Text(
                          placeData[2].title,
                          style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 2.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            color: Colors.grey,
                            size: 15,
                          ),
                          Text(
                            placeData[2].location,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
