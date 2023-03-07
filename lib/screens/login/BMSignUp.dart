// ignore_for_file: file_names, use_key_in_widget_constructors, sort_child_properties_last
import 'package:bm_mobile/settings/codePicker/country_code_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:bm_mobile/settings/AppWidget.dart';
import 'package:bm_mobile/screens/login/BMVerification.dart';
import 'package:bm_mobile/utils/BMColors.dart';
import 'package:bm_mobile/utils/BMConstant.dart';
import 'package:bm_mobile/utils/BMImages.dart';
import 'package:bm_mobile/utils/BMStrings.dart';
import '../../../main.dart';

class BMSignUp extends StatefulWidget {
  static String tag = '/BMSignUp';

  @override
  BMSignUpState createState() => BMSignUpState();
}

class BMSignUpState extends State<BMSignUp> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          alignment: Alignment.center,
          color: context.scaffoldBackgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CachedNetworkImage(
                  placeholder: placeholderWidgetFn() as Widget Function(
                      BuildContext, String)?,
                  imageUrl: t5_ragistration,
                  width: width / 2.5,
                  height: width / 2.5),
              text(bm_judul,
                  textColor: appStore.textPrimaryColor,
                  fontFamily: fontBold,
                  fontSize: 22.0),
              Padding(
                padding:
                    const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 16),
                child: text(bm_username,
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
                    radius: 4.0),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.only(left: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: t5ViewColor, width: 0.5)),
                      child: Row(
                        children: <Widget>[
                          const CountryCodePicker(onChanged: print, showFlag: true),
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              maxLength: 10,
                              style: const TextStyle(
                                  fontSize: textSizeLargeMedium,
                                  fontFamily: fontRegular),
                              decoration: const InputDecoration(
                                counterText: "",
                                contentPadding:
                                    EdgeInsets.fromLTRB(16, 10, 16, 10),
                                hintText: bm_password,
                                hintStyle: TextStyle(color: t5TextColorThird),
                                border: InputBorder.none,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    GestureDetector(
                      onTap: () {
                        BMVerification().launch(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: width / 8,
                        child: text(bm_sign_in,
                            textColor: t5White, isCentered: true),
                        decoration:
                            boxDecoration(bgColor: t5ColorPrimary, radius: 8.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
