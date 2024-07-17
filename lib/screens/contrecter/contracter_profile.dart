import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Contracter_profile extends StatefulWidget {
  const Contracter_profile({super.key});

  @override
  State<Contracter_profile> createState() => _Contracter_profileState();
}

class _Contracter_profileState extends State<Contracter_profile> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('contracterUser')
              .doc(user!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            return snapshot.data == null
                ? CircularProgressIndicator()
                : Scaffold(
                    body: Container(
                      height: height,
                      width: width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("images/background.jpeg")),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: height * 0.7,
                            width: width * 0.95,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: height * 0.2,
                                    width: width * 0.9,
                                    // color: Colors.amber,
                                    child: Row(children: [
                                      Container(
                                        height: height * 0.15,
                                        width: width * 0.4,
                                        child: Image(
                                            image: AssetImage(
                                                "images/person.png")),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            snapshot.data!['uname'],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: width * 0.045,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            snapshot.data!['email'],
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: width * 0.04,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]),
                                  ),
                                  Container(
                                    height: height * 0.12,
                                    width: width * 0.95,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: height * 0.12,
                                          width: width * 0.25,
                                          decoration: BoxDecoration(
                                            color: Colors.amber,
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(30),
                                                bottomRight:
                                                    Radius.circular(30)),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                snapshot.data!['phoneNO'],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: width * 0.03,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                "Number",
                                                style: TextStyle(
                                                    fontSize: width * 0.03,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: height * 0.12,
                                          width: width * 0.35,
                                          decoration: BoxDecoration(
                                              color: Colors.amber,
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                snapshot.data!['company'],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: width * 0.03,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                "Company",
                                                style: TextStyle(
                                                    fontSize: width * 0.03,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: height * 0.12,
                                          width: width * 0.25,
                                          decoration: BoxDecoration(
                                            color: Colors.amber,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(30),
                                                bottomLeft:
                                                    Radius.circular(30)),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                snapshot.data!['time'],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: width * 0.03,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                "Reg Date",
                                                style: TextStyle(
                                                    fontSize: width * 0.03,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Text(
                                    "About Us",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width * 0.045,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                      height: height * 0.15,
                                      width: width * 0.8,
                                      // color: Colors.amber,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: height * 0.03,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Hello I am ",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: width * 0.035),
                                                ),
                                                Text(
                                                  snapshot.data!['uname'],
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: width * 0.035),
                                                ),
                                                Text(
                                                  " HR of ",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: width * 0.035),
                                                ),
                                                Text(
                                                  snapshot.data!['company'],
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: width * 0.035),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: height * 0.03,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Our contact number is ",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: width * 0.035),
                                                ),
                                                Text(
                                                  snapshot.data!['phoneNO'],
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: width * 0.035),
                                                ),
                                                Text(
                                                  " and our ",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: width * 0.035),
                                                ),
                                                //Text(snapshot.data!['company']),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: height * 0.03,
                                            child: Row(
                                              children: [
                                                Text(
                                                  "company email is ",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: width * 0.035),
                                                ),
                                                Text(
                                                  snapshot.data!['email'],
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: width * 0.035),
                                                ),
                                                Text(
                                                  " You can ",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: width * 0.035),
                                                ),
                                                //Text(snapshot.data!['company']),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: height * 0.03,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "contact us anytime for job information ",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: width * 0.035),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )),
                                  Text(
                                    "Adress",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width * 0.045,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    height: height * 0.1,
                                    width: width * 0.8,
                                    child: Center(
                                      child: Text(
                                        snapshot.data!['adress'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: width * 0.04,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                          )
                        ],
                      ),
                    ),
                  );
          }),
    );
  }
}
