// ignore_for_file: use_key_in_widget_constructors, file_names
import 'package:bm_mobile/model/AppModel.dart';
import 'package:bm_mobile/screens/login/BMSignIn.dart';
import 'package:bm_mobile/settings/AppDataProvider.dart';
import 'package:bm_mobile/settings/common.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:bm_mobile/settings/AppWidget.dart';
import 'package:bm_mobile/utils/BMColors.dart';
import 'package:bm_mobile/utils/BMStrings.dart';
import '../../../../main.dart';

class BMWalkThrough extends StatefulWidget {
  static var tag = "/BMWalkThrough";

  @override
  BMWalkThroughState createState() => BMWalkThroughState();
}

class BMWalkThroughState extends State<BMWalkThrough> {
  PageController controller = PageController();

  List<WalkThroughData> list = mlWalkThroughDataList();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    changeStatusColor(appColorPrimary);
  }

  @override
  void dispose() {
    super.dispose();
    changeStatusColor(appStore.isDarkModeOn ? scaffoldDarkColor : white);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColorPrimary,
      body: Stack(
        children: [
          PageView(
            controller: controller,
            children: list.map(
              (e) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: boxDecorationWithRoundedCorners(
                        boxShape: BoxShape.circle,
                        // ignore: prefer_const_constructors
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          // ignore: prefer_const_literals_to_create_immutables
                          colors: [
                            const Color.fromARGB(255, 64, 150, 59),
                            const Color.fromARGB(255, 10, 67, 7),
                          ],
                        ),
                      ),
                      height: 270,
                      width: 230,
                      child: commonCachedNetworkImage(e.imagePath.validate(),
                          fit: BoxFit.contain),
                    ),
                    48.height,
                    Text(e.title.validate(),
                        style: boldTextStyle(size: 28, color: whiteColor)),
                    16.height,
                    Text(
                      e.subtitle.validate(),
                      style: secondaryTextStyle(size: 20, color: whiteColor),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ).paddingAll(16.0);
              },
            ).toList(),
          ),
          Positioned(
            bottom: 30,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DotIndicator(pageController: controller, pages: list),
                AppButton(
                  onTap: () {
                    return BMSignIn().launch(context);
                  },
                  color: white,
                  child: Text(bm_skip,
                      style: boldTextStyle(color: appColorPrimary)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
