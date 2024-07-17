import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:labour_application/custom_clippers/Clipper1.dart';
import 'package:labour_application/screens/worker/worker_information.dart';
import 'package:labour_application/utiles/colors.dart';

class Worker_signup extends StatefulWidget {
  const Worker_signup({super.key});

  @override
  State<Worker_signup> createState() => _Worker_signupState();
}

class _Worker_signupState extends State<Worker_signup> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController confirmpwdController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
                              'Worker Signup',
                              style: TextStyle(color: Colormanager.textcolors),
                            ),
                            Container(
                              height: height * 0.08,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: TextFormField(
                                  controller: usernameController,
                                  keyboardType: TextInputType.name,
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
                                    labelText: 'User Name',
                                    labelStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter username ';
                                    }
                                    return null;
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
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
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
                                    labelText: 'E-mail',
                                    labelStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                  autofillHints: [AutofillHints.email],
                                  onEditingComplete: () =>
                                      TextInput.finishAutofillContext(),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  onChanged: (value) {},
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter email ';
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
                                    keyboardType: TextInputType.number,
                                    controller: passwordController,
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
                                      labelText: 'Password',
                                      labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                      ),
                                    ),
                                    autofillHints: [AutofillHints.password],
                                    onEditingComplete: () =>
                                        TextInput.finishAutofillContext(),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    onChanged: (value) {},
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter password';
                                      } else {
                                        if (value.length < 5) {
                                          return ("Password must be more than 5 characters");
                                        } else {
                                          return null;
                                        }
                                      }
                                      // return null;
                                    },
                                  ),
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
                                    keyboardType: TextInputType.number,
                                    controller: confirmpwdController,
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
                                      labelText: 'Confirm Password',
                                      labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                      ),
                                    ),
                                    autofillHints: [AutofillHints.password],
                                    onEditingComplete: () =>
                                        TextInput.finishAutofillContext(),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    onChanged: (value) {},
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter confirm password';
                                      } else {
                                        if (value.length < 5) {
                                          return ("Password must be more than 5 characters");
                                        } else {
                                          return null;
                                        }
                                      }
                                      // return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Worker_information(
                                          confirmpwd: confirmpwdController.text,
                                          email: emailController.text,
                                          password: passwordController.text,
                                          username: usernameController.text),
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                height: height * 0.055,
                                width: width * 0.5,
                                decoration: BoxDecoration(
                                    color: Colormanager.ambercolor,
                                    borderRadius: BorderRadius.circular(30)),
                                child: const Center(
                                  child: Text(
                                    "Next",
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
