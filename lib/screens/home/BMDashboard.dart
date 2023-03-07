// ignore_for_file: unnecessary_new, unused_local_variable, prefer_interpolation_to_compose_strings, file_names, use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:bm_mobile/settings/AppWidget.dart';
import 'package:bm_mobile/model/BMModels.dart';
import 'package:bm_mobile/utils/BMColors.dart';
import 'package:bm_mobile/utils/BMConstant.dart';
import 'package:bm_mobile/utils/BMDataGenerator.dart';
import 'package:bm_mobile/utils/BMImages.dart';
import 'package:bm_mobile/utils/widgets/BMBottomBar.dart';
import 'package:bm_mobile/utils/widgets/BMGridListing.dart';
import 'package:bm_mobile/utils/widgets/BMSlider.dart';

class BMDashboard extends StatefulWidget {
  static var tag = "/BMDashboard";

  @override
  BMDashboardState createState() => BMDashboardState();
}

class BMDashboardState extends State<BMDashboard> {
  bool passwordVisible = false;
  bool isRemember = false;
  var currentIndexPage = 0;
  List<BMCategory>? mFavouriteList;
  List<BMSlider>? mSliderList;

  @override
  void initState() {
    super.initState();
    passwordVisible = false;
    mFavouriteList = getCategoryItems();
    mSliderList = getSliders();
  }

  void changeSldier(int index) {
    setState(() {
      currentIndexPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    String nama = getStringAsync("personal_names");
    String department = getStringAsync("personal_department");
    String mails = getStringAsync("personal_mails");
    String pic = getStringAsync("profil_pic");
    String detail = department + " - " + mails;

    changeStatusColor(appColorPrimary);
    var width = MediaQuery.of(context).size.width;
    width = width - 50;
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return Scaffold(
      backgroundColor: appColorPrimary,
      key: _scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: 70,
              margin: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: appColorPrimaryDarkLight,
                            ),
                            borderRadius: BorderRadius.circular(30)),
                        child: CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(pic),
                          radius: 25,
                        ),
                      ),
                      const SizedBox(width: 16),
                      text(nama,
                          textColor: t5White,
                          fontSize: textSizeNormal,
                          fontFamily: fontMedium)
                    ],
                  ),
                  SvgPicture.asset(t5_options,
                      width: 25, height: 25, color: t5White)
                ],
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.only(top: 100),
              child: Container(
                padding: const EdgeInsets.only(top: 28),
                alignment: Alignment.topLeft,
                height: MediaQuery.of(context).size.height - 100,
                decoration: BoxDecoration(
                    color: context.scaffoldBackgroundColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24))),
                child: Column(
                  children: <Widget>[
                    BMSliderWidget(mSliderList),
                    const SizedBox(height: 20),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: BMGridListing(mFavouriteList, false),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BMBottomBar(),
    );
  }
}
