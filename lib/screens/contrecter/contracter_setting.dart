import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:labour_application/screens/contrecter/contract_work.dart';
import 'package:labour_application/screens/contrecter/contracter_editprofile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Contracter_setting extends StatefulWidget {
  const Contracter_setting({super.key});

  @override
  State<Contracter_setting> createState() => _Contracter_settingState();
}

class _Contracter_settingState extends State<Contracter_setting> {
  @override
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;

  void logout() async {
    await auth.signOut();
    clearSF();
    // ignore: use_build_context_synchronously
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Contract_work(),
        ));
  }

  void clearSF() async {
    SharedPreferences sharedprfrence = await SharedPreferences.getInstance();
    sharedprfrence.getKeys();
    sharedprfrence.clear();
  }

  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('contracterUser')
                  .doc(user!.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                return snapshot.data == null
                    ? CircularProgressIndicator()
                    : Stack(
                        children: [
                          Container(
                            height: height,
                            width: width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("images/background.jpeg")),
                            ),
                          ),
                          Container(
                            height: height * 0.1,
                            width: width,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Setting",
                                    style: TextStyle(
                                        fontSize: width * 0.045,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: height * 0.6,
                              width: width,
                              child: Column(
                                children: [
                                  Container(
                                    height: height * 0.1,
                                    width: width * 0.9,
                                    color: Colors.black.withOpacity(0.25),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Row(children: [
                                        Container(
                                          height: height * 0.06,
                                          width: width * 0.1,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: Colors.amber)),
                                          child: Icon(
                                            Icons.person,
                                            color: Colors.white,
                                            size: width * 0.07,
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.03,
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
                                                  fontSize: width * 0.045,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              snapshot.data!['email'],
                                              style: TextStyle(
                                                  fontSize: width * 0.04,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ]),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 20, bottom: 20),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Profile",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: width * 0.045,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Contracter_editprofile(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: height * 0.1,
                                      width: width * 0.9,
                                      color: Colors.black.withOpacity(0.25),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    height: height * 0.06,
                                                    width: width * 0.1,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.amber,
                                                    ),
                                                    child: Icon(
                                                      Icons.people,
                                                      color: Colors.white,
                                                      size: width * 0.07,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.1,
                                                  ),
                                                  Text(
                                                    'Edit Profile',
                                                    style: TextStyle(
                                                        fontSize: width * 0.045,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 20),
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Colors.white,
                                                  size: width * 0.055,
                                                ),
                                              ),
                                            ]),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.03,
                                  ),
                                  // Container(
                                  //   height: height * 0.1,
                                  //   width: width * 0.9,
                                  //   color: Colors.black.withOpacity(0.25),
                                  //   child: Padding(
                                  //     padding: const EdgeInsets.only(left: 20),
                                  //     child: Row(
                                  //         mainAxisAlignment:
                                  //             MainAxisAlignment.spaceBetween,
                                  //         children: [
                                  //           Row(
                                  //             children: [
                                  //               Container(
                                  //                 height: height * 0.06,
                                  //                 width: width * 0.1,
                                  //                 decoration: BoxDecoration(
                                  //                   shape: BoxShape.circle,
                                  //                   color: Colors.blue,
                                  //                 ),
                                  //                 child: Icon(
                                  //                   Icons.lock,
                                  //                   color: Colors.white,
                                  //                   size: width * 0.07,
                                  //                 ),
                                  //               ),
                                  //               SizedBox(
                                  //                 width: width * 0.1,
                                  //               ),
                                  //               Text(
                                  //                 'Change Password',
                                  //                 style: TextStyle(
                                  //                     fontSize: width * 0.045,
                                  //                     color: Colors.white,
                                  //                     fontWeight:
                                  //                         FontWeight.bold),
                                  //               ),
                                  //             ],
                                  //           ),
                                  //           Padding(
                                  //             padding: const EdgeInsets.only(
                                  //                 right: 20),
                                  //             child: Icon(
                                  //               Icons.arrow_forward_ios,
                                  //               color: Colors.white,
                                  //               size: width * 0.055,
                                  //             ),
                                  //           ),
                                  //         ]),
                                  //   ),
                                  // ),

                                  SizedBox(
                                    height: height * 0.03,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      logout();
                                    },
                                    child: Container(
                                      height: height * 0.1,
                                      width: width * 0.9,
                                      color: Colors.black.withOpacity(0.25),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    height: height * 0.06,
                                                    width: width * 0.1,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.red,
                                                    ),
                                                    child: Icon(
                                                      Icons.login,
                                                      color: Colors.white,
                                                      size: width * 0.07,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.1,
                                                  ),
                                                  Text(
                                                    'Log Out',
                                                    style: TextStyle(
                                                        fontSize: width * 0.045,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 20),
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Colors.white,
                                                  size: width * 0.055,
                                                ),
                                              ),
                                            ]),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
              })),
    );
  }
}
