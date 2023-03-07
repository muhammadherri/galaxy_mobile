// ignore_for_file: prefer_const_constructors, unnecessary_const, prefer_final_fields, unused_field, prefer_typing_uninitialized_variables, non_constant_identifier_names
import 'package:bm_mobile/screens/home/menu/dashboard.dart';
import 'package:bm_mobile/screens/home/menu/jobs/jobs.dart';
import 'package:bm_mobile/screens/home/menu/profile/profile.dart';
import 'package:bm_mobile/screens/home/menu/recent/recent.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nb_utils/nb_utils.dart';

class Bottomnavbar extends StatefulWidget {
  final Request;
  const Bottomnavbar({super.key, this.Request});
  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    const Dashboard(),
    const RecentClass(),
    const JobsClass(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 238, 238, 238),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 20,
                    offset: const Offset(0, 3))
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.grey[100]!,
                gap: 8,
                activeColor: Colors.black,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: Color(0XFF40963B),
                color: Colors.grey,
                // ignore: prefer_const_literals_to_create_immutables
                tabs: [
                  GButton(
                    // imageData:ImageIcon(AssetImage("assetName")),
                    icon: Icons.home,
                    text: 'Home',
                    iconActiveColor: Colors.white,
                    textColor: Colors.white,
                  ),
                  GButton(
                    icon: LineIcons.receipt,
                    text: 'Recent',
                    iconActiveColor: Colors.white,
                    textColor: Colors.white,
                  ),
                  GButton(
                    icon: LineIcons.file,
                    text: 'Jobs',
                    iconActiveColor: Colors.white,
                    textColor: Colors.white,
                  ),
                  GButton(
                    icon: LineIcons.user,
                    text: 'Profile',
                    iconActiveColor: Colors.white,
                    textColor: Colors.white,
                  ),
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
        ),
      ),
    );
  }
}
