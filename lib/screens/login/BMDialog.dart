// ignore_for_file: file_names, unnecessary_import, use_key_in_widget_constructors, unused_local_variable
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:bm_mobile/settings/AppWidget.dart';
import 'package:bm_mobile/screens/login/BMSignIn.dart';
import 'package:bm_mobile/utils/BMColors.dart';
import 'package:bm_mobile/utils/BMConstant.dart';
import 'package:bm_mobile/utils/BMImages.dart';
import 'package:bm_mobile/utils/BMStrings.dart';

import '../../../../main.dart';

class BMDialog extends StatefulWidget {
  static var tag = "/BMDialog";

  @override
  BMDialogState createState() => BMDialogState();
}

class BMDialogState extends State<BMDialog> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1000), () {
      showDialog(
        context: context,
        builder: (BuildContext context) => CustomDialog(),
      );
    });
    return BMSignIn();
  }
}

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}

dialogContent(BuildContext context) {
  var width = MediaQuery.of(context).size.width;

  return Container(
    decoration: BoxDecoration(
      color: context.scaffoldBackgroundColor,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(16),
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10.0,
          offset: Offset(0.0, 10.0),
        ),
      ],
    ),
    width: MediaQuery.of(context).size.width,
    child: Column(
      mainAxisSize: MainAxisSize.min, // To make the card compact
      children: <Widget>[
        GestureDetector(
          onTap: () {
            finish(context);
          },
          child: Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.centerRight,
              child: Icon(Icons.close, color: appStore.iconColor)),
        ),
        Container(
          width: 45,
          height: 45,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Color(0xff40963b)),
          child: const Icon(Icons.done, color: t5White),
        ),
        const SizedBox(height: 24),
        text(bm_fingerprint_authentication,
            textColor: appStore.textPrimaryColor,
            fontFamily: 'bold',
            fontSize: textSizeNormal),
        Padding(
          padding:
              const EdgeInsets.only(left: 30, right: 30, bottom: 16, top: 10),
          child: text(bm_fingerprint_authentication,
              textColor: t5TextColorSecondary,
              fontFamily: 'tahoma',
              fontSize: textSizeMedium,
              maxLine: 2,
              isCentered: true),
        ),
        const SizedBox(height: 30),
        GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(bm_img_fingerprint,
                width: width / 4, color: Colors.grey)),
        const SizedBox(height: 50),
      ],
    ),
  );
}

class SyncDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: syncContent(context),
    );
  }
}

syncContent(BuildContext context) {
  double turns = 1.0;

  var width = MediaQuery.of(context).size.width;

  return Container(
    decoration: BoxDecoration(
      color: context.scaffoldBackgroundColor,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(16),
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10.0,
          offset: Offset(0.0, 10.0),
        ),
      ],
    ),
    width: MediaQuery.of(context).size.width,
    child: Column(
      mainAxisSize: MainAxisSize.min, // To make the card compact
      children: <Widget>[
        const SizedBox(
          height: 30,
        ),
        const SizedBox(
            width: 45,
            height: 45,
            // decoration: const BoxDecoration(
            //     shape: BoxShape.circle, color: Color(0xff40963b)),
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              color: Color(0xff40963b),
              strokeWidth: 8,
            )),
        const SizedBox(height: 24),
        Text(
          'Please Wait ...',
          style: TextStyle(
              fontFamily: 'bold',
              fontSize: textSizeNormal,
              color: appStore.textPrimaryColor),
        ),

        const Padding(
          padding: EdgeInsets.only(left: 30, right: 30, bottom: 16, top: 10),
          child: Text(
            'Syncronize is Processing',
            style: TextStyle(
                fontFamily: 'tahoma',
                fontSize: textSizeMedium,
                color: t5TextColorSecondary),
          ),
        ),
        const SizedBox(height: 30),
        // GestureDetector(
        //     onTap: () {},
        //     child: SvgPicture.asset(bm_img_fingerprint,
        //         width: width / 4, color: Colors.grey)),
        // const SizedBox(height: 50),
      ],
    ),
  );
}

class LoginDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: loginContent(context),
    );
  }
}

loginContent(BuildContext context) {
  double turns = 1.0;

  var width = MediaQuery.of(context).size.width;

  return Container(
    decoration: BoxDecoration(
      color: context.scaffoldBackgroundColor,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(16),
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10.0,
          offset: Offset(0.0, 10.0),
        ),
      ],
    ),
    width: MediaQuery.of(context).size.width,
    child: Column(
      mainAxisSize: MainAxisSize.min, // To make the card compact
      children: <Widget>[
        const SizedBox(
          height: 30,
        ),
        // Image.asset(loading, width: width / 1.5, height: width / 1.5),

        const SizedBox(
            width: 45,
            height: 45,
            // decoration: const BoxDecoration(
            //     shape: BoxShape.circle, color: Color(0xff40963b)),
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              color: Color(0xff40963b),
              strokeWidth: 8,
            )),
        const SizedBox(height: 24),
        Text(
          'Loading',
          style: TextStyle(
              fontFamily: 'bold',
              fontSize: textSizeNormal,
              color: appStore.textPrimaryColor),
        ),
        const SizedBox(height: 30),
      ],
    ),
  );
}
