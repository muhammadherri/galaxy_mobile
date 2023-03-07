// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_new, duplicate_ignore, unused_field, unnecessary_string_interpolations, avoid_print, unrelated_type_equality_checks, prefer_final_fields, unused_local_variable, unnecessary_null_comparison, non_constant_identifier_names, prefer_const_constructors, use_build_context_synchronously, prefer_is_empty

import 'package:bm_mobile/helper/database_helper.dart';
import 'package:bm_mobile/screens/home/menu/allocation/addalocation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sqflite/sqlite_api.dart';

class SearchAllocation extends StatefulWidget {
  const SearchAllocation({super.key});

  @override
  State<SearchAllocation> createState() => _SearchAllocationState();
}

class _SearchAllocationState extends State<SearchAllocation> {
  String location = "";
  List productionOutput = [];
  TextEditingController itemcode = TextEditingController();
  TextEditingController qtycontroller = TextEditingController();
  TextEditingController item_codecontroller = TextEditingController();
  TextEditingController product_gsmcontroller = TextEditingController();
  String _scanBarcode = 'Item Code';
  var returndata = "";
  @override
  void initState() {
    super.initState();
  }

  alocationautosearch() async {
    Database db = await DatabaseHelper.instance.database;
    List<Map> searchbarcode = await db
        .rawQuery("SELECT * FROM product WHERE product_id = '$_scanBarcode'");
    // "SELECT * FROM product WHERE product_id LIKE '%$_scanBarcode%'");
    print(searchbarcode);
    setState(() {
      productionOutput = searchbarcode;
    });
  }

  Future<void> allocationscan() async {
    String item_code = itemcode.text;
    String barcodeScanRes;
    if (item_code == '') {
      String barcodeScanRes;
      try {
        barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#ff6666', 'Cancel', true, ScanMode.QR);
        print(barcodeScanRes);
      } on PlatformException {
        barcodeScanRes = 'Failed to get platform version.';
      }
      if (!mounted) return;
      setState(() {
        _scanBarcode = barcodeScanRes;
      });
      // search
      alocationautosearch();
    } else {
      print(item_code);
      Database db = await DatabaseHelper.instance.database;
      List<Map> searchbarcode = await db
          .rawQuery("SELECT * FROM product WHERE product_code = '$item_code'");
      print(searchbarcode);
      setState(() {
        productionOutput = searchbarcode;
      });
    }
  }

  Container searchfalse(BuildContext context) {
    return Container(
        child: new GestureDetector(
            child: Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      'STOCK OPNAME',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                          fontFamily: 'bold'),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 60.0,
                        width: 210.0,
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: (TextField(
                          controller: itemcode,
                          decoration: new InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    color: Colors.green, width: 2.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0)),
                            hintText: '$_scanBarcode',
                            hintStyle: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey,
                                fontFamily: 'tahoma'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                color: Colors.teal,
                              ),
                            ),
                          ),
                        )),
                      ),
                      Container(
                        width: 90,
                        child: Material(
                          type: MaterialType.transparency,
                          child: Ink(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(width: 1, color: Colors.white),
                              color: const Color(0xff40963b),
                            ),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () async {
                                allocationscan();
                                Database db =
                                    await DatabaseHelper.instance.database;
                                final read =
                                    await db.rawQuery("SELECT * FROM product");
                                print(read);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/icons/scan.png',
                                      height: 20,
                                      fit: BoxFit.contain,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text(
                                      'SCAN',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily: 'tahoma'),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(
                    child: Text(
                      'No Data Available',
                      style: TextStyle(
                          fontFamily: 'tahoma',
                          fontSize: 16,
                          color: Colors.grey),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
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
          title: const Text('Stock Opname',
              style: TextStyle(fontSize: 20, fontFamily: 'bold')),
        ),
        // ignore: prefer_const_constructors
        body: Container(
          color: const Color.fromARGB(255, 238, 238, 238),
          child: productionOutput.isEmpty
              ? ListView(
                  children: [
                    Stack(
                      children: [
                        searchfalse(context),
                      ],
                    )
                  ],
                )
              : ListView.builder(
                  itemCount: productionOutput.length,
                  itemBuilder: (context, index) {
                    final productionOutputfinal = productionOutput[index];
                    return Stack(
                      children: [
                        Container(
                            child: new GestureDetector(
                                child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        const Text(
                                          'STOCK OPNAME',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.grey,
                                              fontFamily: 'bold'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    thickness: 1,
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 60.0,
                                            width: 210.0,
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 10, 10, 10),
                                            child: (TextField(
                                              controller: itemcode,
                                              // enabled: false,
                                              // ignore: prefer_const_constructors
                                              decoration: new InputDecoration(
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        borderSide: BorderSide(
                                                            color: Colors.green,
                                                            width: 2.0)),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey,
                                                            width: 2.0)),
                                                hintText: productionOutputfinal[
                                                    'product_code'],
                                                hintStyle: const TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.grey,
                                                    fontFamily: 'tahoma'),
                                                border:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.teal,
                                                  ),
                                                ),
                                              ),
                                            )),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Material(
                                              type: MaterialType.transparency,
                                              child: Ink(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(20),
                                                  ),
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.white),
                                                  color:
                                                      const Color(0xff40963b),
                                                ),
                                                child: InkWell(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  onTap: () {
                                                    allocationscan();
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image.asset(
                                                          'assets/icons/scan.png',
                                                          height: 20,
                                                          fit: BoxFit.contain,
                                                          color: Colors.white,
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        const Text(
                                                          'SCAN',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  'tahoma'),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 60.0,
                                                width: 300.0,
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 10, 10, 10),
                                                child: (TextField(
                                                  enabled: false,

                                                  // ignore: prefer_const_constructors
                                                  decoration:
                                                      new InputDecoration(
                                                    disabledBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .grey,
                                                                    width:
                                                                        1.0)),
                                                    hintText:
                                                        productionOutputfinal[
                                                            'warehouse'],
                                                    hintStyle: const TextStyle(
                                                        fontSize: 14.0,
                                                        color: Colors.grey,
                                                        fontFamily: 'tahoma'),
                                                    border:
                                                        const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.teal,
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 60.0,
                                                width: 100.0,
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 10, 10, 10),
                                                child: (TextField(
                                                  enabled: false,
                                                  // ignore: prefer_const_constructors
                                                  decoration:
                                                      new InputDecoration(
                                                    disabledBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .grey,
                                                                    width:
                                                                        1.0)),
                                                    hintText: 'Blog',
                                                    hintStyle: const TextStyle(
                                                        fontSize: 14.0,
                                                        color: Colors.grey,
                                                        fontFamily: 'tahoma'),
                                                    border:
                                                        const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.teal,
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                              ),
                                              GestureDetector(
                                                onTap: () async {
                                                  var result =
                                                      await Navigator.push(
                                                    context,
                                                    PageTransition(
                                                        type: PageTransitionType
                                                            .bottomToTop,
                                                        child:
                                                            const AddAllocation()),
                                                  );
                                                  print(result);
                                                  setState(() {
                                                    if (result == null) {
                                                      returndata =
                                                          productionOutputfinal[
                                                              'location'];
                                                    } else {
                                                      returndata = result;
                                                    }
                                                  });
                                                },
                                                child: Container(
                                                  height: 60.0,
                                                  width: 200.0,
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10, 10, 10, 10),
                                                  child: (TextField(
                                                    enabled: false,
                                                    // ignore: prefer_const_constructors
                                                    decoration:
                                                        new InputDecoration(
                                                      disabledBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .grey,
                                                                      width:
                                                                          1.0)),
                                                      hintText: '$returndata' ==
                                                              ""
                                                          ? productionOutputfinal[
                                                              'location']
                                                          : '$returndata',
                                                      hintStyle:
                                                          const TextStyle(
                                                              fontSize: 14.0,
                                                              color:
                                                                  Colors.grey,
                                                              fontFamily:
                                                                  'tahoma'),
                                                      border:
                                                          const OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: Colors.teal,
                                                        ),
                                                      ),
                                                    ),
                                                  )),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 60.0,
                                                width: 100.0,
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 10, 10, 10),
                                                child: (TextField(
                                                  enabled: false,

                                                  controller:
                                                      item_codecontroller,
                                                  // ignore: prefer_const_constructors
                                                  decoration:
                                                      new InputDecoration(
                                                    disabledBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .grey,
                                                                    width:
                                                                        1.0)),
                                                    hintText:
                                                        productionOutputfinal[
                                                            'item_code'],
                                                    hintStyle: const TextStyle(
                                                        fontSize: 14.0,
                                                        color: Colors.grey,
                                                        fontFamily: 'tahoma'),
                                                    border:
                                                        const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.teal,
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                              ),
                                              Container(
                                                height: 60.0,
                                                width: 100.0,
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 10, 10, 10),
                                                child: (TextField(
                                                  enabled: false,

                                                  controller:
                                                      product_gsmcontroller,
                                                  // ignore: prefer_const_constructors
                                                  decoration:
                                                      new InputDecoration(
                                                    disabledBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .grey,
                                                                    width:
                                                                        1.0)),
                                                    hintText:
                                                        productionOutputfinal[
                                                                'product_gsm'] +
                                                            ' GSM' +
                                                            '',
                                                    hintStyle: const TextStyle(
                                                        fontSize: 14.0,
                                                        color: Colors.grey,
                                                        fontFamily: 'tahoma'),
                                                    border:
                                                        const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.teal,
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                              ),
                                              Container(
                                                height: 60.0,
                                                width: 100.0,
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 10, 10, 10),
                                                child: (TextField(
                                                  enabled: false,

                                                  controller: qtycontroller,
                                                  // ignore: prefer_const_constructors
                                                  decoration:
                                                      new InputDecoration(
                                                    disabledBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .grey,
                                                                    width:
                                                                        1.0)),
                                                    hintText:
                                                        productionOutputfinal[
                                                                'product_qty'] +
                                                            ' KG' +
                                                            '',
                                                    hintStyle: const TextStyle(
                                                        fontSize: 14.0,
                                                        color: Colors.grey,
                                                        fontFamily: 'tahoma'),
                                                    border:
                                                        const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.teal,
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  Material(
                                    type: MaterialType.transparency,
                                    child: Ink(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20)),
                                        border: Border.all(
                                            width: 1, color: Colors.white),
                                        color: const Color(0xff40963b),
                                      ),
                                      child: InkWell(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                        ),
                                        onTap: () async {
                                          var product_id =
                                              productionOutputfinal[
                                                  'product_id'];
                                          var item_code = productionOutputfinal[
                                              'item_code'];
                                          var product_code =
                                              productionOutputfinal[
                                                  'product_code'];
                                          var locationfrom =
                                              productionOutputfinal['location'];
                                          var location = returndata == ''
                                              ? productionOutputfinal[
                                                  'location']
                                              : returndata;
                                          var product_qty =
                                              productionOutputfinal[
                                                  'product_qty'];
                                          var product_gsm =
                                              productionOutputfinal[
                                                  'product_gsm'];
                                          var product_width =
                                              productionOutputfinal[
                                                  'product_width'];
                                          var warehouse = productionOutputfinal[
                                              'warehouse'];
                                          var updated_by =
                                              productionOutputfinal[
                                                  'updated_by'];
                                          var updated_at = DateTime.now();
                                          print(updated_at);
                                          Map<String, dynamic> row = {
                                            DatabaseHelper.product_id:
                                                '$product_id',
                                            DatabaseHelper.item_code:
                                                '$item_code',
                                            DatabaseHelper.product_code:
                                                '$product_code',
                                            DatabaseHelper.location: location,
                                            DatabaseHelper.product_qty:
                                                '$product_qty',
                                            DatabaseHelper.product_gsm:
                                                '$product_gsm',
                                            DatabaseHelper.product_width:
                                                '$product_width',
                                            DatabaseHelper.warehouse:
                                                '$warehouse',
                                            DatabaseHelper.status_trx: '1',
                                            DatabaseHelper.updated_by:
                                                '$updated_by',
                                            DatabaseHelper.updated_at:
                                                '$updated_at',
                                          };
                                          Database db = await DatabaseHelper
                                              .instance.database;
                                          await db.insert(
                                              DatabaseHelper
                                                  .tabletrxphinventory,
                                              row);
                                          final trxphinv = await db.rawQuery(
                                              "SELECT * FROM trxphinventory");
                                          print(trxphinv);
                                          Fluttertoast.showToast(
                                              msg: 'Successfully',
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor:
                                                  Color(0xff40963b),
                                              textColor: Colors.white);
                                          Navigator.pop(context, 'refresh');
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            // ignore: prefer_const_literals_to_create_immutables
                                            children: [
                                              const Text(
                                                'SUBMIT',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontFamily: 'bold'),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ])))
                      ],
                    );
                  },
                ),
        ));
  }
}
