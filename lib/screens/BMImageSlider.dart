// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:bm_mobile/settings/AppWidget.dart';
import 'package:bm_mobile/model/BMModels.dart';
import 'package:bm_mobile/utils/BMDataGenerator.dart';
import 'package:bm_mobile/utils/BMStrings.dart';
import 'package:bm_mobile/utils/BMWidget.dart';
import 'package:bm_mobile/utils/widgets/BMSlider.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';

class BMImageSlider extends StatefulWidget {
  static var tag = "/BMImageSlider";

  @override
  BMImageSliderState createState() => BMImageSliderState();
}

class BMImageSliderState extends State<BMImageSlider> {
  int selectedPos = 1;
  List<BMSlider>? mSliderList;

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
    mSliderList = getSliders();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(
      appStore.appBarColor!,
    );

    return Scaffold(
      body: Container(
        alignment: Alignment.topLeft,
        color: context.scaffoldBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TopBar(),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20, bottom: 30),
              child: text(bm_slide_one,
                  textColor: appStore.textPrimaryColor,
                  fontFamily: 'bold',
                  fontSize: 12),
            ),
            BMSliderWidget(mSliderList),
          ],
        ),
      ),
    );
  }
}
