import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../screens/editBussPage.dart';

class HomeBussScreen extends StatefulWidget {
  @override
  State<HomeBussScreen> createState() => _HomeBussScreenState();
}

class _HomeBussScreenState extends State<HomeBussScreen> {
  Icon icon = const Icon(Icons.check_box_outline_blank);
  bool iconCheck = false;
  int _curantIndx = 0;

  @override
  Widget build(BuildContext contextt) {
    XFile? pickedImage;
    void fetchImage() async {
      final ImagePicker _picker = ImagePicker();
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        if (image == null) {
          return;
        } else {
          pickedImage = Image.file(image as File) as XFile;
          File(image.path);
        }
      });
    }

    bool isVisible = false;
    final int currentStep;
    final int totalSteps;
    final Color activeColor;
    final Color inactiveColor;
    final Duration duration;
    final Function onFinal;
    final Function onStart;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(243, 244, 252, 1),
      appBar: AppBar(
        elevation: 0,
        /*
        // actions: const [
        // Padding(
        //   padding: EdgeInsets.only(top: 12, right: 20),
        //   child: Icon(
        //     Icons.delete,
        //     color: Colors.red,
        //   ),
        // ),
        //],
         */
        flexibleSpace: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 12, bottom: 4),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    contextt,
                    MaterialPageRoute(builder: (BuildContext context) {
                      return EditBussPage();
                    }),
                  );
                },
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
            /*
            // Container(
            //   margin: const EdgeInsets.all(1.5),
            //   padding: const EdgeInsets.all(1.5),
            //   child: ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //       padding: const EdgeInsets.all(1.5),
            //       elevation: 0,
            //       // enabledMouseCursor: MouseCursor.uncontrolled,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(55),
            //         side: const BorderSide(
            //           width: 0,
            //           color: Colors.white,
            //         ),
            //       ),
            //       fixedSize: const Size(55, 55),
            //       alignment: Alignment.topLeft,
            //       primary: MaterialStateColor.resolveWith(
            //           (states) => Colors.transparent),
            //     ),
            //     onPressed: () {},
            //     child: CircleAvatar(
            //       // backgroundImage: AssetImage(),
            //       radius: 55,
            //       backgroundColor: Colors.white,
            //       child: Image.asset('assets/images/logo.png'),
            //     ),
            //   ),
            // ),
            */
          ],
        ),
        backgroundColor: Colors.transparent,
        title: const Padding(
          padding: EdgeInsets.only(top: 15),
          child: Text(
            'Home',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 20),
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                    child: Text(
                      'States',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                      height: 60,
                      width: 60,
                      // padding: const EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: buildStatesBusy(
                              1,
                              Colors.red,
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Container(
                            child: buildStatesBusy(
                              2,
                              Colors.orange,
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Container(
                            child: buildStatesOn(
                              3,
                              const Color.fromRGBO(0, 221, 181, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          buildPlaceDitelise(),
          const SizedBox(
            height: 20,
          ),
          buildPlaceDitelise(),
          const SizedBox(
            height: 20,
          ),
          buildPlaceDitelise(),
          const SizedBox(
            height: 20,
          ),
          buildPlaceDitelise(),
          const SizedBox(
            height: 20,
          ),
          buildPlaceDitelise(),
          const SizedBox(
            height: 20,
          ),
          buildPlaceDitelise(),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: contextt,
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              builder: (_) {
                String _sectionName;
                return ListView(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 18.0),
                      child: Text(
                        'New Section',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 75,
                      width: 75,
                      child: CircleAvatar(
                        backgroundImage: pickedImage as ImageProvider<Object>?,
                        radius: 15,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 45, vertical: 10),
                      child: TextFormField(
                        key: const ValueKey('section'),
                        autocorrect: true,
                        enableSuggestions: true,
                        textCapitalization: TextCapitalization.words,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please enter your section name";
                          }
                          return null;
                        },
                        onSaved: (val) => _sectionName = val!,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          fillColor: const Color.fromRGBO(243, 244, 252, 1),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                                width: 0.0,
                                color: Color.fromRGBO(243, 244, 252, 1)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                                width: 0.0,
                                color: Color.fromRGBO(243, 244, 252, 1)),
                          ),
                          label: const Text(
                            'Section Name',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4.5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 45, vertical: 10),
                      child: Container(
                        height: 57,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey,
                        ),
                        child: Container(
                          height: 56,
                          width: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          // padding: EdgeInsets.only(top: 35),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 18.0),
                                child: Text(
                                  'Status',
                                  style: TextStyle(
                                    fontSize: 17,
                                    letterSpacing: 0.8,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  width: 45,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 30,
                                        height: 30,
                                        child: buildStatesOff(
                                          1,
                                          const Color.fromRGBO(224, 32, 32, 1),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Container(
                                        width: 30,
                                        height: 30,
                                        child: buildStatesBusy(
                                          2,
                                          const Color.fromRGBO(250, 100, 0, 1),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Container(
                                        width: 30,
                                        height: 30,
                                        child: buildStatesOn(
                                          3,
                                          const Color.fromRGBO(0, 221, 181, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 25),
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
                        child: Container(
                          width: 380,
                          child: const Text(
                            'Add',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                );
              });
        },
        backgroundColor: const Color.fromRGBO(241, 76, 76, 1),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget buildPlaceDitelise() {
    return Container(
      height: 90,
      margin: const EdgeInsets.symmetric(horizontal: 23, vertical: 0.5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1.5),
      // width: 200,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 70,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 2.5),
            margin: EdgeInsets.all(5),
            child: Image.asset(
              'assets/images/logo.png',
              filterQuality: FilterQuality.medium,
              fit: BoxFit.cover,
              width: 60,
              height: 60,
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 18.0),
                  child: Text(
                    'Chain of restaurants',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 23,
                        height: 38,
                        padding: const EdgeInsets.only(bottom: 12),
                        child: buildStatesOff(
                          1,
                          const Color.fromRGBO(224, 32, 32, 1),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 23,
                        height: 38,
                        padding: const EdgeInsets.only(bottom: 12),
                        child: buildStatesBusy(
                          2,
                          const Color.fromRGBO(250, 100, 0, 1),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 23,
                        height: 38,
                        padding: const EdgeInsets.only(bottom: 12),
                        child: buildStatesOn(
                          3,
                          const Color.fromRGBO(0, 221, 181, 1),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const Icon(
            Icons.edit,
            color: Colors.grey,
          ),
          IconButton(
            splashRadius: 2.5,
            padding: EdgeInsets.all(1.2),
            onPressed: () {
              setState(() {
                iconCheck = !iconCheck;
              });
            },
            icon: iconCheck ? Icon(Icons.check_box) : icon,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget buildStatesOff(int indx, Color color) {
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
          setState(() {
            if (_curantIndx == indx) {
              _curantIndx = 0;
            } else {
              _curantIndx = indx;
            }
          });
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
                color: indx == _curantIndx ? color : Colors.white,
              ),
              child: Container(
                padding: const EdgeInsets.all(1.2),
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

  Widget buildStatesBusy(int indx, Color _color) {
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
          setState(() {
            if (_curantIndx == indx) {
              _curantIndx = 0;
            } else {
              _curantIndx = indx;
            }
          });
        },
        autofocus: false,
        fillColor: Colors.white,
        splashColor: _color.withOpacity(0.6),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(1.5),
              margin: const EdgeInsets.all(0.2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _curantIndx == indx ? _color : Colors.white,
              ),
              child: Container(
                padding: const EdgeInsets.all(1.2),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Container(
                  padding: const EdgeInsets.all(4.5),
                  child: null,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _color,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStatesOn(int indx, Color color) {
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
          setState(() {
            if (_curantIndx == indx) {
              _curantIndx = 0;
            } else {
              _curantIndx = indx;
            }
          });
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
                color: _curantIndx == indx ? color : Colors.white,
              ),
              child: Container(
                padding: const EdgeInsets.all(1.2),
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

// InkWell(
// onTap: () {},
// child: Container(
// width: 25,
// height: 25,
// //color: Colors.blue,
// child: null,
// margin: const EdgeInsets.symmetric(horizontal: 3),
// decoration: const BoxDecoration(
// shape: BoxShape.circle,
// color: Colors.red,
// ),
// ),
// ),
// InkWell(
// onTap: () {},
// child: Container(
// width: 25,
// height: 25,
// //color: Colors.blue,
// child: null,
// margin: const EdgeInsets.symmetric(horizontal: 3),
// decoration: const BoxDecoration(
// shape: BoxShape.circle,
// color: Colors.deepOrange,
// ),
// ),
// ),
