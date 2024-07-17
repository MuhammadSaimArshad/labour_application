import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:labour_application/screens/worker/worker_myjobclass.dart';
import 'package:labour_application/utiles/model/static_data.dart';
import 'package:labour_application/utiles/model/workerstatic_data.dart';

class JobsPageScreen extends StatefulWidget {
  const JobsPageScreen({super.key});

  @override
  State<JobsPageScreen> createState() => _JobsPageScreenState();
}

class _JobsPageScreenState extends State<JobsPageScreen> {
  var height, width;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  var v = workerStaticData.uid;
//    User? currentUser = await auth.currentUser;
// var v = currentUser!.uid;
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child:
          // snapshot.data == null
          //     ? Center(child: CircularProgressIndicator())
          //     :
          Scaffold(
              body: Center(
                  child: Container(
                      height: height,
                      width: width,
                      // color: Colors.amber,
                      child: Stack(children: [
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
                          height: height * 0.23,
                          width: width,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.25),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(40),
                                bottomRight: Radius.circular(40)),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: height * 0.04,
                                    left: width * 0.06,
                                    right: width * 0.06),
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "",
                                        // snapshot.data!.["workername"],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: width * 0.06,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(top: height * 0.02),
                                        child: Container(
                                            height: height * 0.07,
                                            width: width * 0.12,
                                            decoration: BoxDecoration(
                                                color: Colors.black
                                                    .withOpacity(0.6),
                                                borderRadius:
                                                    BorderRadius.circular(70),
                                                border: Border.all(
                                                    color: Colors.orange,
                                                    width: 2)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Image(
                                                  // color: Colors.white,
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      "images/person.png")),
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: height * 0.05),
                                child: Text(
                                  "APPLIED JOBS",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * 0.07,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: StreamBuilder<QuerySnapshot>(
                              stream: firebaseFirestore
                                  .collection("jobs")
                                  .where('workerID',
                                      isEqualTo: workerStaticData.uid)
                                  .snapshots(),
                              builder: (context, snapshot) {
                                return snapshot.data == null
                                    ? Center(child: CircularProgressIndicator())
                                    : Container(
                                        height: height * 0.55,
                                        width: width,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: ListView.builder(
                                            itemCount:
                                                snapshot.data!.docs.length,
                                            itemBuilder: (context, index) {
                                              return snapshot.data!.docs[index]
                                                              .get('status') ==
                                                          'pending' ||
                                                      snapshot.data!.docs[index]
                                                              .get('status') ==
                                                          'accepted'
                                                  ? Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Container(
                                                        height: height * 0.27,
                                                        width: width,
                                                        decoration: BoxDecoration(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.25),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets.only(
                                                                  bottom:
                                                                      height *
                                                                          0.11),
                                                              child: Container(
                                                                  height:
                                                                      height *
                                                                          0.12,
                                                                  width: width *
                                                                      0.21,
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .black,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  child: Image(
                                                                      // color: Colors.white,
                                                                      fit: BoxFit
                                                                          .fill,
                                                                      image: AssetImage(
                                                                          "images/person.png"))),
                                                            ),
                                                            Container(
                                                              height:
                                                                  height * 0.32,
                                                              width:
                                                                  width * 0.7,
                                                              //color: Colors.blue,
                                                              child: Column(
                                                                // mainAxisAlignment: MainAxisAlignment.start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsets.only(
                                                                        top: height *
                                                                            0.02,
                                                                        left: width *
                                                                            0.02),
                                                                    child: Text(
                                                                      snapshot
                                                                          .data!
                                                                          .docs[index]["name"],
                                                                      // snapshot.data!.docs.
                                                                      // Myjobs.jobsList[index]
                                                                      //     .name!,
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize: width *
                                                                              0.04,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.only(
                                                                        bottom: height *
                                                                            0.01),
                                                                    child:
                                                                        Container(
                                                                      child:
                                                                          Text(
                                                                        "______________",
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              width * 0.04,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          snapshot
                                                                              .data!
                                                                              .docs[index]["jobtitle"],
                                                                          style: TextStyle(
                                                                              color: Color.fromARGB(199, 255, 153, 0),
                                                                              fontSize: width * 0.04,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                        Container(
                                                                          height:
                                                                              height * 0.05,
                                                                          width:
                                                                              width * 0.22,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                161,
                                                                                146,
                                                                                12),
                                                                            borderRadius:
                                                                                BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
                                                                          ),
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Text(
                                                                              snapshot.data!.docs[index]["status"],
                                                                              style: TextStyle(color: Colors.white, fontSize: width * 0.04, fontWeight: FontWeight.bold),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    "Description:",
                                                                    style: TextStyle(
                                                                        color: Color.fromARGB(
                                                                            199,
                                                                            255,
                                                                            153,
                                                                            0),
                                                                        fontSize:
                                                                            width *
                                                                                0.04,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  Text(
                                                                    snapshot.data!
                                                                            .docs[index]
                                                                        [
                                                                        "description"],
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          width *
                                                                              0.04,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  : SizedBox();
                                            }),
                                      );
                              }),
                        )
                      ])))),
    );
  }
}
