// ignore_for_file: file_names, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:bm_mobile/settings/AppWidget.dart';
import 'package:bm_mobile/model/BMModels.dart';

import '../../../../main.dart';
import '../BMColors.dart';
import '../BMConstant.dart';

// ignore: must_be_immutable
class BMGridListing extends StatelessWidget {
  List<BMCategory>? mFavouriteList;
  var isScrollable = false;

  BMGridListing(this.mFavouriteList, this.isScrollable);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return GridView.builder(
        scrollDirection: Axis.vertical,
        physics:
            isScrollable ? const ScrollPhysics() : const NeverScrollableScrollPhysics(),
        itemCount: mFavouriteList!.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 16, mainAxisSpacing: 16),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              decoration: boxDecoration(
                  radius: 10,
                  showShadow: true,
                  bgColor: context.scaffoldBackgroundColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: width / 7.5,
                    width: width / 7.5,
                    margin: const EdgeInsets.only(bottom: 4, top: 8),
                    padding: EdgeInsets.all(width / 30),
                    decoration: boxDecoration(
                        bgColor: mFavouriteList![index].color, radius: 10),
                    child: SvgPicture.asset(
                      mFavouriteList![index].icon,
                      color: t5White,
                    ),
                  ),
                  text(mFavouriteList![index].name,
                      textColor: appStore.textSecondaryColor,
                      fontSize: textSizeMedium)
                ],
              ),
            ),
          );
        });
  }
}
