import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Worker_profile extends StatefulWidget {
  const Worker_profile({super.key});

  @override
  State<Worker_profile> createState() => _Worker_profileState();
}

class _Worker_profileState extends State<Worker_profile> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SafeArea(
        child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('workerUser')
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
                              height: height * 0.85,
                              width: width * 0.95,
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: height * 0.15,
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
                                            Text(
                                              snapshot.data!['phoneNO'],
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
                                                  snapshot.data!['experience'],
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: width * 0.03,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "Experience",
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
                                                  snapshot.data!['dateofbirth'],
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: width * 0.03,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "Date of Birth",
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
                                                  snapshot.data!['gender'],
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: width * 0.03,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "Gender",
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
                                      "About Worker",
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
                                                    "Hello This is ",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize:
                                                            width * 0.035),
                                                  ),
                                                  Text(
                                                    snapshot.data!['uname'],
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize:
                                                            width * 0.035),
                                                  ),
                                                  Text(
                                                    " And I am a ",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize:
                                                            width * 0.035),
                                                  ),
                                                  Text(
                                                    snapshot.data!['job'],
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize:
                                                            width * 0.035),
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
                                                    "My contact number is ",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize:
                                                            width * 0.035),
                                                  ),
                                                  Text(
                                                    snapshot.data!['phoneNO'],
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize:
                                                            width * 0.035),
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
                                                    " I have been working as a ",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize:
                                                            width * 0.035),
                                                  ),
                                                  Text(
                                                    snapshot.data!['job'],
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize:
                                                            width * 0.035),
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
                                                    "for more than  ",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize:
                                                            width * 0.035),
                                                  ),
                                                  Text(
                                                    snapshot
                                                        .data!['experience'],
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize:
                                                            width * 0.035),
                                                  ),
                                                  Text(
                                                    " year ",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize:
                                                            width * 0.035),
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
                                                    "You contact me anytime for your projects ",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: width * 0.03),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )),
                                    SizedBox(
                                      height: height * 0.02,
                                    ),
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
                                          snapshot.data!['address'],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: width * 0.04,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    Text(
                                      "Bank details",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: width * 0.045,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      height: height * 0.1,
                                      width: width * 0.8,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Account holder Name is : ",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: width * 0.033,
                                                ),
                                              ),
                                              Text(
                                                snapshot.data![
                                                    'accountntholdername'],
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: width * 0.033,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Bank name is : ",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: width * 0.033,
                                                ),
                                              ),
                                              Text(
                                                snapshot.data!['accountnumber'],
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: width * 0.033,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Account no is : ",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: width * 0.033,
                                                ),
                                              ),
                                              Text(
                                                snapshot.data!['bankname'],
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: width * 0.033,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Sort code is : ",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: width * 0.033,
                                                ),
                                              ),
                                              Text(
                                                snapshot.data!['sortcode'],
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: width * 0.033,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]),
                            )
                          ],
                        ),
                      ),
                    );
            }),
      ),
    );
  }
}
