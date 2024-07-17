import 'package:flutter/material.dart';

import 'package:labour_application/screens/contrecter/contractor_login.dart';
import 'package:labour_application/screens/worker/worker_login.dart';

class Contract_work extends StatefulWidget {
  const Contract_work({super.key});

  @override
  State<Contract_work> createState() => _Contract_workState();
}

class _Contract_workState extends State<Contract_work> {
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
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Contractor_login(),
                    ),
                  );
                },
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: height * 0.25,
                        child: Image(
                          image: AssetImage("images/contract.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Worker_login(),
                            ),
                          );
                        },
                        child: Container(
                          height: height * 0.25,
                          child: Image(
                            image: AssetImage("images/work.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ])),
    );
  }
}
