// ignore_for_file: file_names, use_key_in_widget_constructors, unnecessary_new, prefer_final_fields, avoid_unnecessary_containers, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:bm_mobile/settings/AppWidget.dart';
import 'package:bm_mobile/utils/BMColors.dart';
import 'package:bm_mobile/utils/BMConstant.dart';
import 'package:bm_mobile/utils/BMImages.dart';
import 'package:bm_mobile/utils/BMStrings.dart';
import 'package:bm_mobile/utils/BMWidget.dart';
import 'package:bm_mobile/utils/widgets/BMExpandable.dart';

import '../../../main.dart';

class BMSettings extends StatefulWidget {
  static var tag = "/BMSettings";

  @override
  BMSettingsState createState() => BMSettingsState();
}

class BMSettingsState extends State<BMSettings> {
  int selectedPos = 1;
  bool notification = false;
  bool discounts = false;
  bool gift = false;
  bool fastPayment = false;
  ExpandableController _controller = new ExpandableController();
  String? _selectedLocation = 'English';

  late double width;

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
  }

  Widget settingItem(String name, {String icon = "", var pad = 16.0}) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(pad),
        child: Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 18),
              width: width / 7.5,
              height: width / 7.5,
              padding: EdgeInsets.all(width / 30),
              decoration: icon.isNotEmpty
                  ? boxDecoration(
                      radius: 4,
                      bgColor: context.scaffoldBackgroundColor,
                      showShadow: true)
                  : null,
              child: icon.isNotEmpty ? SvgPicture.asset(icon) : const SizedBox(),
            ),
            text(name,
                textColor: appStore.textPrimaryColor,
                fontFamily: fontMedium,
                fontSize: textSizeLargeMedium)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
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
              padding: const EdgeInsets.only(left: 20.0, top: 10),
              child: text(bm_settings,
                  textColor: appStore.textPrimaryColor,
                  fontFamily: fontBold,
                  fontSize: textSizeXLarge),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 24),
                      BMExpandablePanel(
                        // ignore: deprecated_member_use_from_same_package
                        hasIcon: false,
                        header: Row(
                          children: <Widget>[
                            settingItem(bm_notification,
                                icon: t5_img_notification),
                            Switch(
                              value: notification,
                              onChanged: (value) {
                                setState(() {
                                  notification = value;
                                  _controller.expanded = notification;
                                  print(notification);
                                });
                              },
                              activeTrackColor: t5ColorPrimary,
                              activeColor: t5White,
                            )
                          ],
                        ),
                        controller: _controller,
                        expanded: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                settingItem(bm_history, pad: 10.0),
                                Switch(
                                  value: discounts,
                                  onChanged: (value) {
                                    setState(() {
                                      discounts = value;
                                    });
                                  },
                                  activeTrackColor: t5ColorPrimary,
                                  activeColor: t5White,
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                settingItem(bm_history, pad: 10.0),
                                Switch(
                                  value: gift,
                                  onChanged: (value) {
                                    setState(() {
                                      gift = value;
                                    });
                                  },
                                  activeTrackColor: t5ColorPrimary,
                                  activeColor: t5White,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      divider(),
                      Row(
                        children: <Widget>[
                          settingItem(bm_history, icon: t5_payments),
                          Switch(
                            value: fastPayment,
                            onChanged: (value) {
                              setState(() {
                                fastPayment = value;
                              });
                            },
                            activeTrackColor: t5ColorPrimary,
                            activeColor: t5White,
                          )
                        ],
                      ),
                      divider(),
                      Row(
                        children: <Widget>[
                          settingItem(bm_history, icon: t5_img_fingerprint_2),
                          IconButton(
                            icon: const Icon(
                              Icons.keyboard_arrow_right,
                              color: t5TextColorSecondary,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      divider(),
                      Row(
                        children: <Widget>[
                          settingItem(bm_history, icon: t5_translate),
                          CustomTheme(
                            child: DropdownButton<String>(
                              icon: const Icon(Icons.keyboard_arrow_right,
                                  color: t5TextColorSecondary),
                              underline: const SizedBox(),
                              value: _selectedLocation,
                              items: <String>['English', 'French', 'German']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: text(value,
                                      fontSize: textSizeLargeMedium,
                                      textColor: appStore.textPrimaryColor),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedLocation = newValue;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 16)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
