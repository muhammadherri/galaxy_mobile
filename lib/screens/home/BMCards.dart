// ignore_for_file: file_names, unnecessary_import, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:bm_mobile/settings/AppWidget.dart';
import 'package:bm_mobile/model/BMModels.dart';
import 'package:bm_mobile/utils/BMColors.dart';
import 'package:bm_mobile/utils/BMConstant.dart';
import 'package:bm_mobile/utils/BMDataGenerator.dart';
import 'package:bm_mobile/utils/BMStrings.dart';
import 'package:bm_mobile/utils/BMWidget.dart';

import '../../../../main.dart';

class BMCards extends StatefulWidget {
  static var tag = "/BMCards";

  @override
  BMCardsState createState() => BMCardsState();
}

class BMCardsState extends State<BMCards> {
  int selectedPos = 1;
  late List<BMBill> mCards;

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
    mCards = getListData();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    changeStatusColor(appStore.appBarColor!);
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: Container(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TopBar(),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20),
              child: text(bm_judul,
                  textColor: appStore.textPrimaryColor,
                  fontFamily: fontBold,
                  fontSize: textSizeXLarge),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const ScrollPhysics(),
                    itemCount: mCards.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        decoration: boxDecoration(
                            radius: 16,
                            showShadow: true,
                            bgColor: context.scaffoldBackgroundColor),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SvgPicture.asset(mCards[index].icon,
                                width: width / 13, height: width / 13),
                            const SizedBox(height: 10),
                            text(mCards[index].name,
                                textColor: appStore.textPrimaryColor,
                                fontSize: textSizeLargeMedium,
                                fontFamily: fontSemibold),
                            text(mCards[index].date, fontSize: textSizeMedium),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              decoration: mCards[index].isPaid
                                  ? boxDecoration(
                                      bgColor: t5DarkRed, radius: 16)
                                  : boxDecoration(
                                      bgColor: t5SkyBlue, radius: 16),
                              child: text(
                                  mCards[index].isPaid ? "Paid" : "Unpaid",
                                  fontSize: textSizeMedium,
                                  textColor: t5White),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
