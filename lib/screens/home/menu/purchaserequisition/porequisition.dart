// ignore_for_file: unnecessary_new, prefer_const_constructors, empty_statements, unnecessary_string_interpolations, unused_import, depend_on_referenced_packages

import 'dart:convert';
import 'package:bm_mobile/screens/home/menu/more.dart';
import 'package:bm_mobile/screens/home/menu/purchaserequisition/poreqList.dart';
import 'package:bm_mobile/screens/login/BMSignIn.dart';
import 'package:bm_mobile/services/api_service.dart';
import 'package:bm_mobile/settings/AppConstant.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay_pro/animations/bouncing_line.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;

class PurchaseOrderRequisitionClass extends StatefulWidget {
  const PurchaseOrderRequisitionClass({super.key});

  @override
  State<PurchaseOrderRequisitionClass> createState() =>
      _PurchaseOrderRequisitionClassState();
}

class _PurchaseOrderRequisitionClassState
    extends State<PurchaseOrderRequisitionClass> {
  String toktoken = '';
  @override
  void initState() {
    super.initState();
    _loadCounter();
    autologout();
    getDataPORequisition();
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      toktoken = (prefs.getString('token') ?? '');
    });
  }

  autologout() async {
    if (toktoken == 'null') {
      Navigator.push(
        context,
        PageTransition(type: PageTransitionType.rightToLeft, child: BMSignIn()),
      );
    }
  }

  Future getDataPORequisition() async {
    final response =
        await http.get(Uri.parse("$base_api/purchaserequisition"), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    });
    var data = jsonDecode(response.body.toString());
    var names = data['data']['porequisation'];
    return names;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.rightToLeft, child: MoreClass()),
            );
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xff40963b),
        title: const Text(
          'Purchase Requisition',
          style: TextStyle(fontSize: 20, fontFamily: 'bold'),
        ),
      ),
      body: FutureBuilder(
        future: getDataPORequisition(),
        builder: (context, snapshot) {
          if (snapshot.hasError) ;
          return snapshot.hasData
              ? new PurchaseOrderReqList(
                  list: snapshot.data,
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        new LoadingBouncingLine.circle(
                          borderColor: Color(0xff40963b),
                          size: 40.0,
                          backgroundColor: Color(0xff40963b),
                          duration: Duration(milliseconds: 900),
                        ),
                      ],
                    ),
                    Text(
                      "LOADING",
                      style: TextStyle(
                          fontFamily: 'tahoma',
                          fontSize: 12,
                          color: Colors.grey),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
