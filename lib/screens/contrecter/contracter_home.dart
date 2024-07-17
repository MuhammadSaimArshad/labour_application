import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:labour_application/screens/contrecter/contract_work.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:labour_application/screens/contrecter/contracter_application.dart';

import 'package:labour_application/screens/contrecter/contracter_dashboard.dart';
import 'package:labour_application/screens/contrecter/contracter_profile.dart';
import 'package:labour_application/screens/contrecter/contracter_setting.dart';
import 'package:labour_application/screens/contrecter/newscreen.dart';
import 'package:labour_application/screens/contrecter/worker_detail.dart';
import 'package:labour_application/utiles/colors.dart';

import 'package:labour_application/utiles/model/contractor_usermodel.dart';
import 'package:labour_application/utiles/model/static_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utiles/model/worker_usermodel.dart';

class Contracterhome extends StatefulWidget {
  const Contracterhome({super.key});

  @override
  State<Contracterhome> createState() => _ContracterhomeState();
}

class _ContracterhomeState extends State<Contracterhome> {
  TextEditingController searchController = TextEditingController();
  String searchname = '';
  final FirebaseAuth auth = FirebaseAuth.instance;
  void getUser() async {
    await FirebaseFirestore.instance
        .collection('contracterUser')
        .doc(StaticData.uid)
        .get()
        .then((value) {
      setState(() {
        StaticData.loggedInUser = Contractorusermodel.fromMap(value.data()!);
      });
    });
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

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

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Newscreen(),
                    ),
                  );
                },
                child: Icon(
                  Icons.message,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            )
          ],
        ),
        drawer: FractionallySizedBox(
          // elevation: 10.0,
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("images/background.jpeg")),
            ),
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: height * 0.13,
                        width: width,
                        child: Image(
                            color: Colors.white,
                            image: AssetImage("images/kjob.png")),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.1,
                ),
                Container(
                  child: ListTile(
                    title: Text('Home Page',
                        style: TextStyle(fontSize: 25, color: Colors.white)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Contracter_dashboard(),
                        ),
                      );
                    },
                  ),
                ),
                ListTile(
                  title: Text('Profile',
                      style: TextStyle(fontSize: 25, color: Colors.white)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Contracter_profile(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Text('Setting',
                      style: TextStyle(fontSize: 25, color: Colors.white)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Contracter_setting(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Text('LogOut',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      )),
                  onTap: () {
                    logout();
                  },
                ),
              ],
            ),
          ),
          widthFactor: 0.7,
        ),
        body: Stack(
          children: [
            Container(
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
                              // child: Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Icon(
                              //       Icons.menu_outlined,
                              //       color: Colors.white,
                              //       size: 20,
                              //     ),
                              //     Icon(
                              //       Icons.message,
                              //       color: Colors.white,
                              //       size: 20,
                              //     ),
                              //   ],
                              // ),

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
                                    color: Colors.white,
                                    fontSize: width * 0.03),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                                    controller:
                                                        searchController,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        searchname = value;
                                                      });
                                                    },
                                                    decoration:
                                                        const InputDecoration(
                                                      focusedBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      labelText:
                                                          'Search Here...',
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
                          .collection('workerUser')
                          .snapshots(),
                      builder: (context, snapshot) {
                        return snapshot.data == null
                            ? Center(child: CircularProgressIndicator())
                            : Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: height * 0.5,
                                  width: width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: ListView.builder(
                                      itemCount: snapshot.data!.docs.length,
                                      itemBuilder: (context, index) {
                                        if (searchname.isEmpty ||
                                            searchname == '') {
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
                                                    .withOpacity(0.25),
                                              ),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: height * 0.2,
                                                    width: width * 0.3,
                                                    // color: Colors.amber,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Container(
                                                          height: height * 0.15,
                                                          width: width * 0.25,
                                                          decoration:
                                                              BoxDecoration(
                                                                  // color: Colors.black,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                          child: Image(
                                                              // color: Colors.white,
                                                              fit: BoxFit.fill,
                                                              image: AssetImage(
                                                                  "images/person.png")),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Icons.star,
                                                              size:
                                                                  width * 0.05,
                                                              color:
                                                                  Colors.amber,
                                                            ),
                                                            Icon(
                                                              Icons.star,
                                                              size:
                                                                  width * 0.05,
                                                              color:
                                                                  Colors.amber,
                                                            ),
                                                            Icon(
                                                              Icons.star,
                                                              size:
                                                                  width * 0.05,
                                                              color:
                                                                  Colors.amber,
                                                            ),
                                                            Icon(
                                                              Icons.star,
                                                              size:
                                                                  width * 0.05,
                                                              color:
                                                                  Colors.amber,
                                                            ),
                                                            Icon(
                                                              Icons.star,
                                                              size:
                                                                  width * 0.05,
                                                              color:
                                                                  Colors.amber,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                      height: height * 0.2,
                                                      width: width * 0.38,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Text(
                                                            snapshot.data!
                                                                .docs[index]
                                                                .get('uname'),
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white,
                                                                fontSize:
                                                                    width *
                                                                        0.05),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Container(
                                                                height: height *
                                                                    0.03,
                                                                width: width *
                                                                    0.06,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: Colors
                                                                      .amber,
                                                                ),
                                                                child: Center(
                                                                  child: Icon(
                                                                    Icons
                                                                        .g_mobiledata_outlined,
                                                                    size: width *
                                                                        0.04,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: width *
                                                                    0.02,
                                                              ),
                                                              Text(
                                                                snapshot.data!
                                                                    .docs[index]
                                                                    .get(
                                                                        'email'),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        width *
                                                                            0.03),
                                                              )
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Container(
                                                                height: height *
                                                                    0.03,
                                                                width: width *
                                                                    0.06,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: Colors
                                                                      .amber,
                                                                ),
                                                                child: Center(
                                                                  child: Icon(
                                                                    Icons
                                                                        .note_add,
                                                                    size: width *
                                                                        0.03,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: width *
                                                                    0.02,
                                                              ),
                                                              Text(
                                                                snapshot.data!
                                                                    .docs[index]
                                                                    .get('job'),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        width *
                                                                            0.03),
                                                              )
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Container(
                                                                height: height *
                                                                    0.03,
                                                                width: width *
                                                                    0.06,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: Colors
                                                                      .amber,
                                                                ),
                                                                child: Center(
                                                                  child: Icon(
                                                                    Icons
                                                                        .emoji_people_outlined,
                                                                    size: width *
                                                                        0.03,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: width *
                                                                    0.02,
                                                              ),
                                                              Text(
                                                                snapshot.data!
                                                                    .docs[index]
                                                                    .get(
                                                                        'gender'),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        width *
                                                                            0.03),
                                                              )
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Container(
                                                                height: height *
                                                                    0.03,
                                                                width: width *
                                                                    0.06,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: Colors
                                                                      .amber,
                                                                ),
                                                                child: Center(
                                                                  child: Icon(
                                                                    Icons.done,
                                                                    size: width *
                                                                        0.03,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: width *
                                                                    0.02,
                                                              ),
                                                              Text(
                                                                snapshot.data!
                                                                    .docs[index]
                                                                    .get(
                                                                        'experience'),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        width *
                                                                            0.03),
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      )),
                                                  InkWell(
                                                    onTap: () {
                                                      Workerusermodel model =
                                                          Workerusermodel(
                                                        uname: snapshot.data!
                                                                .docs[index]
                                                            ['uname'],
                                                        email: snapshot.data!
                                                                .docs[index]
                                                            ['email'],
                                                        phoneNO: snapshot.data!
                                                                .docs[index]
                                                            ['phoneNO'],
                                                        experience: snapshot
                                                                .data!
                                                                .docs[index]
                                                            ['experience'],
                                                        job: snapshot.data!
                                                            .docs[index]['job'],
                                                        dateofbirth: snapshot
                                                                .data!
                                                                .docs[index]
                                                            ['dateofbirth'],
                                                      );

                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              Worker_detail(
                                                            model: model,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Container(
                                                        height: height * 0.2,
                                                        width: width * 0.25,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Container(
                                                              height:
                                                                  height * 0.05,
                                                              width:
                                                                  width * 0.21,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .orange,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  "Detail",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          width *
                                                                              0.04,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        } else if (snapshot.data!.docs[index]
                                            .get('uname')
                                            .toString()
                                            .toLowerCase()
                                            .contains(
                                                searchname.toLowerCase())) {
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
                                                    .withOpacity(0.25),
                                              ),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: height * 0.2,
                                                    width: width * 0.3,
                                                    // color: Colors.amber,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Container(
                                                          height: height * 0.15,
                                                          width: width * 0.25,
                                                          decoration:
                                                              BoxDecoration(
                                                                  // color: Colors.black,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                          child: Image(
                                                              // color: Colors.white,
                                                              fit: BoxFit.fill,
                                                              image: AssetImage(
                                                                  "images/person.png")),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Icons.star,
                                                              size:
                                                                  width * 0.05,
                                                              color:
                                                                  Colors.amber,
                                                            ),
                                                            Icon(
                                                              Icons.star,
                                                              size:
                                                                  width * 0.05,
                                                              color:
                                                                  Colors.amber,
                                                            ),
                                                            Icon(
                                                              Icons.star,
                                                              size:
                                                                  width * 0.05,
                                                              color:
                                                                  Colors.amber,
                                                            ),
                                                            Icon(
                                                              Icons.star,
                                                              size:
                                                                  width * 0.05,
                                                              color:
                                                                  Colors.amber,
                                                            ),
                                                            Icon(
                                                              Icons.star,
                                                              size:
                                                                  width * 0.05,
                                                              color:
                                                                  Colors.amber,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                      height: height * 0.2,
                                                      width: width * 0.38,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Text(
                                                            snapshot.data!
                                                                .docs[index]
                                                                .get('uname'),
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white,
                                                                fontSize:
                                                                    width *
                                                                        0.05),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Container(
                                                                height: height *
                                                                    0.03,
                                                                width: width *
                                                                    0.06,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: Colors
                                                                      .amber,
                                                                ),
                                                                child: Center(
                                                                  child: Icon(
                                                                    Icons
                                                                        .g_mobiledata_outlined,
                                                                    size: width *
                                                                        0.04,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: width *
                                                                    0.02,
                                                              ),
                                                              Text(
                                                                snapshot.data!
                                                                    .docs[index]
                                                                    .get(
                                                                        'email'),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        width *
                                                                            0.03),
                                                              )
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Container(
                                                                height: height *
                                                                    0.03,
                                                                width: width *
                                                                    0.06,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: Colors
                                                                      .amber,
                                                                ),
                                                                child: Center(
                                                                  child: Icon(
                                                                    Icons
                                                                        .note_add,
                                                                    size: width *
                                                                        0.03,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: width *
                                                                    0.02,
                                                              ),
                                                              Text(
                                                                snapshot.data!
                                                                    .docs[index]
                                                                    .get('job'),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        width *
                                                                            0.03),
                                                              )
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Container(
                                                                height: height *
                                                                    0.03,
                                                                width: width *
                                                                    0.06,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: Colors
                                                                      .amber,
                                                                ),
                                                                child: Center(
                                                                  child: Icon(
                                                                    Icons
                                                                        .emoji_people_outlined,
                                                                    size: width *
                                                                        0.03,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: width *
                                                                    0.02,
                                                              ),
                                                              Text(
                                                                snapshot.data!
                                                                    .docs[index]
                                                                    .get(
                                                                        'gender'),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        width *
                                                                            0.03),
                                                              )
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Container(
                                                                height: height *
                                                                    0.03,
                                                                width: width *
                                                                    0.06,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: Colors
                                                                      .amber,
                                                                ),
                                                                child: Center(
                                                                  child: Icon(
                                                                    Icons.done,
                                                                    size: width *
                                                                        0.03,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: width *
                                                                    0.02,
                                                              ),
                                                              Text(
                                                                snapshot.data!
                                                                    .docs[index]
                                                                    .get(
                                                                        'experience'),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        width *
                                                                            0.03),
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      )),
                                                  InkWell(
                                                    onTap: () {
                                                      Workerusermodel model =
                                                          Workerusermodel(
                                                        uname: snapshot.data!
                                                                .docs[index]
                                                            ['uname'],
                                                        email: snapshot.data!
                                                                .docs[index]
                                                            ['email'],
                                                        phoneNO: snapshot.data!
                                                                .docs[index]
                                                            ['phoneNO'],
                                                        experience: snapshot
                                                                .data!
                                                                .docs[index]
                                                            ['experience'],
                                                        job: snapshot.data!
                                                            .docs[index]['job'],
                                                        dateofbirth: snapshot
                                                                .data!
                                                                .docs[index]
                                                            ['dateofbirth'],
                                                      );

                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              Worker_detail(
                                                            model: model,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Container(
                                                        height: height * 0.2,
                                                        width: width * 0.25,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Container(
                                                              height:
                                                                  height * 0.05,
                                                              width:
                                                                  width * 0.21,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .orange,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  "Detail",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          width *
                                                                              0.04,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )),
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
                  // Align(
                  //   alignment: Alignment.bottomCenter,
                  //   // child: Container(
                  //   //   height: height * 0.07,
                  //   //   width: width,
                  //   //   color: Colors.white,
                  //   //   child: Row(
                  //   //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   //     children: [
                  //   //       Container(
                  //   //         height: height * 0.05,
                  //   //         width: width * 0.2,
                  //   //         decoration: BoxDecoration(
                  //   //             color: Colors.orange,
                  //   //             borderRadius: BorderRadius.circular(22)),
                  //   //         child: Row(
                  //   //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   //           children: [
                  //   //             Icon(
                  //   //               Icons.home,
                  //   //               color: Colors.black,
                  //   //               size: 19,
                  //   //             ),
                  //   //             Text(
                  //   //               "Home",
                  //   //               style: TextStyle(
                  //   //                   fontWeight: FontWeight.bold,
                  //   //                   fontSize: width * 0.03),
                  //   //             )
                  //   //           ],
                  //   //         ),
                  //   //       ),
                  //   //       Container(
                  //   //         height: height * 0.05,
                  //   //         width: width * 0.15,
                  //   //         decoration: BoxDecoration(
                  //   //             // color: Colors.orange,
                  //   //             borderRadius: BorderRadius.circular(22)),
                  //   //         child: Icon(
                  //   //           Icons.shopping_bag,
                  //   //           color: Colors.black,
                  //   //           size: 20,
                  //   //         ),
                  //   //       ),
                  //   //       Container(
                  //   //         height: height * 0.05,
                  //   //         width: width * 0.15,
                  //   //         decoration: BoxDecoration(
                  //   //             // color: Colors.orange,
                  //   //             borderRadius: BorderRadius.circular(22)),
                  //   //         child: Icon(
                  //   //           Icons.settings,
                  //   //           color: Colors.black,
                  //   //           size: 21,
                  //   //         ),
                  //   //       ),
                  //   //       Container(
                  //   //         height: height * 0.05,
                  //   //         width: width * 0.15,
                  //   //         decoration: BoxDecoration(
                  //   //             // color: Colors.orange,
                  //   //             borderRadius: BorderRadius.circular(22)),
                  //   //         child: Icon(
                  //   //           Icons.person_outline,
                  //   //           color: Colors.black,
                  //   //           size: 24,
                  //   //         ),
                  //   //       ),
                  //   //     ],
                  //   //   ),
                  //   // ),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
