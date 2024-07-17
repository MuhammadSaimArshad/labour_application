import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:labour_application/screens/contrecter/contracter_home.dart';
import 'package:labour_application/screens/contrecter/contracter_joblist.dart';
import 'package:labour_application/screens/contrecter/contracter_profile.dart';
import 'package:labour_application/screens/contrecter/contracter_setting.dart';
import 'package:labour_application/screens/contrecter/post_job.dart';

class Contracter_dashboard extends StatefulWidget {
  const Contracter_dashboard({super.key});

  @override
  State<Contracter_dashboard> createState() => _Contracter_dashboardState();
}

class _Contracter_dashboardState extends State<Contracter_dashboard> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _screens = [
    Contracterhome(),
    Postjob(),
    Contracter_joblist(),
    Contracter_setting(),
    Contracter_profile(),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: _screens[_selectedIndex],
        bottomNavigationBar: Container(
          height: height * 0.07,
          width: width,
          child: GNav(
            rippleColor: Colors.black,
            hoverColor: Colors.amber,
            haptic: true,
            tabBorderRadius: 10,
            // tabActiveBorder:
            //     Border.all(color: Colors.black, width: 1),
            // tabBorder:
            //     Border.all(color: Colors.grey, width: 1),
            // tabShadow: [
            //   BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)
            // ], // tab button shadow
            curve: Curves.easeOutExpo, // tab animation curves
            duration: Duration(milliseconds: 900), // tab animation duration
            gap: 5, // the tab button gap between icon and text
            color: Colors.black, // unselected icon color
            activeColor: Colors.black, // selected icon and text color
            iconSize: 20, // tab button icon size
            tabBackgroundColor: Colors.amber, // selected tab background color
            padding: EdgeInsets.symmetric(
                horizontal: 15, vertical: 5), // navigation bar padding
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.post_add,
                text: 'Post',
              ),
              GButton(
                icon: Icons.badge,
                text: 'Jobs',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Setting',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              )
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
