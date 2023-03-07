// ignore_for_file: avoid_unnecessary_containers, unnecessary_new, duplicate_ignore

import 'package:flutter/material.dart';

class OutputInputClass extends StatefulWidget {
  const OutputInputClass({super.key});

  @override
  State<OutputInputClass> createState() => _OutputInputClassState();
}

class _OutputInputClassState extends State<OutputInputClass> {
  Container input(BuildContext context) {
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
                      'Input Output',
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 60.0,
                        width: 210.0,
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: (TextField(
                          enabled: false,
                          // ignore: prefer_const_constructors
                          decoration: new InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.green, width: 2.0)),
                            enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0)),
                            hintText: 'Item Code',
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
                      SizedBox(
                        width: 90,
                        child: Material(
                          type: MaterialType.transparency,
                          child: Ink(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              border: Border.all(width: 1, color: Colors.white),
                              color: const Color(0xff40963b),
                            ),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20.0),
                              onTap: () {},
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
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 60.0,
                        width: 300.0,
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: (TextField(
                          enabled: false,
                          // ignore: prefer_const_constructors
                          decoration: new InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.green, width: 2.0)),
                            enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0)),
                            hintText: 'Warehouse',
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
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 60.0,
                        width: 200.0,
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
                            hintText: 'Blog Name',
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
                      Container(
                        height: 60.0,
                        width: 100.0,
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: (TextField(
                          enabled: false,
                          // ignore: prefer_const_constructors
                          decoration: new InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.green, width: 2.0)),
                            enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0)),
                            hintText: 'No.',
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
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 60.0,
                        width: 100.0,
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
                            hintText: 'Weight',
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
                      Container(
                        height: 60.0,
                        width: 100.0,
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
                            hintText: 'Width',
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
                      Container(
                        height: 60.0,
                        width: 100.0,
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: (TextField(
                          // ignore: prefer_const_constructors
                          decoration: new InputDecoration(
                            enabled: false,
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.green, width: 1.0)),
                            enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0)),
                            hintText: 'Height',
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
            'Input Output',
            style: TextStyle(fontFamily: 'bold'),
          ),
        ),
        body: Container(
          color: const Color.fromARGB(255, 238, 238, 238),
          child: ListView(
            children: [
              Stack(
                children: [
                  input(context),
                ],
              )
            ],
          ),
        ));
  }
}
