import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:labour_application/screens/contrecter/contract_work.dart';
import 'package:labour_application/screens/worker/worker_dashboard.dart';
import 'package:labour_application/screens/worker/worker_jobdetailsapply.dart';
import 'package:labour_application/screens/worker/worker_profile.dart';
import 'package:labour_application/screens/worker/worker_setting.dart';
import 'package:labour_application/utiles/model/contracter_jobpostmodel.dart';
import 'package:labour_application/utiles/model/static_data.dart';
import 'package:labour_application/utiles/model/worker_usermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:labour_application/utiles/model/workerstatic_data.dart';

class Workerhomepage extends StatefulWidget {
  const Workerhomepage({super.key});

  @override
  State<Workerhomepage> createState() => _WorkerhomepageState();
}

class _WorkerhomepageState extends State<Workerhomepage> {
  TextEditingController searchController = TextEditingController();
  String searchname = '';
  final FirebaseAuth auth = FirebaseAuth.instance;
  String? search;
  String name = '';
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

  getusermodel() async {
    await FirebaseFirestore.instance
        .collection('workerUser')
        .doc(StaticData.uid)
        .get()
        .then((value) {
      setState(() {
        workerStaticData.loggedInUser = Workerusermodel.fromMap(value.data()!);
      });
      print('workerStaticData.loggedInUser');
    });
  }

  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
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
                // onTap: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => Cart(),
                //     ),
                //   );
                // },
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
                          builder: (context) => Worker_dashboard(),
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
                        builder: (context) => Worker_profile(),
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
                        builder: (context) => Worker_setting(),
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
                      SizedBox(
                        height: height * 0.04,
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
                                                  controller: searchController,
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
                                height: height * 0.5,
                                width: width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                child: ListView.builder(
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (context, index) {
                                      print(
                                          'snapshot.${snapshot.data!.docs[index].get('name')}');
                                      if (searchname.isEmpty ||
                                          searchname == '') {
                                        return Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Container(
                                            height: height * 0.33,
                                            width: width,
                                            decoration: BoxDecoration(
                                                color: Colors.black
                                                    .withOpacity(0.25),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: height * 0.06),
                                                  child: Container(
                                                    height: height * 0.12,
                                                    width: width * 0.21,
                                                    decoration: BoxDecoration(
                                                        // color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: Image(
                                                        // color: Colors.white,
                                                        fit: BoxFit.fill,
                                                        image: AssetImage(
                                                            "images/person.png")),
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
                                                                    0.02),
                                                        child: Text(
                                                          snapshot
                                                              .data!.docs[index]
                                                              .get('name'),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize:
                                                                  width * 0.04,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: height *
                                                                    0.01),
                                                        child: Container(
                                                          child: Text(
                                                            "______________________________________",
                                                            style: TextStyle(
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
                                                              "Subject:",
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          199,
                                                                          255,
                                                                          153,
                                                                          0),
                                                                  fontSize:
                                                                      width *
                                                                          0.04,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      right: width *
                                                                          0.1),
                                                              child: Text(
                                                                snapshot.data!
                                                                    .docs[index]
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
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Text(
                                                        "Description:",
                                                        style: TextStyle(
                                                            color: Colors.amber,
                                                            fontSize:
                                                                width * 0.04,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        snapshot
                                                            .data!.docs[index]
                                                            .get('description'),
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize:
                                                              width * 0.04,
                                                        ),
                                                      ),
                                                      Text(
                                                        "______________________________________",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              199, 255, 153, 0),
                                                          fontSize:
                                                              width * 0.04,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right:
                                                                    width * 0.1,
                                                                top: height *
                                                                    0.02),
                                                        child: Container(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "Hourly price",
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
                                                                snapshot.data!
                                                                    .docs[index]
                                                                    .get(
                                                                        'hourlyprice'),
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
                                                                    left: width *
                                                                        0.03),
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    StaticData
                                                                        .jobconttitle = snapshot
                                                                            .data!
                                                                            .docs[index]
                                                                        [
                                                                        'jobtitle'];
                                                                    StaticData
                                                                        .jobcontuid = snapshot
                                                                            .data!
                                                                            .docs[
                                                                        index]['id'];
                                                                    Contracter_jobpostmodel
                                                                        model =
                                                                        Contracter_jobpostmodel(
                                                                      id: snapshot
                                                                          .data!
                                                                          .docs[index]['id'],
                                                                      name: snapshot
                                                                          .data!
                                                                          .docs[index]['name'],
                                                                      time: snapshot
                                                                          .data!
                                                                          .docs[index]['time'],
                                                                      hourlyprice: snapshot
                                                                          .data!
                                                                          .docs[index]['hourlyprice'],
                                                                      jobtitle: snapshot
                                                                          .data!
                                                                          .docs[index]['jobtitle'],
                                                                      contactorID: snapshot
                                                                          .data!
                                                                          .docs[index]['contactorID'],
                                                                      category: snapshot
                                                                          .data!
                                                                          .docs[index]['category'],
                                                                      date: snapshot
                                                                          .data!
                                                                          .docs[index]['date'],
                                                                      description: snapshot
                                                                          .data!
                                                                          .docs[index]['description'],
                                                                      status: snapshot
                                                                          .data!
                                                                          .docs[index]['status'],
                                                                      wotrkeridID: snapshot
                                                                          .data!
                                                                          .docs[index]['wotrkeridID'],
                                                                    );
                                                                    Navigator
                                                                        .push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                Jobdetail(
                                                                          model:
                                                                              model,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        height *
                                                                            0.05,
                                                                    width:
                                                                        width *
                                                                            0.21,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .orange,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Text(
                                                                        "Detail",
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize: width *
                                                                                0.04,
                                                                            fontWeight:
                                                                                FontWeight.bold),
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
                                      } else if (snapshot.data!.docs[index]
                                          .get('jobtitle')
                                          .toString()
                                          .toLowerCase()
                                          .contains(searchname.toLowerCase())) {
                                        return Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Container(
                                            height: height * 0.33,
                                            width: width,
                                            decoration: BoxDecoration(
                                                color: Colors.black
                                                    .withOpacity(0.25),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: height * 0.06),
                                                  child: Container(
                                                    height: height * 0.12,
                                                    width: width * 0.21,
                                                    decoration: BoxDecoration(
                                                        // color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: Image(
                                                        // color: Colors.white,
                                                        fit: BoxFit.fill,
                                                        image: AssetImage(
                                                            "images/person.png")),
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
                                                                    0.02),
                                                        child: Text(
                                                          snapshot
                                                              .data!.docs[index]
                                                              .get('name'),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize:
                                                                  width * 0.04,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: height *
                                                                    0.01),
                                                        child: Container(
                                                          child: Text(
                                                            "______________________________________",
                                                            style: TextStyle(
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
                                                              "Subject:",
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          199,
                                                                          255,
                                                                          153,
                                                                          0),
                                                                  fontSize:
                                                                      width *
                                                                          0.04,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      right: width *
                                                                          0.1),
                                                              child: Text(
                                                                snapshot.data!
                                                                    .docs[index]
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
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Text(
                                                        "Description:",
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    199,
                                                                    255,
                                                                    153,
                                                                    0),
                                                            fontSize:
                                                                width * 0.04,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        snapshot
                                                            .data!.docs[index]
                                                            .get('description'),
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize:
                                                              width * 0.04,
                                                        ),
                                                      ),
                                                      Text(
                                                        "______________________________________",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              199, 255, 153, 0),
                                                          fontSize:
                                                              width * 0.04,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right:
                                                                    width * 0.1,
                                                                top: height *
                                                                    0.02),
                                                        child: Container(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "Hourly price",
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
                                                                snapshot.data!
                                                                    .docs[index]
                                                                    .get(
                                                                        'hourlyprice'),
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
                                                                    left: width *
                                                                        0.03),
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    StaticData
                                                                        .jobconttitle = snapshot
                                                                            .data!
                                                                            .docs[index]
                                                                        [
                                                                        'jobtitle'];
                                                                    StaticData
                                                                        .jobcontuid = snapshot
                                                                            .data!
                                                                            .docs[
                                                                        index]['id'];
                                                                    Contracter_jobpostmodel
                                                                        model =
                                                                        Contracter_jobpostmodel(
                                                                      id: snapshot
                                                                          .data!
                                                                          .docs[index]['id'],
                                                                      name: snapshot
                                                                          .data!
                                                                          .docs[index]['name'],
                                                                      time: snapshot
                                                                          .data!
                                                                          .docs[index]['time'],
                                                                      hourlyprice: snapshot
                                                                          .data!
                                                                          .docs[index]['hourlyprice'],
                                                                      jobtitle: snapshot
                                                                          .data!
                                                                          .docs[index]['jobtitle'],
                                                                    );
                                                                    Navigator
                                                                        .push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                Jobdetail(
                                                                          model:
                                                                              model,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        height *
                                                                            0.05,
                                                                    width:
                                                                        width *
                                                                            0.21,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .orange,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Text(
                                                                        "Detail",
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize: width *
                                                                                0.04,
                                                                            fontWeight:
                                                                                FontWeight.bold),
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
  // String chatroomid(String user1, String user2) {
  //   if (user1[0].toLowerCase().codeUnits[0] >
  //       user2.toLowerCase().codeUnits[0]) {
  //     return "$user1$user2";
  //   } else {
  //     return "$user2$user1";
  //   }
  // }
