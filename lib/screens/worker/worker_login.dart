import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:labour_application/screens/worker/worker_dashboard.dart';
import 'package:labour_application/utiles/model/worker_usermodel.dart';
import 'package:labour_application/utiles/model/workerstatic_data.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:labour_application/custom_clippers/Clipper1.dart';
import 'package:labour_application/screens/worker/worker_forgotpwd.dart';
import 'package:labour_application/screens/worker/worker_signup.dart';
import 'package:labour_application/utiles/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Worker_login extends StatefulWidget {
  const Worker_login({super.key});

  @override
  State<Worker_login> createState() => _Worker_loginState();
}

class _Worker_loginState extends State<Worker_login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = true;

  void initState() {
    _passwordVisible = false;
  }

  bool? _success;
  String? _userEmail;
  void _signInWithEmailAndPassword() async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    User user = (await _auth.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    ))
        .user!;

    if (user != null) {
      setState(() {
        workerStaticData.uid = user.uid;
        getworkermodel(user.uid);
        print('uiddd ${workerStaticData.loggedInUser}');
        _success = true;
        _userEmail = user.email!;
        print('email $_userEmail');
      });
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Worker_dashboard(),
          ));

      Fluttertoast.showToast(
          msg: 'Succesfully login',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      postDataToSP();
    } else {
      setState(
        () {
          _success = false;
        },
      );
    }
  }

  void getworkermodel(String id) async {
    await FirebaseFirestore.instance
        .collection('workerUser')
        .doc(id)
        .get()
        .then((value) {
      setState(() {
        workerStaticData.loggedInUser = Workerusermodel.fromMap(value.data()!);
      });
    });
  }

  postDataToSP() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('uid', workerStaticData.uid);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
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
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipPath(
                clipper: clipper1(),
                child: Container(
                  height: height * 0.3,
                  width: width,
                  color: Colormanager.textcolors,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                              fontSize: width * 0.03,
                              fontWeight: FontWeight.w500),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Worker_signup(),
                              ),
                            );
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                      ]),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                // color: Colors.amber,
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
                              'Worker Login',
                              style: TextStyle(color: Colormanager.textcolors),
                            ),
                            Container(
                              height: height * 0.08,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: TextFormField(
                                  controller: emailController,
                                  keyboardType: TextInputType.text,
                                  style: const TextStyle(color: Colors.white),
                                  autofillHints: [AutofillHints.email],
                                  onEditingComplete: () =>
                                      TextInput.finishAutofillContext(),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  onChanged: (value) {},
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter Email ';
                                    }
                                    return null;
                                  },
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
                                ),
                              ),
                            ),
                            Container(
                              height: height * 0.08,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                // child: TextFormField(
                                //   controller: passwordController,
                                //   decoration: const InputDecoration(
                                //     suffixIcon: Icon(
                                //       Icons.remove_red_eye,
                                //       color: Colors.grey,
                                //     ),
                                //     labelText: 'Password',
                                //     labelStyle: TextStyle(
                                //       color: Colors.white,
                                //       fontSize: 17,
                                //     ),
                                //   ),
                                // ),

                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: passwordController,
                                    obscureText:
                                        !_passwordVisible, //This will obscure text dynamically
                                    style: const TextStyle(color: Colors.white),
                                    autofillHints: [AutofillHints.password],
                                    onEditingComplete: () =>
                                        TextInput.finishAutofillContext(),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    onChanged: (value) {},
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter  password';
                                      } else {
                                        if (value.length < 5) {
                                          return ("Password must be more than 5 characters");
                                        } else {
                                          return null;
                                        }
                                      }
                                      // return null;
                                    },
                                    decoration: InputDecoration(
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      labelText: 'Password',
                                      labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                      ),

                                      // Here is key idea
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          // Based on passwordVisible state choose the icon
                                          _passwordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Theme.of(context)
                                              .primaryColorLight,
                                        ),
                                        onPressed: () {
                                          // Update the state i.e. toogle the state of passwordVisible variable
                                          setState(() {
                                            _passwordVisible =
                                                !_passwordVisible;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Workerforgotpwd(),
                                  ),
                                );
                              },
                              child: Text(
                                "Fogot Password?",
                                style: TextStyle(
                                    color: Colormanager.textcolors,
                                    fontSize: width * 0.035),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  _signInWithEmailAndPassword();
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
                                    "Login",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //   crossAxisAlignment: CrossAxisAlignment.center,
                            //   children: [
                            //     Container(
                            //       height: height * 0.003,
                            //       width: width * 0.25,
                            //       color: Colormanager.textcolors,
                            //     ),
                            //     Container(
                            //       height: height * 0.06,
                            //       width: width * 0.1,
                            //       decoration: BoxDecoration(
                            //           color: Colormanager.textcolors,
                            //           shape: BoxShape.circle),
                            //       child: Center(
                            //         child: Text(
                            //           "OR",
                            //           style: TextStyle(
                            //               fontSize: width * 0.035,
                            //               fontWeight: FontWeight.bold),
                            //         ),
                            //       ),
                            //     ),
                            //     Container(
                            //       height: height * 0.003,
                            //       width: width * 0.25,
                            //       color: Colormanager.textcolors,
                            //     ),
                            //   ],
                            // ),
                            // Container(
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       Container(
                            //         height: height * 0.06,
                            //         width: width * 0.1,
                            //         decoration: BoxDecoration(
                            //             color: Colors.blue[900],
                            //             shape: BoxShape.circle),
                            //         child: Center(
                            //           child: Icon(
                            //             Icons.facebook_sharp,
                            //             color: Colormanager.textcolors,
                            //           ),
                            //         ),
                            //       ),
                            //       SizedBox(
                            //         width: width * 0.06,
                            //       ),
                            //       Container(
                            //         height: height * 0.06,
                            //         width: width * 0.1,
                            //         decoration: BoxDecoration(
                            //             color: Colors.red,
                            //             shape: BoxShape.circle),
                            //         child: Center(
                            //           child: Text(
                            //             "G",
                            //             style: TextStyle(
                            //                 fontSize: width * 0.06,
                            //                 color: Colormanager.textcolors,
                            //                 fontWeight: FontWeight.bold),
                            //           ),
                            //         ),
                            //       ),
                            //       SizedBox(
                            //         width: width * 0.06,
                            //       ),
                            //       Container(
                            //         height: height * 0.06,
                            //         width: width * 0.1,
                            //         decoration: BoxDecoration(
                            //             color: Colormanager.headingcolor,
                            //             shape: BoxShape.circle),
                            //         child: Center(
                            //           child: Icon(
                            //             Icons.apple,
                            //             color: Colormanager.textcolors,
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
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
