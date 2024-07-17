import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:labour_application/custom_clippers/Clipper1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:labour_application/screens/contrecter/contractor_login.dart';

import 'package:labour_application/utiles/colors.dart';
import 'package:labour_application/utiles/model/contractor_usermodel.dart';

class contracter_information extends StatefulWidget {
  String username;
  String email;
  String password;
  String confirmpwd;
  contracter_information(
      {super.key,
      required this.username,
      required this.email,
      required this.password,
      required this.confirmpwd});

  @override
  State<contracter_information> createState() => _contracter_informationState();
}

class _contracter_informationState extends State<contracter_information> {
  TextEditingController companyController = TextEditingController();
  TextEditingController adressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;
  String? errorMessage;
  void signUp() async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: widget.email, password: widget.password);
      if (credential.user != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Contractor_login(),
            ));
        postdatatoFirebase();
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
          errorMessage = "Invalid Email!";
          break;
        case "wrong-password":
          errorMessage = "Wrong Password";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      Fluttertoast.showToast(
        msg: 'Successfully signup',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  void postdatatoFirebase() async {
    User user = auth.currentUser!;
    String id = user.uid;
    // DateTime now = new DateTime.now();
    final now = new DateTime.now();
    String formatter = DateFormat('yMd').format(now);
    Contractorusermodel model = Contractorusermodel(
        uname: widget.username,
        email: widget.email,
        password: widget.password,
        cnfpassword: widget.confirmpwd,
        phoneNO: phoneController.text,
        adress: adressController.text,
        company: companyController.text,
        uid: id,
        time: formatter
        // DateFormat.jm().format(DateTime.now()),
        );
    await FirebaseFirestore.instance
        .collection('contracterUser')
        .doc(id)
        .set(model.toMap());
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(children: [
            Container(
              height: height,
              width: width,
              child: Image(
                image: AssetImage("images/background.jpeg"),
                fit: BoxFit.fill,
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
                    color: Colormanager.headingcolor.withOpacity(0.7),
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colormanager.textcolors,
                    size: width * 0.05,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipPath(
                clipper: clipper1(),
                child: Container(
                  height: height * 0.3,
                  width: width,
                  color: Colormanager.textcolors,
                  child: Image(
                    image: AssetImage("images/build.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: height * 0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: height * 0.12,
                      child: Image(
                        image: AssetImage("images/kjob.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Container(
                        height: height * 0.5,
                        width: width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colormanager.headingcolor.withOpacity(0.7),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Basic Information',
                              style: TextStyle(color: Colormanager.textcolors),
                            ),
                            Container(
                              height: height * 0.08,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: IntlPhoneField(
                                  style: const TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                    labelText: 'Phone Number',
                                    labelStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  ),
                                  controller: phoneController,
                                  keyboardType: TextInputType.number,
                                  onChanged: (phone) {
                                    print(phone.completeNumber);
                                  },
                                ),
                              ),
                            ),
                            Container(
                              height: height * 0.08,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: TextFormField(
                                  controller: companyController,
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
                                    labelText: 'Company',
                                    labelStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text ';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            Container(
                              height: height * 0.08,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: TextFormField(
                                    keyboardType: TextInputType.streetAddress,
                                    controller: adressController,
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
                                        hintText: "Enter your Address",
                                        hintStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                        labelText: 'Address',
                                        labelStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                        suffixIcon: Icon(
                                          Icons.add_comment,
                                          color: Colors.orange,
                                        )),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text ';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  signUp();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('sign up sucessfully')),
                                  );
                                }
                              },
                              child: Container(
                                height: height * 0.055,
                                width: width * 0.5,
                                decoration: BoxDecoration(
                                    color: Colormanager.ambercolor,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Center(
                                  child: Text(
                                    "SignUp",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ])),
    );
  }
}
