import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:labour_application/screens/worker/myRadioOption.dart';
import 'package:labour_application/utiles/colors.dart';

import 'package:labour_application/utiles/model/workerstatic_data.dart';

class Worker_editprofile extends StatefulWidget {
  const Worker_editprofile({super.key});

  @override
  State<Worker_editprofile> createState() => _Worker_editprofileState();
}

class _Worker_editprofileState extends State<Worker_editprofile> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController experienceController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var selectdate;

  String? _groupValue;

  ValueChanged<String?> _valueChangedHandler() {
    return (value) => setState(() => _groupValue = value!);
  }

  var fullname;
  var phoneno;
  var jobtitle;
  var gender;
  var experience;
  var birthdate;
  var adress;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
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
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: height * 0.04,
                      width: width * 0.13,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black.withOpacity(0.7),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: width * 0.05,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.2,
                  ),
                  Text(
                    "Add worker Details",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: height * 0.2,
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: height * 0.1,
                      width: width * 0.4,
                      child: Image(image: AssetImage("images/person.png")),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Form(
                key: _formKey,
                child: Container(
                    height: height * 0.7,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: Container(
                            height: height * 0.01,
                            width: width * 0.2,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        Container(
                          height: height * 0.08,
                          width: width * 0.8,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Username",
                                  style: TextStyle(
                                      fontSize: width * 0.035,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  height: height * 0.05,
                                  child: TextFormField(
                                    controller: usernameController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter username';
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
                                      prefixIconColor: Colors.white,
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: Colors.white,
                                      ),
                                      labelText: 'Username',
                                      labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        fullname = value;
                                      });
                                    },
                                  ),
                                ),
                              ]),
                        ),
                        Container(
                          height: height * 0.08,
                          width: width * 0.8,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Phone Number",
                                  style: TextStyle(
                                      fontSize: width * 0.035,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  height: height * 0.05,
                                  child: TextFormField(
                                    controller: phonenumber,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter phone number';
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
                                      prefixIcon: Icon(
                                        Icons.phone,
                                        color: Colors.white,
                                      ),
                                      labelText: 'Phone number',
                                      labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        phoneno = value;
                                      });
                                    },
                                  ),
                                ),
                              ]),
                        ),
                        Container(
                          height: height * 0.06,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Job Title',
                                style:
                                    TextStyle(color: Colormanager.textcolors),
                              ),
                              Container(
                                height: height * 0.06,
                                width: width * 0.55,
                                child: TextFormField(
                                  style: const TextStyle(color: Colors.white),
                                  controller: jobController,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    // labelText: 'Company',
                                    labelStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      jobtitle = value;
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text ';
                                    }
                                    return null;
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: height * 0.06,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Gender',
                                style:
                                    TextStyle(color: Colormanager.textcolors),
                              ),
                              Container(
                                height: height * 0.06,
                                width: width * 0.55,
                                // color: Colors.amber,
                                child: Row(
                                  children: [
                                    MyRadioOption<String>(
                                      value: 'Male',
                                      groupValue: _groupValue,
                                      onChanged: (value) {
                                        setState(() {
                                          _valueChangedHandler();
                                          gender = value;
                                        });
                                      },
                                      // onChanged: _valueChangedHandler(),

                                      // label: '1',
                                      text: 'Male',
                                    ),
                                    MyRadioOption<String>(
                                      value: 'Female',
                                      groupValue: _groupValue,
                                      onChanged: (value) {
                                        setState(() {
                                          gender = value;
                                          _valueChangedHandler();
                                        });
                                      },
                                      // onChanged: _valueChangedHandler(),
                                      // label: '2',
                                      text: 'Female',
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: height * 0.1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: width * 0.4,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Experience',
                                      style: TextStyle(
                                          color: Colormanager.textcolors,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      height: height * 0.05,
                                      width: width * 0.3,
                                      decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 30, right: 15),
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          controller: experienceController,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please enter some text';
                                            }

                                            return null;
                                          },
                                          onChanged: (value) {
                                            setState(() {
                                              experience = value;
                                            });
                                          },
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                          decoration: InputDecoration(
                                            focusedBorder:
                                                const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.amber),
                                            ),
                                            enabledBorder:
                                                const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.amber),
                                            ),
                                            labelText: 'year',
                                            labelStyle: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),

                                            // Here is key idea
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: width * 0.4,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Date of Birth',
                                      style: TextStyle(
                                          color: Colormanager.textcolors,
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
                                        //     dateController.text = selectdate;
                                        //   });
                                        // }, onChanged: (value) {
                                        //   setState(() {
                                        //     birthdate = value;
                                        //   });
                                        // },
                                        //     currentTime: DateTime.now(),
                                        //     locale: LocaleType.en);
                                      },
                                      child: Container(
                                        height: height * 0.05,
                                        width: width * 0.3,
                                        decoration: BoxDecoration(
                                          color: Colors.amber,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Center(
                                            child: Text(
                                          "select date",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        // Container(
                        //   height: height * 0.08,
                        //   width: width * 0.8,
                        //   child: Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         Text(
                        //           "Address",
                        //           style: TextStyle(
                        //               fontSize: width * 0.035,
                        //               color: Colors.white,
                        //               fontWeight: FontWeight.bold),
                        //         ),
                        //         Container(
                        //           height: height * 0.05,
                        //           child: TextFormField(
                        //             controller: address,
                        //             validator: (value) {
                        //               if (value!.isEmpty) {
                        //                 return 'Please enter address';
                        //               }
                        //               return null;
                        //             },
                        //             keyboardType: TextInputType.text,
                        //             style: const TextStyle(color: Colors.white),
                        //             decoration: const InputDecoration(
                        //               focusedBorder: UnderlineInputBorder(
                        //                 borderSide:
                        //                     BorderSide(color: Colors.white),
                        //               ),
                        //               enabledBorder: UnderlineInputBorder(
                        //                 borderSide:
                        //                     BorderSide(color: Colors.white),
                        //               ),
                        //               prefixIconColor: Colors.white,
                        //               prefixIcon: Icon(
                        //                 Icons.home,
                        //                 color: Colors.white,
                        //               ),
                        //               labelText: 'Address',
                        //               labelStyle: TextStyle(
                        //                 color: Colors.white,
                        //                 fontSize: 13,
                        //               ),
                        //             ),
                        //             onChanged: (value) {
                        //               setState(() {
                        //                 adress = value;
                        //               });
                        //             },
                        //           ),
                        //         ),
                        //       ]),
                        // ),
                        InkWell(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              updateusername1();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('updated')),
                              );
                            }
                          },
                          child: Container(
                            height: height * 0.055,
                            width: width * 0.5,
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: Text(
                                "Update",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  updateusername1() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    await firebaseFirestore
        .collection("workerUser")
        .doc(workerStaticData.uid)
        .update({
      "uname": fullname,
      "phoneNO": phoneno,
      "job": jobtitle,
      "gender": gender,
      "experience": experience,
      "dateofbirth": birthdate,

      // "adress": adress,
    });
  }
}
