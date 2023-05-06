// ignore_for_file: unnecessary_new, avoid_unnecessary_containers, must_be_immutable, file_names, prefer_typing_uninitialized_variables, unused_import, prefer_const_constructors, avoid_print, unnecessary_string_interpolations, depend_on_referenced_packages
import 'dart:convert';
import 'package:bm_mobile/screens/home/menu/purchaserequisition/porequisition.dart';
import 'package:bm_mobile/screens/home/menu/purchaserequisition/porequisitiondetail.dart';
import 'package:bm_mobile/screens/login/BMSignIn.dart';
import 'package:bm_mobile/services/api_service.dart';
import 'package:bm_mobile/settings/AppConstant.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PurchaseOrderReqList extends StatefulWidget {
  List list;
  PurchaseOrderReqList({super.key, required this.list});

  @override
  State<PurchaseOrderReqList> createState() => _PurchaseOrderReqListState();
}

class _PurchaseOrderReqListState extends State<PurchaseOrderReqList> {
  String toktoken = '';

  @override
  void initState() {
    super.initState();
    _loadCounter();
    autologout();
    // getDataPORequisition();
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      toktoken = (prefs.getString('token') ?? '');
    });
    print(toktoken);
  }

  autologout() async {
    print(toktoken);
    if (toktoken == 'null') {
      Navigator.push(
        context,
        PageTransition(type: PageTransitionType.rightToLeft, child: BMSignIn()),
      );
    }
    print(toktoken);
  }

  Future getDataPORequisition() async {
    try {
      print('test');
      final response =
          await http.get(Uri.parse("$base_api/purchaserequisition"), headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "apitoken": '$toktoken',
      });
      print(response);
      var data = jsonDecode(response.body.toString());
      print(data);

      var names = data['data']['porequisation'];
      print(names);
      return names;
    } catch (e) {
      print(e);
      Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      builder: MaterialIndicatorDelegate(
        builder: (context, controller) {
          return Image.asset(
            'assets/images/logobuana.png',
            height: 25,
            fit: BoxFit.contain,
          );
        },
      ),
      onRefresh: () async {
        Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child: const PurchaseOrderRequisitionClass()),
        );
      },
      child: ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: (context, i) {
          return new Container(
            color: const Color.fromARGB(255, 238, 238, 238),
            padding: const EdgeInsets.only(bottom: 5, right: 10, left: 10),
            child: new GestureDetector(
              child: InkWell(
                child: new Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text(
                                    widget.list[i]['pr_number'].toString(),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                        fontFamily: 'tahoma'),
                                  ),
                                ),
                                ButtonTheme(
                                  minWidth: 88.0,
                                  height: 5.0,
                                  child: Row(
                                    children: [
                                      Text(
                                        widget.list[i]['status'].toString() == '2'
                                            ? 'Approved'
                                            : widget.list[i]['status'].toString() ==
                                                    '13'
                                                ? 'Rejected'
                                                 : widget.list[i]['status'].toString() ==
                                                    '1'
                                                ? 'Next Approval '
                                                : 'Open',
                                        style: const TextStyle(
                                            color: Color(0xff40963b),
                                            fontSize: 16,
                                            fontFamily: 'tahoma'),
                                      ),
                                      Text(
                                  widget.list[i]['next_approve'].toString(),
                                style: const TextStyle(
                                            color: Color(0xff40963b),
                                            fontSize: 16,
                                            fontFamily: 'tahoma'),
                                ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Requested By',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'tahoma',
                                      color: Colors.grey),
                                ),
                                Text(
                                  widget.list[i]['user'].toString(),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'tahoma',
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Updated By',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'tahoma',
                                      color: Colors.grey),
                                ),
                                Text(
                                  widget.list[i]['updatedby'].toString(),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'tahoma',
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Rate Date',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'tahoma',
                                      color: Colors.grey),
                                ),
                                Text(
                                  widget.list[i]['created_at'].toString(),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'tahoma',
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Updated Date',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'tahoma',
                                      color: Colors.grey),
                                ),
                                Text(
                                  widget.list[i]['updated_at'].toString(),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'tahoma',
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.list[i]['next_approve'] == ''
                                          ? ''
                                          : 'Next Approve',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff40963b),
                                          fontFamily: 'tahoma'),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      widget.list[i]['next_approve'].toString(),
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff40963b),
                                          fontFamily: 'tahoma'),
                                    ),
                                  ],
                                ),
                                TextButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff40963b),
                                    minimumSize: const Size(88, 20),
                                    padding: const EdgeInsets.all(12.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    elevation: 5,
                                  ),
                                  child: Container(
                                    child: Row(
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        const Text(
                                          'See More...',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontFamily: 'tahoma'),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          child:
                                              PurchaseOrderRequisitionDetailClass(
                                            request: widget.list[i],
                                          )),
                                    );
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PurchaseOrderReqItemList extends StatefulWidget {
  List list;

  PurchaseOrderReqItemList({super.key, required this.list});
  @override
  State<PurchaseOrderReqItemList> createState() =>
      _PurchaseOrderReqItemListState();
}

class _PurchaseOrderReqItemListState extends State<PurchaseOrderReqItemList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.list.length,
      itemBuilder: (context, i) {
        return new Container(
          color: Colors.white,
          padding: const EdgeInsets.only(bottom: 20, right: 4, left: 4),
          child: new GestureDetector(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          '#',
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'tahoma',
                              fontSize: 14),
                        ),
                        Text(
                          widget.list[i]['header'],
                          style: const TextStyle(
                              color: Colors.grey,
                              fontFamily: 'tahoma',
                              fontSize: 14),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          widget.list[i]['quantity'],
                          style: const TextStyle(
                              color: Colors.grey,
                              fontFamily: 'tahoma',
                              fontSize: 14),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.list[i]['pr_uom_code'],
                          style: const TextStyle(
                              color: Colors.grey,
                              fontFamily: 'tahoma',
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Product : ',
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'tahoma',
                              fontSize: 14),
                        ),
                        SizedBox(
                          width: 100,
                          height: 16,
                          child: Text(
                            widget.list[i]['attribute1'],
                            style: const TextStyle(
                                color: Colors.grey,
                                fontFamily: 'tahoma',
                                fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'Quantity :',
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'tahoma',
                              fontSize: 14),
                        ),
                        Text(
                          widget.list[i]['estimated_cost'],
                          style: const TextStyle(
                              color: Colors.grey,
                              fontFamily: 'tahoma',
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.grey,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
