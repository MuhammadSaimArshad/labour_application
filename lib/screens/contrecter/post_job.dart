import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:labour_application/screens/contrecter/contracter_dashboard.dart';
import 'package:labour_application/utiles/model/contracter_jobpostmodel.dart';
import 'package:labour_application/utiles/model/static_data.dart';
import 'package:uuid/uuid.dart';

class Postjob extends StatefulWidget {
  const Postjob({super.key});

  @override
  State<Postjob> createState() => _PostjobState();
}

class _PostjobState extends State<Postjob> {
  TextEditingController datecontroller = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController hourlyrateController = TextEditingController();

  var selectdate;
  String? categoryvalue;
  List<String> catagory = [
    'Plumber',
    'Technician',
    'Wooder',
    'Fixer',
  ];
  void postjobdatatoDB() async {
    var dt = DateTime.now();

    var time = '${dt.hour} : ${dt.hour}';
    String id = Uuid().v4();
    Contracter_jobpostmodel model = Contracter_jobpostmodel(
      category: categoryvalue!,
      date: selectdate,
      description: descriptionController.text,
      hourlyprice: hourlyrateController.text,
      jobtitle: jobController.text,
      id: id,
      name: StaticData.loggedInUser.uname,
      time: time,
      contactorID: StaticData.uid,
      status: 'notaccepted',
    );

    await FirebaseFirestore.instance
        .collection('jobs')
        .doc(id)
        .set(model.toMap());
    Fluttertoast.showToast(
      msg: 'Succesfully job posted',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("images/background.jpeg")),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Post Job",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.08,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                    height: height * 0.6,
                    width: width * 0.9,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: height * 0.11,
                          width: width * 0.8,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Job Title",
                                  style: TextStyle(
                                      fontSize: width * 0.045,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  height: height * 0.08,
                                  child: TextFormField(
                                    controller: jobController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.text,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      // labelText: 'Construction Job',
                                      labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                        Container(
                          height: height * 0.11,
                          width: width * 0.8,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Description",
                                  style: TextStyle(
                                      fontSize: width * 0.045,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  height: height * 0.08,
                                  child: TextFormField(
                                    controller: descriptionController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.text,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      // labelText: 'Job Description',
                                      labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                        Container(
                          height: height * 0.11,
                          width: width * 0.8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Category",
                                style: TextStyle(
                                    fontSize: width * 0.045,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                height: height * 0.065,
                                width: width * 0.8,
                                decoration: BoxDecoration(
                                  // color: Colors.black.withOpacity(0.25),
                                  border: Border(
                                      bottom: BorderSide(
                                    color: Colors.white,
                                  )),
                                  // border: Border.all(
                                  //   color: Colors.white,
                                  //   width: 2.5,
                                  // ),
                                ),
                                child: Center(
                                  child: SizedBox(
                                    height: height * 0.06,
                                    width: width * 0.35,
                                    child: Center(
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          style: TextStyle(color: Colors.white),
                                          dropdownColor:
                                              Colors.black.withOpacity(0.6),
                                          value: categoryvalue,
                                          items: catagory.map(
                                            (val) {
                                              return DropdownMenuItem<String>(
                                                value: val,
                                                child: Text(val),
                                              );
                                            },
                                          ).toList(),
                                          onChanged: (value) {
                                            setState(() {
                                              categoryvalue = value!;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: height * 0.11,
                          width: width * 0.8,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Hourly Rate",
                                  style: TextStyle(
                                      fontSize: width * 0.045,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  height: height * 0.08,
                                  child: TextFormField(
                                    controller: hourlyrateController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      // labelText: 'Job Description',
                                      labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                        Container(
                          height: height * 0.11,
                          width: width * 0.8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Date",
                                style: TextStyle(
                                    fontSize: width * 0.045,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: () {
                                  // DatePicker.showDatePicker(context,
                                  //     theme: const DatePickerTheme(
                                  //       containerHeight: 210.0,
                                  //     ),
                                  //     showTitleActions: true,
                                  //     minTime: DateTime(1900, 1, 1),
                                  //     maxTime: DateTime(2100, 1, 1),
                                  //     onConfirm: (date) {
                                  //   selectdate =
                                  //       '${date.year} - ${date.month} - ${date.day}';

                                  //   setState(() {
                                  //     datecontroller.text = selectdate;
                                  //   });
                                  // },
                                  //     currentTime: DateTime.now(),
                                  //     locale: LocaleType.en);
                                },
                                child: Container(
                                  height: height * 0.05,
                                  width: width * 0.8,
                                  decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                      color: Colors.white,
                                    )),
                                    //     border: Border.all(
                                    //   color: Colors.white,
                                    //   width: 2.5,
                                    // )
                                    // color: Colors.red,
                                    // borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "select date",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
                InkWell(
                  onTap: () {
                    postjobdatatoDB();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Contracter_dashboard(),
                      ),
                    );
                  },
                  child: Container(
                    height: height * 0.055,
                    width: width * 0.5,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Text(
                        "Post",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
