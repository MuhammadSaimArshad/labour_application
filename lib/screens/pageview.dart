import 'package:flutter/material.dart';

import 'package:labour_application/screens/contrecter/contract_work.dart';
import 'package:labour_application/utiles/colors.dart';

class page_view extends StatefulWidget {
  const page_view({super.key});

  @override
  State<page_view> createState() => _page_viewState();
}

class _page_viewState extends State<page_view> {
  PageController controller = PageController();
  void movetonext() {
    controller.animateToPage(index,
        duration: Duration(microseconds: 1000), curve: Curves.easeInSine);
  }

  int index = 0;
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
        PageView(
          controller: controller,
          children: <Widget>[
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: height * 0.27,
                    child: Image(
                      image: AssetImage(
                        "images/screen1.png",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.08,
                  ),
                  Container(
                    height: height * 0.25,
                    width: width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colormanager.headingcolor.withOpacity(0.7),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: height * 0.06,
                          width: width * 0.8,
                          decoration: BoxDecoration(
                            color: Colormanager.ambercolor,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20)),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Hiring Aplicants',
                            style: TextStyle(
                                fontSize: width * 0.07,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          height: height * 0.18,
                          width: width * 0.65,
                          child: Center(
                            child: Text(
                              // 'Contracter can post their jobs and hire \n capable aplicants. After completion of \n their jobs contracter can share their \n review on worker profile.',
                              'Contracter can post their jobs and hire capable aplicants. After completion of their jobs contracter can share their review on worker profile.',
                              style: TextStyle(
                                  color: Colormanager.textcolors,
                                  fontWeight: FontWeight.bold,
                                  fontSize: width * 0.04),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: height * 0.27,
                    child: Image(
                      image: AssetImage(
                        "images/screen2.png",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.08,
                  ),
                  Container(
                    height: height * 0.25,
                    width: width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // color: Colormanager.headingcolor
                      color: Colormanager.headingcolor.withOpacity(0.7),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: height * 0.06,
                          width: width * 0.8,
                          decoration: BoxDecoration(
                            color: Colormanager.ambercolor,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20)),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Track Location',
                            style: TextStyle(
                                fontSize: width * 0.07,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          height: height * 0.18,
                          width: width * 0.65,
                          child: Center(
                            child: Text(
                              'Workers can easily find their jobs location.Current location is tracked for both companies and workers so that they can now how far they are from each other.',
                              style: TextStyle(
                                  color: Colormanager.textcolors,
                                  fontWeight: FontWeight.bold,
                                  fontSize: width * 0.04),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: index == 0
              ? Container(
                  height: height * 0.08,
                  color: Colors.transparent,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                index = 0;
                              });
                              movetonext();
                            },
                            child: Icon(
                              Icons.arrow_back,
                              size: width * 0.08,
                              color: Colormanager.textcolors,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                index = 1;
                              });
                              movetonext();
                            },
                            child: Icon(
                              Icons.arrow_forward,
                              size: width * 0.08,
                              color: Colormanager.textcolors,
                            ),
                          )
                        ],
                      )))
              : InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Contract_work(),
                      ),
                    );
                  },
                  child: Container(
                    width: width,
                    height: height * 0.08,
                    decoration: BoxDecoration(
                      color: Colormanager.ambercolor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25)),
                    ),
                    child: Center(
                      child: Text(
                        "GET STARTED NOW",
                        style: TextStyle(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
        ),
        Container(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, right: 20),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Contract_work(),
                  ),
                );
              },
              child: Text(
                'Skip',
                style: TextStyle(
                    color: Colormanager.headingcolor,
                    fontSize: width * 0.06,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ]),
    ));
  }
}
