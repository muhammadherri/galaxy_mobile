// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:bm_mobile/main.dart';
import 'package:bm_mobile/settings/AppWidget.dart';
import 'package:bm_mobile/utils/BMBubbleBotoomBar.dart';
import 'package:bm_mobile/utils/BMColors.dart';
import 'package:bm_mobile/utils/BMImages.dart';
import 'package:bm_mobile/utils/BMStrings.dart';
import 'package:bm_mobile/utils/BMWidget.dart';

class BMBottomNavigation extends StatefulWidget {
  static var tag = "/BMBottomNavigation";

  @override
  BMBottomNavigationState createState() => BMBottomNavigationState();
}

class BMBottomNavigationState extends State<BMBottomNavigation> {
  var currentIndex = 0;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);

    return Scaffold(
      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        currentIndex: currentIndex,
        backgroundColor: appStore.appBarColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        onTap: changePage,
        hasNotch: false,
        hasInk: true,
        inkColor: appColorSecondory,
        items: <BubbleBottomBarItem>[
          tab(bm_img_home, bm_home),
          tab(bm_list_check, bm_listing),
          tab(bm_jobs, bm_notification),
          tab(bm_user, bm_lbl_profile),
        ],
      ),
      body: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: ring(bm_judul),
          ),
          TopBar()
        ],
      ),
    );
  }
}
