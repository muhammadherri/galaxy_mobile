// ignore_for_file: unnecessary_new, prefer_const_constructors, empty_statements, unnecessary_string_interpolations, unused_import, depend_on_referenced_packages, must_be_immutable

import 'dart:convert';
import 'package:bm_mobile/screens/home/menu/delivery/deliverydetail.dart';
import 'package:bm_mobile/screens/home/menu/more.dart';
import 'package:bm_mobile/screens/home/menu/purchaserequisition/poreqList.dart';
import 'package:bm_mobile/screens/login/BMSignIn.dart';
import 'package:bm_mobile/services/api_service.dart';
import 'package:bm_mobile/settings/AppConstant.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay_pro/animations/bouncing_line.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;

class DeliveryClass extends StatefulWidget {
  const DeliveryClass({super.key});

  @override
  State<DeliveryClass> createState() => _DeliveryClassState();
}

class _DeliveryClassState extends State<DeliveryClass> {
  List deliveryList = [];
  TextEditingController searchcontroller = TextEditingController();
  String toktoken = '';
  @override
  void initState() {
    super.initState();
    _loadCounter();
    autologout();
    getDataDelivery();
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

  Future getDataDelivery() async {
    var searchitemcode = searchcontroller.text;
    if (searchitemcode == '') {
      final response = await http.get(Uri.parse("$base_apitest/delivery/"));
      // final response =
      //     await http.get(Uri.parse("$base_apitest/delivery"), headers: {
      //   "Content-Type": "application/json",
      //   "Accept": "application/json",
      //   "trxname": '$searchitemcode',
      // });
      var data = jsonDecode(response.body.toString());
      var tes = data['meta']['status'];
      var names = data['data']['deliveryheader'];
      if (tes == 'success') {
        setState(() {
          deliveryList = names;
        });
        return names;
      } else {
        Fluttertoast.showToast(
            msg: 'Not Found',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white);
      }
    }
    final response =
        await http.get(Uri.parse("$base_apitest/delivery/$searchitemcode"));
    // final response =
    //     await http.get(Uri.parse("$base_apitest/delivery"), headers: {
    //   "Content-Type": "application/json",
    //   "Accept": "application/json",
    //   "trxname": '$searchitemcode',
    // });
    var data = jsonDecode(response.body.toString());
    var tes = data['meta']['status'];
    var names = data['data']['deliveryheader'];
    if (tes == 'success') {
      setState(() {
        deliveryList = names;
      });
      return names;
    } else {
      Fluttertoast.showToast(
          msg: 'Not Found',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xff40963b),
        title: const Text(
          'Delivery',
          style: TextStyle(fontSize: 20, fontFamily: 'bold'),
        ),
      ),
      body: deliveryList.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const LoadingBouncingLine.circle(
                      borderColor: Color(0xff40963b),
                      size: 40.0,
                      backgroundColor: Color(0xff40963b),
                      duration: Duration(milliseconds: 900),
                    ),
                  ],
                ),
                const Text(
                  "LOADING",
                  style: TextStyle(
                      fontFamily: 'tahoma', fontSize: 12, color: Colors.grey),
                ),
              ],
            )
          : Container(
              color: const Color.fromARGB(255, 238, 238, 238),
              child: ListView.builder(
                  itemCount: deliveryList.length,
                  itemBuilder: (context, index) {
                    final p = deliveryList[index];
                    return new Container(
                      color: const Color.fromARGB(255, 238, 238, 238),
                      padding:
                          const EdgeInsets.only(top: 5, right: 10, left: 10),
                      child: new GestureDetector(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DeliveryDetail(
                                    Request: deliveryList[index]),
                              ),
                            );
                          },
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            p['party_name'].toString(),
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey,
                                                fontFamily: 'tahoma'),
                                          ),
                                          ButtonTheme(
                                            minWidth: 88.0,
                                            height: 5.0,
                                            child: Text(
                                              p['trx_name'].toString(),
                                              style: const TextStyle(
                                                  color: Color(0xff40963b),
                                                  fontSize: 16,
                                                  fontFamily: 'tahoma'),
                                            ),
                                          )
                                        ],
                                      ),
                                      const Divider(
                                        thickness: 1,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Delivery Note',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'tahoma',
                                                color: Colors.grey),
                                          ),
                                          Text(
                                            p['deliverynote'] ?? 'Empty',
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'tahoma',
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          Text(
                                            'Currency',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'tahoma',
                                                color: Colors.grey),
                                          ),
                                          Text(
                                            p['currency_code'] ?? 'Empty',
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'tahoma',
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Quantity',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'tahoma',
                                                color: Colors.grey),
                                          ),
                                          Text(
                                            p['reqqty'].toString(),
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'tahoma',
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Delivery Date',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'tahoma',
                                                color: Colors.grey),
                                          ),
                                          SizedBox(
                                            width: 75,
                                            height: 16,
                                            child: Text(
                                              p['on_or_about_date'].toString(),
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: 'tahoma',
                                                  color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
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
                  })),
      floatingActionButton: Container(
          width: 400.0,
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Material(
            borderRadius: BorderRadius.circular(20),
            elevation: 20.0,
            shadowColor: Colors.grey,
            child: TextFormField(
              onChanged: (String value) async {
                getDataDelivery();
              },
              textAlign: TextAlign.start,
              controller: searchcontroller,
              autofocus: false,
              style: const TextStyle(
                  fontSize: 16.0,
                  color: Color(0xff40963b),
                  fontFamily: 'tahoma'),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    searchcontroller.clear();
                    getDataDelivery();
                  },
                  icon: const Icon(Icons.cancel),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search Item',
                hintStyle: const TextStyle(
                    fontSize: 16.0, color: Colors.grey, fontFamily: 'tahoma'),
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class DeliveryList extends StatefulWidget {
  List list;
  DeliveryList({super.key, required this.list});

  @override
  State<DeliveryList> createState() => _DeliveryListState();
}

class _DeliveryListState extends State<DeliveryList> {
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
              type: PageTransitionType.fade, child: const DeliveryClass()),
        );
      },
      child: ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: (context, i) {
          return new Container(
            color: const Color.fromARGB(255, 238, 238, 238),
            padding: EdgeInsets.only(top: 5, right: 10, left: 10),
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
                                Text(
                                  widget.list[i]['party_name'].toString(),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                      fontFamily: 'tahoma'),
                                ),
                                ButtonTheme(
                                  minWidth: 88.0,
                                  height: 5.0,
                                  child: Text(
                                    widget.list[i]['trx_name'].toString(),
                                    style: const TextStyle(
                                        color: Color(0xff40963b),
                                        fontSize: 16,
                                        fontFamily: 'tahoma'),
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
                                  'Delivery Note',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'tahoma',
                                      color: Colors.grey),
                                ),
                                Text(
                                  widget.list[i]['deliverynote'] ?? 'Empty',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'tahoma',
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  'Currency',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'tahoma',
                                      color: Colors.grey),
                                ),
                                Text(
                                  widget.list[i]['currency_code'] ?? 'Empty',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'tahoma',
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Quantity',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'tahoma',
                                      color: Colors.grey),
                                ),
                                Text(
                                  widget.list[i]['reqqty'].toString(),
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'tahoma',
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Delivery Date',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'tahoma',
                                      color: Colors.grey),
                                ),
                                Text(
                                  widget.list[i]['on_or_about_date'].toString(),
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'tahoma',
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
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
