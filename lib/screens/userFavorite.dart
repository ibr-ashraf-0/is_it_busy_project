import 'package:flutter/material.dart';
import 'package:is_it_busy/screens/editPage.dart';

class UserFavorite extends StatelessWidget {
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
          'My Favorite',
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
            Container(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.all(12),
                          child: Image.asset('assets/images/logo.png'),
                          height: 70,
                          width: 55,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        Container(
                            padding: const EdgeInsets.all(6),
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
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 300, top: 0, bottom: 0),
                                      // alignment: Alignment.centerRight,
                                      child: Container(
                                        width: 25,
                                        height: 25,
                                        child: null,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 3),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color.fromRGBO(0, 221, 181, 1),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // const SizedBox(
                                //   height: 2.0,
                                // ),
                                const Text(
                                  'Felix Trattoria',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 2.0,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.grey,
                                      size: 15,
                                    ),
                                    Text(
                                      '1023 ABBOT KINNEY ',
                                      style: TextStyle(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
