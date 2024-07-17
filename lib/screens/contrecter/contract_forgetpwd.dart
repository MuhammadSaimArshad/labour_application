import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:labour_application/custom_clippers/Clipper1.dart';
import 'package:labour_application/screens/contrecter/contractor_login.dart';
import 'package:labour_application/utiles/colors.dart';

class Contracterforgetpwd extends StatefulWidget {
  const Contracterforgetpwd({super.key});

  @override
  State<Contracterforgetpwd> createState() => _ContracterforgetpwdState();
}

class _ContracterforgetpwdState extends State<Contracterforgetpwd> {
  TextEditingController emailController = TextEditingController();

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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: height * 0.08,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: TextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              labelText: 'E-mail',
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      InkWell(
                        onTap: () {
                          var forgotemail = emailController.text.trim();

                          try {
                            FirebaseAuth.instance
                                .sendPasswordResetEmail(email: forgotemail)
                                .then((value) => {
                                      print("Email Sent"),
                                      ((Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Contractor_login(),
                                          ))))
                                    });
                          } on FirebaseAuthException catch (e) {
                            print("Error $e");
                          }
                        },
                        child: Container(
                          height: height * 0.055,
                          width: width * 0.7,
                          decoration: BoxDecoration(
                              color: Colormanager.ambercolor,
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: Text(
                              "Verify",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: height * 0.2,
                    child: Image(
                      image: AssetImage("images/kjob.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ])),
    );
  }
}
