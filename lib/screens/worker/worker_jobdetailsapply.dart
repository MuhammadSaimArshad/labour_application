import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:labour_application/utiles/model/appliedjobmodal.dart';
import 'package:labour_application/utiles/model/contracter_jobpostmodel.dart';
import 'package:labour_application/utiles/model/static_data.dart';

import 'package:labour_application/utiles/model/workerstatic_data.dart';
import 'package:uuid/uuid.dart';

class Jobdetail extends StatefulWidget {
  Jobdetail({
    super.key,
    required this.model,
  });
  Contracter_jobpostmodel? model;
  @override
  State<Jobdetail> createState() => _JobdetailState();
}

class _JobdetailState extends State<Jobdetail> {
  var height, width;
  void updatejbmodel(String wid, String status) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    await firebaseFirestore.collection('jobs').doc(wid).update(
      {
        'workerID': workerStaticData.loggedInUser.uid,
        'status': status,
      },
    );
    jobdetails();
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  void jobdetails() async {
    final now = new DateTime.now();
    String formatter = DateFormat('yMd').format(now);
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    String id = Uuid().v4();

    Appliedjobmodal model1 = Appliedjobmodal(
      jobID: widget.model!.id,
      category: widget.model!.category,
      contacterID: widget.model!.contactorID,
      contractorname: widget.model!.name,
      jobprice: widget.model!.hourlyprice,
      jobtitle: widget.model!.jobtitle,
      workerapplieddate: formatter,
      workerappliedtime: formatter,
      status: 'notaccepted',
      postedtime: widget.model!.time,
      workerID: workerStaticData.loggedInUser.uid,
      workerexperience: workerStaticData.loggedInUser.experience,
      workergender: workerStaticData.loggedInUser.gender,
      workername: workerStaticData.loggedInUser.uname,
      rejectID: id,
      description: widget.model!.description,
    );
    firebaseFirestore
        .collection('applicationlist')
        .doc(widget.model!.contactorID)
        .set(CatagoryModel().toMap());
    if (widget.model!.category == 'Plumber') {
      await firebaseFirestore
          .collection('applicationlist')
          .doc(widget.model!.contactorID)
          .set({'catagoryplumnber': widget.model!.category},
              SetOptions(merge: true));
    } else if (widget.model!.category == 'Technician') {
      await firebaseFirestore
          .collection('applicationlist')
          .doc(widget.model!.contactorID)
          .set(
        {'catagorytechnician': widget.model!.category},
      );
    } else if (widget.model!.category == 'Wooder') {
      await firebaseFirestore
          .collection('applicationlist')
          .doc(widget.model!.contactorID)
          .set(
        {'catagorywooder': widget.model!.category},
      );
    } else if (widget.model!.category == 'Fixer') {
      await firebaseFirestore
          .collection('applicationlist')
          .doc(widget.model!.contactorID)
          .set(CatagoryModel(catagoryfixer: widget.model!.category).toMap());
    }

    await firebaseFirestore
        .collection('applicationlist')
        .doc(widget.model!.contactorID)
        .collection(widget.model!.category.toString())
        .doc(id)
        .set(model1.toMap());

    Fluttertoast.showToast(msg: "Success");
  }

  //     .get()
  //     .then((value) {
  //   setState(() {

  // Appliedjobmodal modal =
  //     Appliedjobmodal(workername: Workerusermodel.fromMap());
  @override
  void initState() {
    print('ooooooo${widget.model}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Expanded(
            child: Container(
              height: height,
              width: width,
              color: Colors.amber,
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
                    height: height,
                    width: width,
                    color: Colors.black.withOpacity(0.6),
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
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: height * 0.03,
                                          right: width * 0.05),
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              widget.model!.name.toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: width * 0.05,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              widget.model!.jobtitle.toString(),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: width * 0.03,
                                                // fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: width * 0.05,
                                          top: height * 0.02),
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Salary(Hourly)   :",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: width * 0.03,
                                                    //fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                                Text(
                                                  widget.model!.hourlyprice
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: width * 0.03,
                                                    //fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Posted Time   :",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: width * 0.03,
                                                    //fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                                Text(
                                                  widget.model!.time.toString(),
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: width * 0.03,
                                                    // fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: height * 0.03),
                                child: Container(
                                    height: height * 0.12,
                                    width: width * 0.21,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Image(
                                        fit: BoxFit.cover,
                                        image:
                                            AssetImage("images/person.png"))),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: height * 0.05),
                          child: Container(
                            height: height * 0.09,
                            width: width,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.6),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Padding(
                                //   padding: EdgeInsets.only(left: width * 0.13),
                                //   child: Container(
                                //     height: height * 0.05,
                                //     width: width * 0.34,
                                //     decoration: BoxDecoration(
                                //         color:
                                //             Color.fromARGB(255, 230, 200, 112),
                                //         borderRadius:
                                //             BorderRadius.circular(10)),
                                //     child: Center(
                                //       child: Text(
                                //         "Job Description",
                                //         style: TextStyle(
                                //             fontSize: width * 0.04,
                                //             fontWeight: FontWeight.bold),
                                //       ),
                                //     ),
                                //   ),
                                // ),

                                Container(
                                  height: height * 0.05,
                                  width: width * 0.34,
                                  decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      "Map",
                                      style: TextStyle(
                                          fontSize: width * 0.04,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: height * 0.58,
                          width: width,
                          // color: Colors.white,
                          child: Stack(
                            children: [
                              Expanded(
                                child: Container(
                                  height: height,
                                  width: width,
                                  // color: Colors.red,
                                  child: GoogleMap(
                                    mapType: MapType.normal,
                                    initialCameraPosition: _kGooglePlex,
                                    onMapCreated:
                                        (GoogleMapController controller) {
                                      _controller.complete(controller);
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: InkWell(
                                    onTap: () {
                                      updatejbmodel(
                                        widget.model!.id.toString(),
                                        'pending',
                                      );
                                    },
                                    child: Container(
                                      height: height * 0.05,
                                      width: width * 0.3,
                                      color: Colors.amber,
                                      child: Center(child: Text("Apply Job")),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
