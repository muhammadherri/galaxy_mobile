// ignore_for_file: unused_field, file_names, use_key_in_widget_constructors
import 'package:bm_mobile/screens/home/menu/dashboard.dart';
import 'package:bm_mobile/screens/home/menu/jobs/jobs.dart';
import 'package:bm_mobile/screens/home/menu/profile/profile.dart';
import 'package:bm_mobile/screens/home/menu/recent/recent.dart';
import 'package:flutter/material.dart';

import '../../../../main.dart';
import '../BMBubbleBotoomBar.dart';
import '../BMColors.dart';
import '../BMImages.dart';
import '../BMStrings.dart';

class BMBottomBar extends StatefulWidget {
  static String tag = '/BMBottomBar';

  @override
  BMBottomBarState createState() => BMBottomBarState();
}

class BMBottomBarState extends State<BMBottomBar> {
  var currentIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    RecentClass(),
    JobsClass(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return BubbleBottomBar(
      opacity: .2,
      currentIndex: currentIndex,
      elevation: 8,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      backgroundColor: appStore.appBarColor,
      hasNotch: false,
      hasInk: true,
      inkColor: t5ColorPrimaryLight,
      items: <BubbleBottomBarItem>[
        tab(bm_img_home, bm_home),
        tab(bm_list_check, bm_listing),
        tab(bm_jobs, bm_notification),
        tab(bm_user, bm_lbl_profile),
      ],
    );
  }
}
