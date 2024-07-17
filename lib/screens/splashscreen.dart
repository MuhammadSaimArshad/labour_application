import 'dart:async';

import 'package:flutter/material.dart';

import 'package:labour_application/screens/pageview.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => page_view())));
    // Timer(
    //     Duration(seconds: 3),
    //     () => Navigator.of(context).pushReplacement(
    //         MaterialPageRoute(builder: (BuildContext context) => page_view())));
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
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
          alignment: Alignment.center,
          child: Container(
            height: height * 0.2,
            child: Image(
              image: AssetImage("images/kjob.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ]

              // child: Column(
              //   children: [
              //
              //   ],
              // ),
              )),
    );
  }
}
