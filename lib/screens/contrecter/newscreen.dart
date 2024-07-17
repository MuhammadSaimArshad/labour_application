import 'package:flutter/material.dart';
import 'package:labour_application/screens/contrecter/contracter_application.dart';
import 'package:labour_application/screens/contrecter/jobapplicaationclass.dart';

class Newscreen extends StatefulWidget {
  const Newscreen({super.key});

  @override
  State<Newscreen> createState() => _NewscreenState();
}

class _NewscreenState extends State<Newscreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("images/background.jpeg")),
            ),
          ),
          InkWell(
            child: Container(
              height: height * 0.6,
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.056,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Applicationlist(
                            catagory: 'Plumber',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: height * 0.06,
                      width: width * 0.6,
                      color: Colors.amber,
                      child: Center(
                        child: Text(
                          "Plumber",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: width * 0.05),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.056,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Applicationlist(
                            catagory: 'Wooder',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: height * 0.06,
                      width: width * 0.6,
                      color: Colors.amber,
                      child: Center(
                        child: Text(
                          "Wooder",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: width * 0.05),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.056,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Applicationlist(
                            catagory: 'Fixer',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: height * 0.06,
                      width: width * 0.6,
                      color: Colors.amber,
                      child: Center(
                        child: Text(
                          "Fixer",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: width * 0.05),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.056,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Applicationlist(
                            catagory: 'Technision',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: height * 0.06,
                      width: width * 0.6,
                      color: Colors.amber,
                      child: Center(
                        child: Text(
                          "Technision",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: width * 0.05),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
