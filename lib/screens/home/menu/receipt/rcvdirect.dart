// ignore_for_file: avoid_unnecessary_containers, unnecessary_new, duplicate_ignore, prefer_final_fields, unused_field

import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';

class RcvDirect extends StatefulWidget {
  const RcvDirect({super.key});

  @override
  State<RcvDirect> createState() => _RcvDirectState();
}

class _RcvDirectState extends State<RcvDirect> {
  bool shouldCheck = false;
  bool shouldCheckDefault = false;

  String dropdownwarehouse = 'Wahrehouse 1';
  String dropdownblog = 'Blog A';

  // List of items in our dropdown menu
  var warehouseitems = [
    'Wahrehouse 1',
    'Wahrehouse 2',
    'Wahrehouse 3',
    'Wahrehouse 4',
    'Wahrehouse 5',
  ];
  var blogitems = [
    'Blog A',
    'Blog B',
    'Blog C',
    'Blog D',
    'Blog E',
  ];
  Container form(BuildContext context) {
    return Container(
        // ignore: unnecessary_new
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
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      'Form Supplier Direct',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                          fontFamily: 'bold'),
                    )
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(4)),
                          height: 40.0,
                          width: 330.0,
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(5),
                          // padding: const EdgeInsets.fromLTRB(80, 10, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              (DropdownButton(
                                // Initial Value
                                style: const TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey,
                                    fontFamily: 'tahoma'),
                                value: dropdownwarehouse,

                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down),

                                // Array list of items
                                items: warehouseitems.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownwarehouse = newValue!;
                                  });
                                },
                              )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 60.0,
                        width: 350.0,
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: (TextField(
                          enabled: true,
                          // ignore: prefer_const_constructors
                          decoration: new InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.green, width: 1.0)),
                            enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0)),
                            hintText: 'Container No.',
                            hintStyle: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey,
                                fontFamily: 'tahoma'),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.teal,
                              ),
                            ),
                          ),
                        )),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 60.0,
                        width: 350.0,
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: (TextField(
                          enabled: true,
                          // ignore: prefer_const_constructors
                          decoration: new InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.green, width: 1.0)),
                            enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0)),
                            hintText: 'Packing Slip',
                            hintStyle: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey,
                                fontFamily: 'tahoma'),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.teal,
                              ),
                            ),
                          ),
                        )),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 60.0,
                        width: 350.0,
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: (TextField(
                          enabled: false,
                          // ignore: prefer_const_constructors
                          decoration: new InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.green, width: 1.0)),
                            enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0)),
                            hintText: 'Good Receipt Note',
                            hintStyle: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey,
                                fontFamily: 'tahoma'),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.teal,
                              ),
                            ),
                          ),
                        )),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomCheckBox(
                              value: shouldCheck,
                              shouldShowBorder: false,
                              borderColor: const Color(0xff40963b),
                              checkedFillColor: const Color(0xff40963b),
                              // borderRadius: 8,
                              borderWidth: 1,
                              checkBoxSize: 16,
                              onChanged: (val) {
                                //do your stuff here
                                setState(() {
                                  shouldCheck = val;
                                });
                              },
                            ),
                            const Text(
                              'Organization',
                              style: TextStyle(
                                  fontFamily: 'tahoma',
                                  fontSize: 14,
                                  color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  _tabSection(context),
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
          backgroundColor: const Color(0xff40963b),
          title: const Text(
            'Supplier Direct',
            style: TextStyle(fontSize: 20, fontFamily: 'bold'),
          ),
        ),
        body: Container(
          color: const Color.fromARGB(255, 238, 238, 238),
          child: ListView(
            children: [
              Stack(
                children: [
                  form(context),
                ],
              )
            ],
          ),
        ));
  }
}

Widget _tabSection(BuildContext context) {
  return DefaultTabController(
    length: 2,
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          child: const TabBar(
              labelColor: Color(0xff40963b),
              labelStyle: TextStyle(fontSize: 16, fontFamily: 'tahoma'),
              tabs: [
                Tab(
                  text: "Product",
                ),
                Tab(text: "Detail"),
              ]),
        ),
        SizedBox(
          //Add this to give height
          height: MediaQuery.of(context).size.height,
          child: TabBarView(children: [
            Container(
              child: Stack(children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text('Product'),
                        TextField(
                          enabled: false,
                          // ignore: prefer_const_constructors
                          decoration: new InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.green, width: 1.0)),
                            enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0)),
                            hintText: 'Good Receipt Note',
                            hintStyle: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey,
                                fontFamily: 'tahoma'),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.teal,
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              ]),
            ),
            Container(
              child: const Text("Articles Body"),
            ),
          ]),
        ),
      ],
    ),
  );
}
