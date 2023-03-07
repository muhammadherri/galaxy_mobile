// ignore_for_file: file_names, use_key_in_widget_constructors
import 'package:bm_mobile/settings/AppWidget.dart';
import 'package:bm_mobile/utils/BMColors.dart';
import 'package:bm_mobile/utils/BMImages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:bm_mobile/model/AppModel.dart';
import '../../main.dart';

class ProKitScreenListing extends StatefulWidget {
  static String tag = "/ProKitScreenListing";
  final ProTheme? proTheme;

  const ProKitScreenListing(this.proTheme);

  @override
  ProKitScreenListingState createState() => ProKitScreenListingState();
}

class ProKitScreenListingState extends State<ProKitScreenListing> {
  var selectedTab = 0;
  List<ProTheme> list = [];

  @override
  void initState() {
    super.initState();
    if (widget.proTheme!.sub_kits != null) {
      list.addAll(widget.proTheme!.sub_kits!);
    }

    afterBuildCreated(() {
      changeStatusColor(appStore.scaffoldBackground!);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        appBar: appBar(
          context,
          widget.proTheme!.name ?? widget.proTheme!.name!,
          iconColor: Theme.of(context).iconTheme.color,
          actions: [
            Tooltip(
              message: 'Dark Mode',
              child: Switch(
                value: appStore.isDarkModeOn,
                activeColor: appColorPrimary,
                onChanged: (s) {
                  appStore.toggleDarkMode(value: s);
                  setState(() {});
                },
              ),
            ),
          ],
        ),
        body: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 80),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(16),
                    child: widget.proTheme!.show_cover!
                        ? Image.asset(app_bg_cover_image,
                            height: context.height() / 4)
                        : null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
