// ignore_for_file: file_names, unnecessary_import, use_key_in_widget_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:bm_mobile/settings/AppWidget.dart';
import 'package:bm_mobile/model/BMModels.dart';
import 'package:bm_mobile/utils/BMColors.dart';
import 'package:bm_mobile/utils/BMDataGenerator.dart';
import 'package:bm_mobile/utils/BMStrings.dart';
import 'package:bm_mobile/utils/BMWidget.dart';
import 'package:bm_mobile/utils/widgets/BMGridListing.dart';

import '../../../main.dart';

class BMBottomSheet extends StatefulWidget {
  static var tag = "/BMBottomSheet";

  @override
  BMBottomSheetState createState() => BMBottomSheetState();
}

class BMBottomSheetState extends State<BMBottomSheet> {
  GlobalKey<ScaffoldState>? scaffoldKey = GlobalKey();
  List<BMCategory>? mFavouriteList;

  @override
  void initState() {
    super.initState();
    mFavouriteList = getBottomSheetItems();
  }

  showSheet(BuildContext aContext) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: aContext,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
              initialChildSize: 0.65,
              maxChildSize: 1,
              minChildSize: 0.5,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  padding: const EdgeInsets.only(top: 24),
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                      color: context.scaffoldBackgroundColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24))),
                  child: Column(
                    children: <Widget>[
                      Container(color: t5ViewColor, width: 50, height: 3),
                      const SizedBox(height: 20),
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 20, right: 20, top: 16),
                          child: BMGridListing(mFavouriteList, true),
                        ),
                      )
                    ],
                  ),
                );
              });
        });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);
    scaffoldKey = new GlobalKey<ScaffoldState>();
    Future.delayed(const Duration(milliseconds: 1000), () {
      showSheet(context);
    });
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          TopBar(),
          Container(
              alignment: Alignment.center,
              child: GestureDetector(
                  onTap: () {
                    showSheet(context);
                  },
                  child: ring(bm_judul)))
        ],
      ),
    );
  }
}
