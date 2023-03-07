// ignore_for_file: unnecessary_new, avoid_unnecessary_containers
import 'package:flutter/material.dart';

class SearchDetailClass extends StatefulWidget {
  const SearchDetailClass({super.key});

  @override
  State<SearchDetailClass> createState() => _SearchDetailClassState();
}

class _SearchDetailClassState extends State<SearchDetailClass> {
  Container detail(BuildContext context) {
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
                        child: const Text(
                          'Order Letter #5',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff40963b),
                              fontFamily: 'tahoma'),
                        ),
                      ),
                      ButtonTheme(
                        minWidth: 88.0,
                        height: 5.0,
                        child: const Text(
                          'Closed',
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
                        children: const [
                          Text(
                            'Delivery Note :',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontFamily: 'tahoma'),
                          ),
                          Text(
                            'SJ219022',
                            style: TextStyle(
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
                          const Text(
                            '30 -Vladimir Reyes',
                            style: TextStyle(
                                color: Color(0xff40963b),
                                fontSize: 14,
                                fontFamily: 'tahoma'),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Customer Ship To:",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontFamily: 'tahoma'),
                          ),
                          Text(
                            "BL-982221229",
                            style: TextStyle(
                                color: Color(0xff40963b),
                                fontSize: 14,
                                fontFamily: 'tahoma'),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Currency:",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontFamily: 'tahoma'),
                          ),
                          Text(
                            "Rupiah",
                            style: TextStyle(
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
                        children: const [
                          Text(
                            'Muhammad Syarifuddin',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'tahoma',
                                color: Colors.grey),
                          ),
                          Text(
                            '21-Jul-2022',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'tahoma',
                                color: Color(0xff40963b)),
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
                            const Text(
                              '090809898',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'tahoma',
                                  color: Color(0xff40963b)),
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
                            const Text(
                              '8RWOIUEOR',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'tahoma',
                                  color: Color(0xff40963b)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
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
            'Search Detail',
            style: TextStyle(fontSize: 20, fontFamily: 'bold'),
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
