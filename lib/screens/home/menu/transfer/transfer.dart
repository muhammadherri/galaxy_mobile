// ignore_for_file: unnecessary_new, avoid_unnecessary_containers, avoid_print, unused_local_variable, prefer_interpolation_to_compose_strings, unnecessary_string_interpolations, depend_on_referenced_packages, unused_import
import 'dart:convert';
import 'package:bm_mobile/screens/login/BMSignIn.dart';
import 'package:bm_mobile/services/api_service.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay_pro/animations/bouncing_line.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;

class TransferClass extends StatefulWidget {
  const TransferClass({super.key});

  @override
  State<TransferClass> createState() => _TransferClassState();
}

class _TransferClassState extends State<TransferClass> {
  List tftransferList = [];
  TextEditingController searchcontroller = TextEditingController();
  String toktoken = '';
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

  Future gettransferList() async {
    var searchitemcode = searchcontroller.text;
    if (searchitemcode == '') {
      final response = await http.get(Uri.parse('$base_apitest/transfer/'));
      // final response = await http.get(Uri.parse("$base_api/transfer"), headers: {
      //   "Content-Type": "application/json",
      //   "Accept": "application/json",
      //   // "apitoken": '$toktoken',
      //   "itemcode": '$searchitemcode',
      // });
      var data = jsonDecode(response.body.toString());
      var tes = data['meta']['status'];
      var names = data['data']['transfer'];
      setState(() {
        tftransferList = names;
      });
    } else {
      final response =
          await http.get(Uri.parse('$base_apitest/transfer/$searchitemcode'));
      var data = jsonDecode(response.body.toString());
      var tes = data['meta']['status'];
      var names = data['data']['transfer'];
      print(names);
      if (tes == 'success') {
        setState(() {
          tftransferList = names;
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
  }

  @override
  void initState() {
    super.initState();
    _loadCounter();
    autologout();
    gettransferList();
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
            'Transfer',
            style: TextStyle(fontSize: 20, fontFamily: 'bold'),
          ),
        ),
        floatingActionButton: Container(
            width: 400.0,
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            child: Material(
              borderRadius: BorderRadius.circular(20),
              elevation: 20.0,
              shadowColor: Colors.grey,
              child: TextFormField(
                onChanged: (String value) async {
                  gettransferList();
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
                      gettransferList();
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
        body: tftransferList.isEmpty
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
                    itemCount: tftransferList.length,
                    itemBuilder: (context, index) {
                      final p = tftransferList[index];
                      return new Container(
                        color: const Color.fromARGB(255, 238, 238, 238),
                        padding:
                            const EdgeInsets.only(top: 5, right: 10, left: 10),
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
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text(
                                                p['item_code'].toString(),
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey,
                                                    fontFamily: 'tahoma'),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              child: Text(
                                                p['trf_subinv'] == ''
                                                    ? p['subinventory_code']
                                                            .toString() +
                                                        '-' +
                                                        p['subinv_code']
                                                            .toString()
                                                    : p['transfer_subinventory']
                                                            .toString() +
                                                        '-' +
                                                        p['trf_subinv'],
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Color(0xff40963b),
                                                    fontFamily: 'tahoma'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(thickness: 1, endIndent: 5),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Location From",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey,
                                                  fontFamily: 'tahoma'),
                                            ),
                                            SizedBox(
                                              height: 16,
                                              child: Text(
                                                p['subinventory_code']
                                                        .toString() +
                                                    '-' +
                                                    p['subinv_code'].toString(),
                                                style: const TextStyle(
                                                    color: Color(0xff40963b),
                                                    fontSize: 16,
                                                    fontFamily: 'tahoma'),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Location To",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey,
                                                  fontFamily: 'tahoma'),
                                            ),
                                            SizedBox(
                                              height: 16,
                                              child: Text(
                                                p['transfer_subinventory'] +
                                                    '-' +
                                                    p['trf_subinv'],
                                                style: const TextStyle(
                                                    color: Color(0xff40963b),
                                                    fontSize: 16,
                                                    fontFamily: 'tahoma'),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Transaction Date",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey,
                                                  fontFamily: 'tahoma'),
                                            ),
                                            SizedBox(
                                              height: 16,
                                              child: Text(
                                                p['transaction_date']
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Color(0xff40963b),
                                                    fontSize: 16,
                                                    fontFamily: 'tahoma'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  // const Divider(thickness: 1, endIndent: 5),
                                  const SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    })));
  }
}
