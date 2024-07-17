import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:labour_application/utiles/model/workerstatic_data.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:labour_application/utiles/model/bankdetails_model.dart';
import 'package:labour_application/utiles/model/worker_usermodel.dart';

class Worker_bankdetail extends StatefulWidget {
  const Worker_bankdetail({super.key});

  @override
  State<Worker_bankdetail> createState() => _Worker_bankdetailState();
}

class _Worker_bankdetailState extends State<Worker_bankdetail> {
  TextEditingController accountnameController = TextEditingController();
  TextEditingController banknameController = TextEditingController();
  TextEditingController accountnumberController = TextEditingController();
  TextEditingController sortcodeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  var holdername, bname, anumber, scode;
  void postbankdatatoDB() async {
    await firebaseFirestore
        .collection("workerUser")
        .doc(workerStaticData.uid)
        .update({
      'accountntholdername': holdername,
      'bankname': bname,
      'accountnumber': anumber,
      'sortcode': scode
    });
    // Workerusermodel model = Workerusermodel(
    //   accountntholdername: accountnameController.text,
    //   bankname: banknameController.text,
    //   accountnumber: accountnumberController.text,
    //   sortcode: sortcodeController.text,
    // );

    // await FirebaseFirestore.instance
    //     .collection('workerUser')
    //     .doc(workerStaticData.uid)
    //     .set(model.toMap());
    Fluttertoast.showToast(
      msg: 'Succesfully details posted',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

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
            color: Colors.amber,
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
                ),
                Container(
                  height: height,
                  width: width,
                  color: Colors.black.withOpacity(0.25),
                  child: Column(
                    children: [
                      Container(
                        height: height * 0.11,
                        width: width,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.arrow_back)),
                            Text(
                              "BANK DETAILS",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: height * 0.02),
                              child: Container(
                                  height: height * 0.07,
                                  width: width * 0.12,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(70),
                                      border: Border.all(
                                          color: Colors.orange, width: 2)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image(
                                        fit: BoxFit.cover,
                                        image: AssetImage("images/person.png")),
                                  )),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: height * 0.05),
                        child: Container(
                          child: Text(
                            "Add Your Information Here",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Container(
                          height: height * 0.55,
                          child: Column(children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: height * 0.05, left: width * 0.2),
                              child: Container(
                                height: height * 0.1,
                                width: width * 0.8,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        bottomLeft: Radius.circular(30))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: width * 0.04),
                                      child: Icon(
                                        Icons.person,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: height * 0.02,
                                          left: width * 0.06),
                                      child: Container(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            //mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Account Holder Name",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: width * 0.03,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Container(
                                                height: height * 0.05,
                                                width: width * 0.6,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15, right: 15),
                                                  child: TextFormField(
                                                    controller:
                                                        accountnameController,
                                                    keyboardType:
                                                        TextInputType.text,
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                    onChanged: (value) {
                                                      holdername = value;
                                                    },
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Please enter Text ';
                                                      }
                                                      return null;
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
                                                      // labelText: 'E-mail',
                                                      labelStyle: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ]),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: height * 0.02, left: width * 0.2),
                              child: Container(
                                height: height * 0.1,
                                width: width * 0.8,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        bottomLeft: Radius.circular(30))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: width * 0.04),
                                      child: Icon(
                                        Icons.home_work,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: height * 0.02,
                                          left: width * 0.06),
                                      child: Container(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            //mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Bank Name",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: width * 0.03,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Container(
                                                height: height * 0.05,
                                                width: width * 0.6,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15, right: 15),
                                                  child: TextFormField(
                                                    controller:
                                                        banknameController,
                                                    keyboardType:
                                                        TextInputType.text,
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                    onChanged: (value) {
                                                      bname = value;
                                                    },
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Please enter Text ';
                                                      }
                                                      return null;
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
                                                      // labelText: 'E-mail',
                                                      labelStyle: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ]),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: height * 0.02, left: width * 0.2),
                              child: Container(
                                height: height * 0.1,
                                width: width * 0.8,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        bottomLeft: Radius.circular(30))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: width * 0.04),
                                      child: Icon(
                                        Icons.format_indent_increase,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: height * 0.02,
                                          left: width * 0.06),
                                      child: Container(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            //mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Account Number",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: width * 0.03,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Container(
                                                height: height * 0.05,
                                                width: width * 0.6,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15, right: 15),
                                                  child: TextFormField(
                                                    controller:
                                                        accountnumberController,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                    onChanged: (value) {
                                                      anumber = value;
                                                    },
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Please enter Text ';
                                                      }
                                                      return null;
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
                                                      // labelText: 'E-mail',
                                                      labelStyle: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ]),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: height * 0.02, left: width * 0.2),
                              child: Container(
                                height: height * 0.1,
                                width: width * 0.8,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        bottomLeft: Radius.circular(30))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: width * 0.04),
                                      child: Icon(
                                        Icons.file_copy_outlined,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: height * 0.02,
                                          left: width * 0.06),
                                      child: Container(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            //mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Sort Code",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: width * 0.03,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Container(
                                                height: height * 0.05,
                                                width: width * 0.6,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15, right: 15),
                                                  child: TextFormField(
                                                    controller:
                                                        sortcodeController,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                    onChanged: (value) {
                                                      scode = value;
                                                    },
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Please enter Text ';
                                                      }
                                                      return null;
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
                                                      // labelText: 'E-mail',
                                                      labelStyle: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ]),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: height * 0.06),
                        child: InkWell(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              postbankdatatoDB();
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   const SnackBar(
                              //       content:
                              //           Text('Details added successfuly ')),
                              // );
                            }
                          },
                          child: Container(
                            height: height * 0.09,
                            width: width * 0.7,
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(22)),
                            child: Center(
                              child: Text(
                                "Add Details",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
