// ignore_for_file: use_build_context_synchronously, file_names, use_key_in_widget_constructors, library_private_types_in_public_api, annotate_overrides, no_leading_underscores_for_local_identifiers, unused_import
import 'dart:async';
import 'package:bm_mobile/helper/database_helper.dart';
import 'package:bm_mobile/screens/home/menu/bottom.dart';
import 'package:bm_mobile/screens/login/BMSignIn.dart';
import 'package:bm_mobile/screens/login/BMWalkthrough.dart';
import 'package:bm_mobile/utils/BMColors.dart';
import 'package:bm_mobile/utils/BMImages.dart';
import 'package:flutter/material.dart';
import 'package:bm_mobile/main.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sqflite/sqflite.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? scaleController;
  Animation<double>? scaleAnimation;
  String tiktoken = '';
  String firstapp = '';

  bool _a = false;
  bool _c = false;
  bool _d = false;
  bool _e = false;
  bool secondAnim = false;

  Color boxColor = Colors.transparent;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    Timer(const Duration(milliseconds: 600), () {
      setState(() {
        boxColor = context.iconColor;
        _a = true;
      });
    });
    Timer(const Duration(milliseconds: 1500), () {
      setState(() {
        boxColor = context.scaffoldBackgroundColor;
        _c = true;
      });
    });
    Timer(const Duration(milliseconds: 1700), () {
      setState(() {
        _e = true;
      });
    });
    Timer(const Duration(milliseconds: 3200), () {
      secondAnim = true;

      scaleController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1000),
      )..forward();
      scaleAnimation =
          Tween<double>(begin: 0.0, end: 12).animate(scaleController!);

      setState(() {
        boxColor = context.scaffoldBackgroundColor;
        _d = true;
      });
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // final trxphinv = await db.rawQuery("SELECT * FROM users");
    setState(() {
      tiktoken = (prefs.getString('token') ?? '');
      firstapp = (prefs.getString('app') ?? '');
    });
    // if (trxphinv == []) {
    //   print('kosong');
    // } else {
    //   print('adadong');
    // }
    if (tiktoken == '') {
      Timer(const Duration(milliseconds: 4200), () {
        secondAnim = true;
        setState(() {});
        BMWalkThrough().launch(context, isNewTask: true);
      });
    } else {
      Timer(const Duration(milliseconds: 4200), () {
        secondAnim = true;
        setState(() {});
        const Bottomnavbar().launch(context, isNewTask: true);
      });
    }
    if (firstapp == '1') {
      Timer(const Duration(milliseconds: 4200), () {
        secondAnim = true;
        setState(() {});
        const Bottomnavbar().launch(context, isNewTask: true);
      });
    } else {
      Timer(const Duration(milliseconds: 4200), () {
        secondAnim = true;
        setState(() {});
        BMWalkThrough().launch(context, isNewTask: true);
      });
    }
  }

  @override
  void dispose() {
    scaleController!.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    double _h = MediaQuery.of(context).size.height;
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: Center(
        child: Column(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: _d ? 900 : 2500),
              curve: _d ? Curves.fastLinearToSlowEaseIn : Curves.elasticOut,
              height: _d
                  ? 0
                  : _a
                      ? _h / 2.5
                      : 20,
              width: 20,
            ),
            AnimatedContainer(
              duration: Duration(seconds: _c ? 1 : 0),
              curve: Curves.fastLinearToSlowEaseIn,
              height: _d
                  ? _h
                  : _c
                      ? 130
                      : 20,
              width: _d
                  ? _w
                  : _c
                      ? 130
                      : 20,
              decoration: BoxDecoration(
                  color: const Color(0xff40963b),
                  //shape: _c? BoxShape.rectangle : BoxShape.circle,
                  borderRadius: _d
                      ? const BorderRadius.only()
                      : BorderRadius.circular(100)),
              child: secondAnim
                  ? Center(
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: appStore.isDarkModeOn
                                ? appSplashFirstColor
                                : appSplashSecondaryColor,
                            shape: BoxShape.circle),
                        child: AnimatedBuilder(
                          animation: scaleAnimation!,
                          builder: (c, child) => Transform.scale(
                            scale: scaleAnimation!.value,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: appStore.isDarkModeOn
                                    ? appSplashFirstColor
                                    : appSplashSecondaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: _e
                          ? Image.asset(app_ic_logo,
                              height: 130, width: 130, fit: BoxFit.cover)
                          : const SizedBox(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
