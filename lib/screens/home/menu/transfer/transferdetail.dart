// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_new, duplicate_ignore, unnecessary_string_interpolations, avoid_print, unnecessary_import, unused_import, prefer_interpolation_to_compose_strings, no_logic_in_create_state, unnecessary_const, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'dart:convert';

import 'package:bm_mobile/settings/AppWidget.dart';
// import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TransferDetailClass extends StatefulWidget {
  final request;

  const TransferDetailClass({super.key, this.request});

  @override
  State<TransferDetailClass> createState() => _TransferDetailClassState(
        product_id: request['product_id'].toString(),
        item_code: request['item_code'].toString(),
        product_code: request['product_code'].toString(),
        location: request['location'].toString(),
        product_qty: request['product_qty'].toString(),
        product_gsm: request['product_gsm'].toString(),
        product_width: request['product_width'].toString(),
        updated_by: request['updated_by'].toString(),
        updated_at: request['updated_at'].toString(),
      );
}

class _TransferDetailClassState extends State<TransferDetailClass> {
  String fullname = "";

  late String product_id;
  late String item_code;
  late String product_code;
  late String location;
  late String product_qty;
  late String product_gsm;
  late String product_width;
  late String updated_by;
  late String updated_at;
  _TransferDetailClassState({
    required this.product_id,
    required this.item_code,
    required this.product_code,
    required this.location,
    required this.product_qty,
    required this.product_gsm,
    required this.product_width,
    required this.updated_by,
    required this.updated_at,
  });
  Future _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      fullname = (prefs.getString('names') ?? '');
    });
  }

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  Container detail(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8.0),
        child: new GestureDetector(
            child: Column(children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          product_code,
                          style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xff40963b),
                              fontFamily: 'tahoma'),
                        ),
                      ),
                      ButtonTheme(
                        minWidth: 88.0,
                        height: 5.0,
                        child: const Text(
                          'Status',
                          style: TextStyle(
                              color: Color(0xff40963b),
                              fontSize: 16,
                              fontFamily: 'tahoma'),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Item Code :',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontFamily: 'tahoma'),
                          ),
                          Text(
                            item_code,
                            style: const TextStyle(
                                color: Color(0xff40963b),
                                fontSize: 14,
                                fontFamily: 'tahoma'),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            'Widht:',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontFamily: 'tahoma'),
                          ),
                          Text(
                            product_width + ' CM',
                            style: const TextStyle(
                                color: Color(0xff40963b),
                                fontSize: 14,
                                fontFamily: 'tahoma'),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Weight:",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontFamily: 'tahoma'),
                          ),
                          Text(
                            product_gsm + ' GSM',
                            style: const TextStyle(
                                color: Color(0xff40963b),
                                fontSize: 14,
                                fontFamily: 'tahoma'),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Quantity:",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontFamily: 'tahoma'),
                          ),
                          Text(
                            product_qty + ' KG',
                            style: const TextStyle(
                                color: Color(0xff40963b),
                                fontSize: 14,
                                fontFamily: 'tahoma'),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            fullname,
                            style: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'tahoma',
                                color: Colors.grey),
                          ),
                          Container(
                            width: 88,
                            height: 16,
                            child: Text(
                              updated_at,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'tahoma',
                                  color: Color(0xff40963b)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // const Divider(thickness: 1, endIndent: 5),
                // const DottedLine(
                //   dashLength: 10,
                //   dashGapLength: 2,
                //   lineThickness: 2,
                //   dashColor: const Color.fromARGB(255, 238, 238, 238),
                //   dashGapColor: Colors.white,
                //   direction: Axis.horizontal,
                // ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Column(
                    children: [
                      Container(
                        // decoration: BoxDecoration(
                        //   border: Border.all(width: 5, color: Colors.grey),
                        // ),
                        child: QrImage(
                          foregroundColor: Colors.grey,
                          embeddedImage:
                              const AssetImage('assets/images/logobuana.png'),
                          data: product_id,
                          version: QrVersions.auto,
                          size: 200,
                        ),
                      ),
                      const Text(
                        'SCAN YOUR CODE HERE',
                        style: TextStyle(
                            fontFamily: 'tahoma',
                            fontSize: 14,
                            color: Colors.grey),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff40963b),
          title: const Text(
            'Transfer Detail',
            style: TextStyle(fontFamily: 'bold'),
          ),
        ),
        body: Container(
          color: const Color.fromARGB(255, 238, 238, 238),
          child: ListView(
            children: [
              Stack(
                children: [
                  detail(context),
                ],
              )
            ],
          ),
        ));
  }
}
