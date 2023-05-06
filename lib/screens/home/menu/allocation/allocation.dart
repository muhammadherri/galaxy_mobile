// ignore_for_file: avoid_unnecessary_containers, unnecessary_new, duplicate_ignore, unused_local_variable, avoid_print, unnecessary_const, prefer_adjacent_string_concatenation, sized_box_for_whitespace, unused_field, unused_element, prefer_const_constructors, constant_identifier_names

import 'package:bm_mobile/helper/database_helper.dart';
import 'package:bm_mobile/screens/home/menu/allocation/searchallocation.dart';
import 'package:loading_overlay_pro/animations/bouncing_line.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sqflite/sqflite.dart';

enum RadioButtonType { Dowloadable, Deliverable }

class AllocationClass extends StatefulWidget {
  const AllocationClass({super.key});

  @override
  State<AllocationClass> createState() => _AllocationClassState();
}

class _AllocationClassState extends State<AllocationClass>
    with TickerProviderStateMixin {
  TextEditingController searchcontroller = TextEditingController();

  bool value = false;
  void changeData() {
    setState(() {
      value = true;
    });
  }

  int _page = 0;
  final int _limit = 10;
  late bool _isFirstLoadRunning = false;
  late bool _hasNextPage = true;
  late bool _isLoadMoreRunning = false;
  List _posts = [];
  List allocation = [];

  void _loadMore() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false) {
      setState(() {
        _isLoadMoreRunning = true;
      });
      _page += 1;

      DatabaseHelper dbHelper = DatabaseHelper.instance;
      Database db = await dbHelper.database;

      final data = await db.rawQuery(
          "SELECT product_id,item_code,product_code,location,product_qty,product_gsm,product_width,updated_by,updated_at "
          "FROM product ");

      if (data.isNotEmpty) {
        setState(() {
          // _posts.addAll(data);
          _posts = data;
        });
      } else {
        setState(() {
          _hasNextPage = false;
        });
      }
      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    DatabaseHelper dbHelper = DatabaseHelper.instance;
    Database db = await dbHelper.database;

    final data = await db.rawQuery(
        "SELECT product_id,item_code,product_code,location,product_qty,product_gsm,product_width,updated_by,updated_at "
        "FROM product ");
    setState(() {
      _posts = data;
    });
    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  late ScrollController _controller;
  List trxlist = [];

  transaction() async {
    Database db = await DatabaseHelper.instance.database;
    List<Map> trx =
        await db.rawQuery("SELECT * FROM trxphinventory ORDER BY id desc");
    print(trx);
    var tes = await db.rawQuery("SELECT * FROM trxphinventory ORDER BY id desc");
    setState(() {
      trxlist = trx;
    });
  }

  test() async {
    print('test');
  }

  allocationlist() async {
    var searchresult = searchcontroller.text;
    print(searchresult);
    Database db = await DatabaseHelper.instance.database;
    var trx = await db.rawQuery("SELECT * FROM trxphinventory");
    print(trx);
    if (searchresult == '') {
      List<Map> trx = await db.rawQuery("SELECT * FROM product");
      print(trx);
      setState(() {
        allocation = trx;
      });
    } else {
      List<Map> trx = await db.rawQuery(
          "SELECT * FROM product WHERE location LIKE '%$searchresult%'");
      print(trx);
      setState(() {
        _posts = trx;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    allocationlist();
    transaction();
    _firstLoad();
    print('object');
    _controller = ScrollController()..addListener(_loadMore);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
          title: const Text('Allocation',
              style: TextStyle(fontSize: 20, fontFamily: 'bold')),
          bottom: TabBar(
            labelColor: Colors.amber,
            indicatorColor: Colors.white,
            tabs: [
              Container(
                height: 40,
                child: Center(
                  child: Text(
                    'Allocation List',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'tahoma'),
                  ),
                ),
              ),
              Container(
                height: 40,
                child: Center(
                  child: Text(
                    'Transaction',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'tahoma'),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              color: const Color.fromARGB(255, 238, 238, 238),
              child: allocation.isEmpty
                  ? const Center(
                      child: Text(
                        'No Data Available',
                        style: TextStyle(
                            fontFamily: 'tahoma',
                            fontSize: 16,
                            color: Colors.grey),
                      ),
                    )
                  : Padding(
                      padding:
                          const EdgeInsets.only(top: 5, left: 10, right: 10),
                      child: _isFirstLoadRunning
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    LoadingBouncingLine.circle(
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
                            )
                          : Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                    child: ListView.builder(
                                  itemCount: _posts.length,
                                  controller: _controller,
                                  itemBuilder: (_, index) => Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    // title: Text(_posts[index]['product_id']),
                                    child: new Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    child: Text(
                                                      _posts[index]
                                                              ['item_code'] +
                                                          ' ' +
                                                          _posts[index]
                                                              ['product_gsm'] +
                                                          'GSM ' +
                                                          _posts[index][
                                                              'product_width'] +
                                                          'CM' +
                                                          '',
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.black,
                                                          fontFamily: 'tahoma'),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: const [
                                                        Text(
                                                          'Status',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color: Color(
                                                                  0xff40963b),
                                                              fontFamily:
                                                                  'tahoma'),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Divider(
                                            thickness: 1, endIndent: 5),
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            children: [
                                              Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      child: const Text(
                                                        'Item Code',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color: Colors.grey,
                                                            fontFamily:
                                                                'tahoma'),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        _posts[index]
                                                            ['product_code'],
                                                        style: const TextStyle(
                                                            fontSize: 14,
                                                            color: Color(
                                                                0xff40963b),
                                                            fontFamily:
                                                                'tahoma'),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      child: const Text(
                                                        'Weight',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color: Colors.grey,
                                                            fontFamily:
                                                                'tahoma'),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        _posts[index][
                                                                'product_qty'] +
                                                            ' Kg' +
                                                            '',
                                                        style: const TextStyle(
                                                            fontSize: 14,
                                                            color: Color(
                                                                0xff40963b),
                                                            fontFamily:
                                                                'tahoma'),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      child: const Text(
                                                        'Location',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color: Colors.grey,
                                                            fontFamily:
                                                                'tahoma'),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        '' +
                                                            'Blog ' +
                                                            _posts[index]
                                                                ['location'],
                                                        style: const TextStyle(
                                                            fontSize: 14,
                                                            color: Color(
                                                                0xff40963b),
                                                            fontFamily:
                                                                'tahoma'),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      child: const Text(
                                                        'Updated Date',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color: Colors.grey,
                                                            fontFamily:
                                                                'tahoma'),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 18,
                                                      width: 72,
                                                      child: Text(
                                                        _posts[index]
                                                            ['updated_at'],
                                                        style: const TextStyle(
                                                            fontSize: 14,
                                                            color: Color(
                                                                0xff40963b),
                                                            fontFamily:
                                                                'tahoma'),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // const Divider(
                                        //     thickness: 1, endIndent: 5),
                                        const SizedBox(
                                          height: 10,
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                                if (_isLoadMoreRunning == true)
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          new LoadingBouncingLine.circle(
                                            borderColor: Color(0xff40963b),
                                            size: 40.0,
                                            backgroundColor: Color(0xff40963b),
                                            duration:
                                                Duration(milliseconds: 900),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                              ],
                            ),
                    ),
            ),
            Container(
              color: const Color.fromARGB(255, 238, 238, 238),
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
                child: trxlist.isEmpty
                    ? const Center(
                        child: Text(
                          'No Data Available',
                          style: TextStyle(
                              fontFamily: 'tahoma',
                              fontSize: 16,
                              color: Colors.grey),
                        ),
                      )
                    : ListView.builder(
                        itemCount: trxlist.length,
                        itemBuilder: (context, index) {
                          final trxvalue = trxlist[index];
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // title: Text(_posts[index]['product_id']),
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
                                          Container(
                                            child: Text(
                                              trxvalue['item_code'] +
                                                  ' ' +
                                                  trxvalue['product_gsm'] +
                                                  'GSM ' +
                                                  trxvalue['product_width'] +
                                                  'CM' +
                                                  '',
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                  fontFamily: 'tahoma'),
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: const [
                                                Text(
                                                  'Status',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Color(0xff40963b),
                                                      fontFamily: 'tahoma'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(thickness: 1, endIndent: 5),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: const Text(
                                                'Item Code',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey,
                                                    fontFamily: 'tahoma'),
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                trxvalue['product_code'],
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xff40963b),
                                                    fontFamily: 'tahoma'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: const Text(
                                                'Weight',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey,
                                                    fontFamily: 'tahoma'),
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                trxvalue['product_qty'] + ' Kg',
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xff40963b),
                                                    fontFamily: 'tahoma'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: const Text(
                                                'Location',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey,
                                                    fontFamily: 'tahoma'),
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                '' +
                                                    'Blog ' +
                                                    trxvalue['location'],
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xff40963b),
                                                    fontFamily: 'tahoma'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: const Text(
                                                'Updated Date',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey,
                                                    fontFamily: 'tahoma'),
                                              ),
                                            ),
                                            Container(
                                              height: 18,
                                              width: 72,
                                              child: Text(
                                                trxvalue['updated_at'],
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xff40963b),
                                                    fontFamily: 'tahoma'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(thickness: 1, endIndent: 5),
                                const SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
                width: 200.0,
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  elevation: 20.0,
                  shadowColor: Colors.grey,
                  child: TextFormField(
                    onChanged: (String value) async {
                      allocationlist();
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
                          allocationlist();
                        },
                        icon: const Icon(Icons.cancel),
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Search Blog',
                      hintStyle: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                          fontFamily: 'tahoma'),
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                )),
            Container(
              height: 50,
              child: FloatingActionButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () async {
                  var refresh = await Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: const SearchAllocation()),
                  );
                  if (refresh == 'refresh') {
                    transaction();
                  } else {
                    transaction();
                  }
                },
                backgroundColor: const Color(0xff40963b),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
