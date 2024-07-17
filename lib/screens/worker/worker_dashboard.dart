import 'package:flutter/material.dart';

import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:labour_application/screens/worker/worker_applyjobs.dart';
import 'package:labour_application/screens/worker/worker_homepage.dart';
import 'package:labour_application/screens/worker/worker_profile.dart';
import 'package:labour_application/screens/worker/worker_setting.dart';

class Worker_dashboard extends StatefulWidget {
  const Worker_dashboard({super.key});

  @override
  State<Worker_dashboard> createState() => _Worker_dashboardState();
}

class _Worker_dashboardState extends State<Worker_dashboard> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _screens = [
    Workerhomepage(),
    JobsPageScreen(),
    Worker_setting(),
    Worker_profile(),
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
            rippleColor: Colors.black, // tab button ripple color when pressed
            hoverColor: Colors.amber, // tab button hover color
            haptic: true, // haptic feedback
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
                icon: Icons.badge,
                text: 'My Jobs',
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
