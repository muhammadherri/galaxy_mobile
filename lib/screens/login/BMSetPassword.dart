// ignore_for_file: file_names, use_key_in_widget_constructors, sort_child_properties_last
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:bm_mobile/settings/AppConstant.dart';
import 'package:bm_mobile/settings/AppWidget.dart';
import 'package:bm_mobile/screens/login/BMSetFingerPrint.dart';
import 'package:bm_mobile/utils/BMColors.dart';
import 'package:bm_mobile/utils/BMImages.dart';
import 'package:bm_mobile/utils/BMStrings.dart';
import 'package:bm_mobile/utils/BMWidget.dart';
import '../../../main.dart';

class BMSetPassword extends StatefulWidget {
  static String tag = '/BMSetPassword';

  @override
  BMSetPasswordState createState() => BMSetPasswordState();
}

class BMSetPasswordState extends State<BMSetPassword> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    changeStatusColor(appStore.appBarColor!);

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
                  CachedNetworkImage(
                      placeholder: placeholderWidgetFn() as Widget Function(
                          BuildContext, String)?,
                      imageUrl: t5_ragistration,
                      width: width / 2.5,
                      height: width / 2.5),
                  const SizedBox(height: 30),
                  text(bm_password,
                      textColor: appStore.textPrimaryColor,
                      fontFamily: fontBold,
                      fontSize: 22.0),
                  const SizedBox(height: 30),
                  Container(
                    margin: const EdgeInsets.all(24),
                    decoration: boxDecoration(
                        bgColor: context.scaffoldBackgroundColor,
                        showShadow: true,
                        radius: 4),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        const SizedBox(height: 10),
                        EditText(hint: bm_hint_password, isSecure: true),
                        const SizedBox(height: 16),
                        EditText(hint: bm_hint_password, isSecure: true),
                        const SizedBox(height: 24),
                        GestureDetector(
                          onTap: () {
                            BMSetFingerPrint().launch(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: width / 8,
                            child: text(bm_skip,
                                textColor: t5White, isCentered: true),
                            decoration: boxDecoration(
                                bgColor: t5ColorPrimary, radius: 24),
                          ),
                        )
                      ],
                    ),
                  )
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
