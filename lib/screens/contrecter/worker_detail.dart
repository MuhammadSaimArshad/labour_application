// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:labour_application/utiles/model/worker_usermodel.dart';

class Worker_detail extends StatefulWidget {
  Workerusermodel model;
  Worker_detail({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<Worker_detail> createState() => _Worker_detailState();
}

class _Worker_detailState extends State<Worker_detail> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
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
              top: 20,
              left: 20,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: height * 0.05,
                  width: width * 0.14,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10)),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: height * 0.85,
                width: width * 0.95,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(children: [
                  Container(
                    height: height * 0.3,
                    width: width * 0.9,

                    // color: Colors.amber,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: height * 0.15,
                            width: width * 0.4,
                            child:
                                Image(image: AssetImage("images/person.png")),
                          ),
                          Text(
                            widget.model.uname.toString(),
                            // snapshot.data!['uname'],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.045,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.model.email.toString(),
                            // snapshot.data!['email'],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: width * 0.04,
                            ),
                          ),
                          Text(
                            widget.model.phoneNO.toString(),
                            // snapshot.data!['phoneNO'],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.03,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                size: width * 0.05,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                size: width * 0.05,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                size: width * 0.05,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                size: width * 0.05,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                size: width * 0.05,
                                color: Colors.amber,
                              ),
                            ],
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    height: height * 0.12,
                    width: width * 0.95,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: height * 0.12,
                          width: width * 0.25,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.model.experience.toString(),
                                // snapshot.data!['experience'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: width * 0.03,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Experience",
                                style: TextStyle(
                                    fontSize: width * 0.03,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: height * 0.12,
                          width: width * 0.35,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(30)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.model.job.toString(),
                                // snapshot.data!['job'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: width * 0.03,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Job Title",
                                style: TextStyle(
                                    fontSize: width * 0.03,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: height * 0.12,
                          width: width * 0.25,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomLeft: Radius.circular(30)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.model.dateofbirth.toString(),
                                // snapshot.data!['dateofbirth'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: width * 0.03,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Date of Birth",
                                style: TextStyle(
                                    fontSize: width * 0.03,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    "About Us",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.045,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                      height: height * 0.15,
                      width: width * 0.8,
                      // color: Colors.amber,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: height * 0.03,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Hello This is ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * 0.035),
                                ),
                                Text(
                                  widget.model.uname.toString(),
                                  // snapshot.data!['uname'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * 0.035),
                                ),
                                Text(
                                  " And I am a ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * 0.035),
                                ),
                                Text(
                                  widget.model.job.toString(),
                                  // snapshot.data!['job'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * 0.035),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: height * 0.03,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "My contact number is ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * 0.035),
                                ),
                                Text(
                                  widget.model.phoneNO.toString(),
                                  // snapshot.data!['phoneNO'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * 0.035),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: height * 0.03,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  " I have been working as a ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * 0.035),
                                ),
                                Text(
                                  widget.model.job.toString(),
                                  // snapshot.data!['job'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * 0.035),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: height * 0.03,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "for more than  ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * 0.035),
                                ),
                                Text(
                                  widget.model.experience.toString(),
                                  // snapshot.data!['experience'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * 0.035),
                                ),
                                Text(
                                  " year ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * 0.035),
                                ),
                                //Text(snapshot.data!['company']),
                              ],
                            ),
                          ),
                          Container(
                            height: height * 0.03,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "You contact me anytime for your projects ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * 0.03),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
