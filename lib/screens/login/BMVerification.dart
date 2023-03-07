// ignore_for_file: file_names, use_key_in_widget_constructors, sort_child_properties_last
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:bm_mobile/settings/AppConstant.dart';
import 'package:bm_mobile/settings/AppWidget.dart';
import 'package:bm_mobile/screens/login/BMSetPassword.dart';
import 'package:bm_mobile/utils/BMColors.dart';
import 'package:bm_mobile/utils/BMImages.dart';
import 'package:bm_mobile/utils/BMStrings.dart';
import 'package:bm_mobile/utils/BMWidget.dart';
import '../../../../main.dart';

class BMVerification extends StatefulWidget {
  static String tag = '/BMVerification';

  @override
  BMVerificationState createState() => BMVerificationState();
}

class BMVerificationState extends State<BMVerification> {
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
                  CachedNetworkImage(
                      placeholder: placeholderWidgetFn() as Widget Function(
                          BuildContext, String)?,
                      imageUrl: t5_verification,
                      width: width / 2.5,
                      height: width / 2.5),
                  const SizedBox(height: 30),
                  text(bm_lbl_verification,
                      textColor: appStore.textPrimaryColor,
                      fontFamily: fontBold,
                      fontSize: 22.0),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 10, bottom: 16),
                    child: text(bm_note_verification,
                        textColor: t5TextColorSecondary,
                        fontFamily: fontMedium,
                        fontSize: textSizeMedium,
                        maxLine: 2,
                        isCentered: true),
                  ),
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
                        const PinEntryTextField(fields: 4, fontSize: textSizeNormal),
                        const SizedBox(height: 24),
                        GestureDetector(
                          onTap: () {
                            BMSetPassword().launch(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: width / 8,
                            child: text(bm_skip,
                                textColor: t5White, isCentered: true),
                            decoration: boxDecoration(
                                bgColor: t5ColorPrimary, radius: 8),
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      toasty(context, bm_resend);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
                      child: text(bm_resend,
                          textColor: t5ColorPrimary,
                          fontSize: textSizeLargeMedium,
                          fontFamily: fontSemibold),
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
