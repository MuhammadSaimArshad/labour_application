import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:labour_application/utiles/colors.dart';

class Contracter_joblist extends StatefulWidget {
  const Contracter_joblist({super.key});

  @override
  State<Contracter_joblist> createState() => _Contracter_joblistState();
}

class _Contracter_joblistState extends State<Contracter_joblist> {
  TextEditingController searchController = TextEditingController();
  String searchname = '';
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Container(
            height: height,
            width: width,
            //color: Colors.amber,
            child: Stack(
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
                  height: height * 0.3,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.25),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.menu_outlined,
                                color: Colors.white,
                                size: 20,
                              ),
                              Icon(
                                Icons.message,
                                color: Colors.white,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          height: height * 0.1,
                          width: width,
                          child: Image(
                              color: Colors.white,
                              image: AssetImage("images/kjob.png")),
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          height: height * 0.02,
                          width: width * 0.5,
                          child: Center(
                            child: Text(
                              "Perfect job for you",
                              style: TextStyle(
                                  color: Colors.white, fontSize: width * 0.03),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: height * 0.07,
                          width: width * 0.9,
                          //color: Colors.amber,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    height: height * 0.07,
                                    width: width * 0.7,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      // border:
                                      //     Border.all(color: Colors.black, width: 2)
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: height * 0.07,
                                          width: width * 0.61,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.black,
                                                  width: 2)),
                                          child: Center(
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                    right: 20, left: 20),
                                                // padding: EdgeInsets.only(
                                                //     right: width * 0.33),
                                                child: TextFormField(
                                                  onChanged: (value) {
                                                    setState(() {
                                                      searchname = value;
                                                    });
                                                  },
                                                  controller: searchController,
                                                  decoration:
                                                      const InputDecoration(
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.white),
                                                    ),
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.white),
                                                    ),
                                                    labelText: 'Search Here...',
                                                    labelStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                )
                                                // child: Text(
                                                //   " Search Here...",
                                                //   style: TextStyle(
                                                //       color: Colors.black54,
                                                //       fontSize: width * 0.04),
                                                // ),
                                                ),
                                          ),
                                        ),
                                        Icon(
                                          Icons.search,
                                          color: Colors.black54,
                                          size: 28,
                                        ),
                                      ],
                                    )),
                                Container(
                                  height: height * 0.05,
                                  width: width * 0.13,
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.black,
                                    size: 28,
                                  ),
                                )
                              ]),
                        ),
                      )
                    ],
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('jobs')
                        .snapshots(),
                    builder: (context, snapshot) {
                      return snapshot.data == null
                          ? Center(child: CircularProgressIndicator())
                          : Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: height * 0.55,
                                width: width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                child: ListView.builder(
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (context, index) {
                                      if (searchname.isEmpty ||
                                          searchname == '') {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: height * 0.25,
                                            width: width * 0.9,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              // color: Colormanager.headingcolor
                                              color: Colormanager.headingcolor
                                                  .withOpacity(0.7),
                                            ),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: height * 0.06,
                                                  width: width,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        Colormanager.ambercolor,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomRight: Radius
                                                                .circular(20),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          snapshot
                                                              .data!.docs[index]
                                                              .get('category'),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  width * 0.04,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          snapshot
                                                              .data!.docs[index]
                                                              .get(
                                                                  'hourlyprice'),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  width * 0.04,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: height * 0.18,
                                                  width: width * 0.9,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Text(
                                                        snapshot
                                                            .data!.docs[index]
                                                            .get('description'),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize:
                                                                width * 0.04,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            snapshot.data!
                                                                .docs[index]
                                                                .get(
                                                                    'jobtitle'),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .amber,
                                                                fontSize:
                                                                    width *
                                                                        0.04,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            snapshot.data!
                                                                .docs[index]
                                                                .get('date'),
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
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      } else if (snapshot.data!.docs[index]
                                          .get('category')
                                          .toString()
                                          .toLowerCase()
                                          .contains(searchname.toLowerCase())) {
                                        return Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Container(
                                            height: height * 0.25,
                                            width: width * 0.9,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              // color: Colormanager.headingcolor
                                              color: Colormanager.headingcolor
                                                  .withOpacity(0.7),
                                            ),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: height * 0.06,
                                                  width: width,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        Colormanager.ambercolor,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomRight: Radius
                                                                .circular(20),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          snapshot
                                                              .data!.docs[index]
                                                              .get('category'),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  width * 0.04,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          snapshot
                                                              .data!.docs[index]
                                                              .get(
                                                                  'hourlyprice'),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  width * 0.04,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: height * 0.18,
                                                  width: width * 0.9,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Text(
                                                        snapshot
                                                            .data!.docs[index]
                                                            .get('description'),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize:
                                                                width * 0.04,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            snapshot.data!
                                                                .docs[index]
                                                                .get(
                                                                    'jobtitle'),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .amber,
                                                                fontSize:
                                                                    width *
                                                                        0.04,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            snapshot.data!
                                                                .docs[index]
                                                                .get('date'),
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
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      } else {
                                        return Container();
                                      }
                                    }),
                              ),
                            );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
