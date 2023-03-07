// ignore_for_file: avoid_unnecessary_containers, duplicate_ignore, sized_box_for_whitespace, unnecessary_new, unused_import, avoid_print, non_constant_identifier_names, unused_local_variable, unnecessary_this, prefer_adjacent_string_concatenation, prefer_const_constructors

// ignore: unused_import
import 'dart:convert';

import 'package:bm_mobile/helper/database_helper.dart';
import 'package:bm_mobile/model/product_model.dart';
import 'package:bm_mobile/screens/home/menu/more.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sqflite/sqlite_api.dart';

class AddAllocation extends StatefulWidget {
  const AddAllocation({super.key});

  @override
  State<AddAllocation> createState() => _AddAllocationState();
}

class _AddAllocationState extends State<AddAllocation> {
  TextEditingController searchcontroller = TextEditingController();
  String mylocation = '';

  @override
  void initState() {
    super.initState();
    datalocation();
  }

  List locationList = [];
  search() async {
    var searchresult = searchcontroller.text;
    print(searchresult);
  }

  Future datalocation() async {
    var searchresult = searchcontroller.text;
    print(searchresult);
    DatabaseHelper dbHelper = DatabaseHelper.instance;
    Database db = await dbHelper.database;

    if (searchresult == '') {
      final data =
          await db.rawQuery("SELECT location FROM product GROUP BY location");
      print(data);
      setState(() {
        locationList = data;
      });
    } else {
      final data = await db.rawQuery("SELECT location FROM product "
          "WHERE location LIKE '%$searchresult%'"
          "GROUP BY location");
      print(data);
      setState(() {
        locationList = data;
      });
      print(locationList);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff40963b),
        automaticallyImplyLeading: false,
        // leading: Icon(Icons.arrow_back),
        title: Row(
          children: [
            Container(
              height: 80.0,
              width: 310.0,
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: (TextField(
                onChanged: (String value) async {
                  datalocation();
                },
                controller: searchcontroller,
                textAlign: TextAlign.start,
                autofocus: false,
                style:
                    const TextStyle(fontSize: 16.0, color: Color(0xff40963b)),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      searchcontroller.clear();
                      datalocation();
                    },
                    icon: const Icon(Icons.cancel),
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search Blog/Location',
                  hintStyle: const TextStyle(
                      fontSize: 16.0, color: Colors.grey, fontFamily: 'tahoma'),
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              )),
            ),
            Material(
              type: MaterialType.transparency,
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1, color: Colors.white),
                  color: const Color(0xff40963b),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10.0),
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.clear,
                          size: 20.0,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: locationList.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "No Data Available",
                      style: TextStyle(
                          fontFamily: 'tahoma',
                          fontSize: 12,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ],
            )
          : Container(
              color: const Color.fromARGB(255, 238, 238, 238),
              child: ListView.builder(
                itemCount: locationList.length,
                itemBuilder: (context, index) {
                  final p = locationList[index];
                  return new Container(
                    color: const Color.fromARGB(255, 238, 238, 238),

                    // ignore: unnecessary_new
                    child: new GestureDetector(
                      // ignore: unnecessary_new
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () async {
                              Navigator.pop(context, p['location']);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 2, right: 5, left: 5),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(right: 8),
                                        padding:
                                            const EdgeInsets.only(left: 16),
                                        height: 64,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 255, 251, 251),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          // border:
                                          //     Border.all(color: const Color(0xff40963b), width: 1),
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                            Image.asset(
                                              'assets/icons/blog.png',
                                              height: 25,
                                              fit: BoxFit.contain,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 16),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  SizedBox(
                                                    width: 200,
                                                    height: 18,
                                                    child: Text(
                                                      'Location',
                                                      style: const TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              129,
                                                              127,
                                                              127),
                                                          fontSize: 14,
                                                          fontFamily: 'tahoma'),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 2,
                                                  ),
                                                  SizedBox(
                                                    width: 200,
                                                    height: 18,
                                                    child: Text(
                                                      'Warehouse Name',
                                                      style: const TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              129,
                                                              127,
                                                              127),
                                                          fontSize: 14,
                                                          fontFamily: 'tahoma'),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 200,
                                                    height: 18,
                                                    child: Text(
                                                      p['location'],
                                                      style: const TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              129,
                                                              127,
                                                              127),
                                                          fontSize: 14,
                                                          fontFamily: 'tahoma'),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            // child: ListTile(
                            //   title: Text(
                            //     p['location'],
                            //     style: const TextStyle(
                            //         fontSize: 16,
                            //         color: Colors.black,
                            //         fontFamily: 'tahoma'),
                            //   ),
                            // ),
                          ),
                          // const Divider(
                          //   color: Colors.grey,
                          //   thickness: 1,
                          // )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
