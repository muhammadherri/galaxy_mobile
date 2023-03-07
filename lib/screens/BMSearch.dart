// ignore_for_file: file_names, use_key_in_widget_constructors, sort_child_properties_last
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:bm_mobile/settings/AppWidget.dart';
import 'package:bm_mobile/model/BMModels.dart';
import 'package:bm_mobile/utils/BMColors.dart';
import 'package:bm_mobile/utils/BMConstant.dart';
import 'package:bm_mobile/utils/BMDataGenerator.dart';
import 'package:bm_mobile/utils/BMStrings.dart';
import 'package:bm_mobile/utils/BMWidget.dart';

import '../../../main.dart';

class BMSearch extends StatefulWidget {
  static String tag = '/BMSearch';

  @override
  BMSearchState createState() => BMSearchState();
}

class BMSearchState extends State<BMSearch> {
  List<BMContact> mRecentContact = [];
  List<BMContact> mOtherContact = [];

  @override
  void initState() {
    super.initState();
    mRecentContact = getRecents();
    mOtherContact = getPending();
  }

  Widget contactList(List<BMContact> mContactList) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: mContactList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 12, bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage:
                          CachedNetworkImageProvider(mContactList[index].img),
                      radius: 28,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          text(mContactList[index].name,
                              textColor: appStore.textPrimaryColor,
                              fontSize: textSizeMedium,
                              fontFamily: fontMedium),
                          text(mContactList[index].contactno,
                              fontSize: textSizeMedium)
                        ],
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                    )
                  ],
                ),
              ),
              const Divider(height: 0.5, color: t5ViewColor)
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);

    return Scaffold(
      body: Container(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TopBar(titleName: bm_contact_list),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                style: const TextStyle(
                    fontSize: textSizeLargeMedium, fontFamily: fontRegular),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: appStore.iconColor),
                  contentPadding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                  hintText: bm_hint_search,
                  hintStyle: TextStyle(color: appStore.textPrimaryColor),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: t5ViewColor, width: 0.7),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: t5ViewColor, width: 0.7),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  margin: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      text(bm_recently_contact,
                          textColor: appStore.textPrimaryColor,
                          fontSize: textSizeNormal,
                          fontFamily: fontBold),
                      Container(child: contactList(mRecentContact)),
                      const SizedBox(height: 26),
                      text(bm_other_contact,
                          textColor: appStore.textPrimaryColor,
                          fontSize: textSizeNormal,
                          fontFamily: fontBold),
                      Container(child: contactList(mOtherContact)),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
