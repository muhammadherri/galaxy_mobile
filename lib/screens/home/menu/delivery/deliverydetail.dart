// ignore_for_file: avoid_unnecessary_containers, unnecessary_new, camel_case_types, prefer_typing_uninitialized_variables, non_constant_identifier_names, no_logic_in_create_state, unnecessary_const, prefer_const_constructors, must_be_immutable, avoid_print, unnecessary_string_interpolations, depend_on_referenced_packages
import 'dart:convert';
import 'package:bm_mobile/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_overlay_pro/animations/bouncing_line.dart';
import 'package:nb_utils/nb_utils.dart';
import 'deliveryList.dart';

class DeliveryDetail extends StatefulWidget {
  final Request;
  const DeliveryDetail({super.key, this.Request});

  @override
  State<DeliveryDetail> createState() =>
      // ignore: unnecessary_this
      _DeliveryDetailState(
        delivery_id: Request['delivery_id'].toString(),
        dock_code: Request['dock_code'].toString(),
        party_name: Request['party_name'].toString(),
        lvl: Request['lvl'].toString(),
        site_code: Request['site_code'].toString(),
        currency_code: Request['currency_code'].toString(),
        name: Request['name'].toString(),
        on_or_about_date: Request['on_or_about_date'].toString(),
        ship_method_code: Request['ship_method_code'].toString(),
        fob_code: Request['fob_code'].toString(),
      );
}

class _DeliveryDetailState extends State<DeliveryDetail> {
  late String order = 'Order Letter';
  late String delivery_id;
  late String dock_code;
  late String party_name;
  late String lvl;
  late String site_code;
  late String currency_code;
  late String name;
  late String on_or_about_date;
  late String ship_method_code;
  late String fob_code;
  _DeliveryDetailState({
    required this.delivery_id,
    required this.dock_code,
    required this.party_name,
    required this.lvl,
    required this.site_code,
    required this.currency_code,
    required this.name,
    required this.on_or_about_date,
    required this.ship_method_code,
    required this.fob_code,
  });
  String toktoken = '';
  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      toktoken = (prefs.getString('token') ?? '');
    });
  }

  Future getDataDelivery() async {
    print(delivery_id);
    final response =
        await http.get(Uri.parse("$base_apitest/deliverydetail/$delivery_id"));
    var data = jsonDecode(response.body.toString());
    print(data);
    var names = data;
    return names;
    // if ('$toktoken' == 'null') {
    //   Fluttertoast.showToast(
    //       msg: 'Login Again your Time Expired',
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.BOTTOM,
    //       timeInSecForIosWeb: 1,
    //       backgroundColor: Colors.red,
    //       textColor: Colors.white);
    // } else {

    //   final response = await http
    //       .get(Uri.parse("$base_api/delivery/$delivery_id"), headers: {
    //     "Content-Type": "application/json",
    //     "Accept": "application/json",
    //     "apitoken": '$toktoken',
    //   });
    //   var data = jsonDecode(response.body.toString());
    //   print(data);
    //   var names = data;

    //   return names;
    // }
  }

  Container deliverydetailinformation(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8.0),
        child: new GestureDetector(
            child: Column(children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
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
                        child: Row(
                          children: [
                            const Text(
                              'Order Letter #',
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff40963b),
                                  fontFamily: 'tahoma'),
                            ),
                            Text(
                              delivery_id,
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff40963b),
                                  fontFamily: 'tahoma'),
                            ),
                          ],
                        ),
                      ),
                      ButtonTheme(
                        minWidth: 88.0,
                        height: 5.0,
                        child: Text(
                          lvl == '6'
                              ? "Waiting Shipping"
                              : lvl == '11'
                                  ? "Cancel"
                                  : "Closed",
                          style: TextStyle(
                              color: const Color(0xff40963b),
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
                            'Delivery Note',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontFamily: 'tahoma'),
                          ),
                          Text(
                            dock_code == 'null'
                                ? 'Delivery Note is Empty'
                                : dock_code,
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
                            'Customer Name:',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontFamily: 'tahoma'),
                          ),
                          Text(
                            party_name,
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
                            "Customer Ship To:",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontFamily: 'tahoma'),
                          ),
                          Text(
                            site_code.toString(),
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
                            "Currency:",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontFamily: 'tahoma'),
                          ),
                          Text(
                            currency_code,
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
                const Divider(
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'tahoma',
                                color: Colors.grey),
                          ),
                          SizedBox(
                            width: 87,
                            height: 16,
                            child: Text(
                              on_or_about_date,
                              style: TextStyle(
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
                const Divider(
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text(
                              'Ship Code',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'tahoma',
                                  color: Colors.grey),
                            ),
                            Text(
                              ship_method_code == 'null'
                                  ? 'Ship Code is Empty'
                                  : ship_method_code,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'tahoma',
                                  color: ship_method_code == 'null'
                                      ? Colors.grey
                                      : const Color(0xff40963b)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text(
                              'Fob Code',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'tahoma',
                                  color: Colors.grey),
                            ),
                            Text(
                              fob_code == 'null' ? 'Fob is Empty' : fob_code,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'tahoma',
                                  color: fob_code == 'null'
                                      ? Colors.grey
                                      : const Color(0xff40963b)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  'Lines Item',
                  style: TextStyle(
                    fontFamily: 'tahoma',
                    color: Color.fromARGB(255, 129, 127, 127),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: FutureBuilder(
              future: getDataDelivery(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? new DeliveryItemList(
                        list: snapshot.data,
                      )
                    : Column(
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
                                fontFamily: 'tahoma',
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                        ],
                      );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ])));
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
          'Delivery Detail',
          style: TextStyle(fontSize: 20, fontFamily: 'bold'),
        ),
      ),
      body: Container(
          color: const Color.fromARGB(255, 238, 238, 238),
          child: ListView(
            children: [
              Stack(
                children: [
                  deliverydetailinformation(context),
                ],
              )
            ],
          )),
    );
  }
}
