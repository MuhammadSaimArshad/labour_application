import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:labour_application/utiles/model/static_data.dart';

class Applicationlist extends StatefulWidget {
  Applicationlist({super.key, required this.catagory});
  String catagory;
  @override
  State<Applicationlist> createState() => _ApplicationlistState();
}

class _ApplicationlistState extends State<Applicationlist> {
  var height, width;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  void updatejbmodel(String wiD, String status) async {
    await firebaseFirestore.collection('jobs').doc(wiD).update(
      {
        'status': status,
      },
    );
  }

  void deletedocument(String id, String catagory) async {
    await firebaseFirestore
        .collection('applicationlist')
        .doc(StaticData.uid)
        .collection(catagory)
        .doc(id)
        .delete();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            height: height,
            width: width,
            child: Stack(
              children: [
                Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("images/background.jpeg"),
                    ),
                  ),
                  child: Column(children: [
                    Container(
                      height: height * 0.34,
                      width: width,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.25),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: width * 0.06, top: height * 0.05),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: width * 0.24, top: height * 0.05),
                                  child: Text(
                                    "Job Details",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width * 0.05,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Container(
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //     children: [
                          //       Container(
                          //         child: Column(
                          //           // mainAxisAlignment: MainAxisAlignment.start,
                          //           crossAxisAlignment:
                          //               CrossAxisAlignment.start,
                          //           children: [
                          //             Padding(
                          //               padding: EdgeInsets.only(
                          //                   top: height * 0.03,
                          //                   right: width * 0.3),
                          //               child: Container(
                          //                 child: Column(
                          //                   crossAxisAlignment:
                          //                       CrossAxisAlignment.start,
                          //                   children: [
                          //                     InkWell(
                          //                       onTap: () {
                          //                         print(
                          //                             '   StaticData${StaticData.uid}');
                          //                       },
                          //                       child: Text(
                          //                         "plaster",
                          //                         style: TextStyle(
                          //                             color: Colors.orange,
                          //                             fontSize: width * 0.06,
                          //                             fontWeight:
                          //                                 FontWeight.bold),
                          //                       ),
                          //                     ),
                          //                     Text(
                          //                       "Paster Required",
                          //                       style: TextStyle(
                          //                         color: Colors.white,
                          //                         fontSize: width * 0.04,
                          //                         // fontWeight: FontWeight.bold
                          //                       ),
                          //                     ),
                          //                     Text(
                          //                       "Salary(Hourly) 30.0",
                          //                       style: TextStyle(
                          //                         color: Colors.white,
                          //                         fontSize: width * 0.04,
                          //                         // fontWeight: FontWeight.bold
                          //                       ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //       Padding(
                          //         padding: EdgeInsets.only(top: height * 0.03),
                          //         child: Container(
                          //             height: height * 0.11,
                          //             width: width * 0.21,
                          //             decoration: BoxDecoration(
                          //                 color: Colors.black,
                          //                 borderRadius:
                          //                     BorderRadius.circular(20)),
                          //             child: Image(
                          //                 fit: BoxFit.cover,
                          //                 image:
                          //                     AssetImage("images/person.png"))),
                          //       )
                          //     ],
                          //   ),
                          // ),
                          // Padding(
                          //   padding: EdgeInsets.only(
                          //       left: width * 0.7, top: height * 0.005),
                          //   child: Container(
                          //     child: Row(
                          //       children: [
                          //         Text(
                          //           "Posted Time :",
                          //           style: TextStyle(
                          //             color: Colors.white,
                          //             fontSize: width * 0.03,
                          //             // fontWeight: FontWeight.bold
                          //           ),
                          //         ),
                          //         Text(
                          //           "22:40",
                          //           style: TextStyle(
                          //             color: Colors.orange,
                          //             fontSize: width * 0.03,
                          //             // fontWeight: FontWeight.bold
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // Padding(
                          //   padding: EdgeInsets.only(
                          //       left: width * 0.45, top: height * 0.03),
                          //   child: Text(
                          //     "Total Application      4",
                          //     style: TextStyle(
                          //         color: Colors.white,
                          //         fontSize: width * 0.04,
                          //         fontWeight: FontWeight.bold),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('applicationlist')
                            .doc(StaticData.uid)
                            .collection(widget.catagory)
                            .snapshots(),
                        builder: (context, snapshot) {
                          // print('snapshot ${snapshot.data!.docs.length}');

                          return snapshot.data == null
                              ? Center(child: CircularProgressIndicator())
                              : Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: height * 0.6,
                                    width: width,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: ListView.builder(
                                        itemCount: snapshot.data!.docs.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Container(
                                              height: height * 0.3,
                                              width: width,
                                              decoration: BoxDecoration(
                                                  color: Colors.black
                                                      .withOpacity(0.25),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Container(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: height *
                                                                      0.02),
                                                          child: Container(
                                                              height: height *
                                                                  0.12,
                                                              width: width *
                                                                  0.21,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .black,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                              child: Image(
                                                                  fit: BoxFit
                                                                      .fill,
                                                                  image: AssetImage(
                                                                      "images/person.png"))),
                                                        ),
                                                        Text(
                                                          "Apply Date",
                                                          style: TextStyle(
                                                            color:
                                                                Colors.orange,
                                                            fontSize:
                                                                width * 0.03,
                                                          ),
                                                        ),
                                                        Text(
                                                          snapshot
                                                              .data!.docs[index]
                                                              .get(
                                                                  'workerapplieddate'),
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize:
                                                                width * 0.04,
                                                          ),
                                                        ),
                                                        Text(
                                                          snapshot
                                                              .data!.docs[index]
                                                              .get(
                                                                  'workerappliedtime'),
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize:
                                                                width * 0.04,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    height: height * 0.32,
                                                    width: width * 0.7,
                                                    //color: Colors.blue,
                                                    child: Column(
                                                      // mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: height *
                                                                      0.02,
                                                                  left: width *
                                                                      0.25),
                                                          child: Text(
                                                            snapshot.data!
                                                                .docs[index]
                                                                .get(
                                                                    'workername'),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize:
                                                                    width *
                                                                        0.04,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  bottom:
                                                                      height *
                                                                          0.01),
                                                          child: Container(
                                                            child: Text(
                                                              "______________",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize:
                                                                    width *
                                                                        0.04,
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
                                                                "Job Title",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        width *
                                                                            0.04,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Text(
                                                                "Gender",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        width *
                                                                            0.04,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Text(
                                                                "Experience",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        width *
                                                                            0.04,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: height *
                                                                      0.02),
                                                          child: Container(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  snapshot
                                                                      .data!
                                                                      .docs[
                                                                          index]
                                                                      .get(
                                                                          'jobtitle'),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          width *
                                                                              0.04,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets.only(
                                                                      right: width *
                                                                          0.1),
                                                                  child: Text(
                                                                    snapshot
                                                                        .data!
                                                                        .docs[
                                                                            index]
                                                                        .get(
                                                                            'workergender'),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            width *
                                                                                0.04,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets.only(
                                                                      right: width *
                                                                          0.05),
                                                                  child: Text(
                                                                    snapshot
                                                                        .data!
                                                                        .docs[
                                                                            index]
                                                                        .get(
                                                                            'workerexperience'),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            width *
                                                                                0.04,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Container(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsets.only(
                                                                      left: width *
                                                                          0.03),
                                                                  child:
                                                                      InkWell(
                                                                    onTap: () {
                                                                      updatejbmodel(
                                                                          snapshot
                                                                              .data!
                                                                              .docs[index]
                                                                              .get('jobID'),
                                                                          'notaccepted');
                                                                      deletedocument(
                                                                          snapshot
                                                                              .data!
                                                                              .docs[index]
                                                                              .get('rejectID'),
                                                                          widget.catagory);
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          height *
                                                                              0.05,
                                                                      width:
                                                                          width *
                                                                              0.2,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .red,
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      ),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Text(
                                                                          "Reject",
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: width * 0.04,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets.only(
                                                                      right: width *
                                                                          0.14),
                                                                  child:
                                                                      InkWell(
                                                                    onTap: () {
                                                                      updatejbmodel(
                                                                          snapshot
                                                                              .data!
                                                                              .docs[index]
                                                                              .get('jobID'),
                                                                          'accepted');
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          height *
                                                                              0.05,
                                                                      width:
                                                                          width *
                                                                              0.2,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            255,
                                                                            219,
                                                                            59),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      ),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Text(
                                                                          "Accept",
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: width * 0.04,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                );
                        }),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
