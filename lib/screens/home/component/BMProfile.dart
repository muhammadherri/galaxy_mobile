// ignore_for_file: file_names, unnecessary_import, use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:bm_mobile/settings/AppWidget.dart';
import 'package:bm_mobile/utils/BMBubbleBotoomBar.dart';
import 'package:bm_mobile/utils/BMColors.dart';
import 'package:bm_mobile/utils/BMConstant.dart';
import 'package:bm_mobile/utils/BMImages.dart';
import 'package:bm_mobile/utils/BMStrings.dart';

class BMProfile extends StatefulWidget {
  static var tag = "/BMProfile";

  @override
  BMProfileState createState() => BMProfileState();
}

class BMProfileState extends State<BMProfile> {
  double? width;

  @override
  void initState() {
    super.initState();
  }

  var currentIndex = 0;
  var iconList = <String>[
    t5_analysis,
    t5_wallet_2,
    t5_customer_service,
    t5_img_settings
  ];
  var nameList = <String>[
    bm_statistics,
    bm_manage_wallet,
    bm_support,
    bm_settings
  ];

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget gridItem(int pos) {
    return Container(
        width: (width! - (16 * 3)) / 2,
        height: (width! - (16 * 3)) / 2,
        decoration:
            boxDecoration(radius: 24, showShadow: true, bgColor: t5White),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              iconList[pos],
              width: width! / 7,
              height: width! / 7,
              color: black,
            ),
            text(nameList[pos],
                fontSize: textSizeNormal,
                textColor: t5TextColorPrimary,
                fontFamily: fontSemibold)
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(t5DarkNavy);
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: t5LayoutBackgroundWhite,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              height: width,
              color: t5DarkNavy,
              child: Container(
                alignment: Alignment.center,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.keyboard_arrow_left,
                          size: 40, color: t5White),
                      onPressed: () {
                        finish(context);
                      },
                    ),
                    text("Account",
                        textColor: t5White,
                        fontSize: textSizeNormal,
                        fontFamily: fontMedium),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: SvgPicture.asset(t5_options,
                          width: 25, height: 25, color: t5White),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.only(top: 80),
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    padding: const EdgeInsets.only(top: 60),
                    alignment: Alignment.topCenter,
                    decoration: const BoxDecoration(
                        color: t5LayoutBackgroundWhite,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24))),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        text("Emily Jonas",
                            textColor: t5TextColorPrimary,
                            fontFamily: fontMedium,
                            fontSize: textSizeNormal),
                        text(bm_phone_number, fontSize: textSizeLargeMedium),
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  height: 8,
                                  child: const LinearProgressIndicator(
                                    value: 0.5, // percent filled
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        t5SkyBlue),
                                    backgroundColor: Color(0XFFD7DCE0),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  text("Wallet Security",
                                      fontSize: textSizeMedium,
                                      fontFamily: fontSemibold),
                                  text("50%",
                                      textColor: t5SkyBlue,
                                      fontFamily: fontBold,
                                      fontSize: textSizeNormal)
                                ],
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[gridItem(0), gridItem(1)],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[gridItem(2), gridItem(3)],
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                  const CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(t5_profile_8),
                      radius: 50)
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        currentIndex: currentIndex,
        elevation: 8,
        onTap: changePage,
        //new
        hasNotch: false,
        //new
        hasInk: true,
        //new, gives a cute ink effect
        inkColor: t5ColorPrimaryLight,
        //optional, uses theme color if not specified
        items: <BubbleBottomBarItem>[
          tab(bm_img_home, bm_home),
          tab(bm_list_check, bm_listing),
          tab(bm_jobs, bm_notification),
          tab(bm_user, bm_lbl_profile),
        ],
      ),
    );
  }
}
