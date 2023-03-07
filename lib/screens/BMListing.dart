// ignore_for_file: file_names, use_key_in_widget_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:bm_mobile/settings/AppWidget.dart';
import 'package:bm_mobile/model/BMModels.dart';
import 'package:bm_mobile/utils/BMColors.dart';
import 'package:bm_mobile/utils/BMConstant.dart';
import 'package:bm_mobile/utils/BMDataGenerator.dart';
import 'package:bm_mobile/utils/BMStrings.dart';
import 'package:bm_mobile/utils/BMWidget.dart';

import '../../../main.dart';

class BMListing extends StatefulWidget {
  static var tag = "/BMListing";

  @override
  BMListingState createState() => BMListingState();
}

class BMListingState extends State<BMListing> {
  int selectedPos = 1;
  late List<BMBill> mListings;

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
    mListings = getListData();
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
              child: text(bm_history,
                  textColor: appStore.textPrimaryColor,
                  fontFamily: fontBold,
                  fontSize: textSizeXLarge),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: mListings.length,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(top: 18, bottom: 18),
                            child: Row(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    text("Oct", fontSize: textSizeSMedium),
                                    text(mListings[index].day,
                                        fontSize: textSizeLargeMedium,
                                        textColor: appStore.textSecondaryColor),
                                  ],
                                ),
                                Container(
                                  decoration: boxDecoration(
                                      radius: 8, showShadow: true),
                                  margin: const EdgeInsets.only(left: 16, right: 16),
                                  width: width / 7.2,
                                  height: width / 7.2,
                                  child:
                                      SvgPicture.asset(mListings[index].icon),
                                  padding: EdgeInsets.all(width / 30),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          text(mListings[index].name,
                                              textColor:
                                                  appStore.textPrimaryColor,
                                              fontSize: textSizeMedium,
                                              fontFamily: fontSemibold),
                                          text(mListings[index].amount,
                                              textColor:
                                                  appStore.textSecondaryColor,
                                              fontSize: textSizeMedium,
                                              fontFamily: fontSemibold)
                                        ],
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                      ),
                                      text("Mastercard",
                                          fontSize: textSizeMedium)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Divider(height: 0.5, color: t5ViewColor)
                        ],
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
