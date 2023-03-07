// ignore_for_file: file_names, use_key_in_widget_constructors, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:bm_mobile/settings/AppConstant.dart';
import 'package:bm_mobile/settings/AppWidget.dart';
import 'package:bm_mobile/utils/BMColors.dart';
import 'package:bm_mobile/utils/BMImages.dart';
import 'package:bm_mobile/utils/BMStrings.dart';
import 'package:bm_mobile/utils/BMWidget.dart';

import '../../../main.dart';

class BMSetFingerPrint extends StatefulWidget {
  static String tag = '/BMSetFingerPrint';

  @override
  BMSetFingerPrintState createState() => BMSetFingerPrintState();
}

class BMSetFingerPrintState extends State<BMSetFingerPrint> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              height: height,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(t5_login,
                      width: width / 2.5, height: width / 2.5),
                  text(bm_lbl_fingerprint,
                      textColor: appStore.textPrimaryColor,
                      fontFamily: fontBold,
                      fontSize: 22.0),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 16),
                    child: text(bm_note_finger_set,
                        textColor: t5TextColorSecondary,
                        fontFamily: fontMedium,
                        fontSize: textSizeMedium,
                        maxLine: 2,
                        isCentered: true),
                  ),
                  const SizedBox(height: 50),
                  GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(bm_img_fingerprint,
                          width: width / 3.5, color: t5ColorPrimary)),
                  const SizedBox(height: 50),
                  GestureDetector(
                    onTap: () {
                      finish(context);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(24),
                      alignment: Alignment.center,
                      height: width / 8,
                      child:
                          text(bm_skip, textColor: t5White, isCentered: true),
                      decoration:
                          boxDecoration(bgColor: t5ColorPrimary, radius: 24),
                    ),
                  ),
                ],
              ),
            ),
          ),
          TopBar()
        ],
      ),
    );
  }
}
