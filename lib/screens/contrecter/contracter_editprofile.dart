import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:labour_application/utiles/model/static_data.dart';

class Contracter_editprofile extends StatefulWidget {
  const Contracter_editprofile({super.key});

  @override
  State<Contracter_editprofile> createState() => _Contracter_editprofileState();
}

class _Contracter_editprofileState extends State<Contracter_editprofile> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController companyname = TextEditingController();
  TextEditingController address = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var username;
  var phone;
  var company;
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
            Positioned(
              top: 30,
              left: 30,
              child: InkWell(
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
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: height * 0.3,
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: height * 0.15,
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
                    height: height * 0.6,
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
                                        username = value;
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
                                        phone = value;
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
                                  "Company Name",
                                  style: TextStyle(
                                      fontSize: width * 0.035,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  height: height * 0.05,
                                  child: TextFormField(
                                    controller: companyname,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter company name';
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
                                        Icons.home_work_rounded,
                                        color: Colors.white,
                                      ),
                                      labelText: 'Company Name',
                                      labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        company = value;
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
                                  "Address",
                                  style: TextStyle(
                                      fontSize: width * 0.035,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  height: height * 0.05,
                                  child: TextFormField(
                                    controller: address,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter address';
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
                                        Icons.home,
                                        color: Colors.white,
                                      ),
                                      labelText: 'Address',
                                      labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        adress = value;
                                      });
                                    },
                                  ),
                                ),
                              ]),
                        ),
                        InkWell(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              updateusername();
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

  updateusername() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    await firebaseFirestore
        .collection("contracterUser")
        .doc(StaticData.uid)
        .update({
      "uname": username,
      "phoneNO": phone,
      "company": company,
      "adress": adress,
    });
  }
}
