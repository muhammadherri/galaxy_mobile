// ignore_for_file: avoid_unnecessary_containers, unnecessary_new

import 'package:flutter/material.dart';

import 'jobsdetail.dart';

class JobsClass extends StatefulWidget {
  const JobsClass({super.key});

  @override
  State<JobsClass> createState() => _JobsClassState();
}

class _JobsClassState extends State<JobsClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff40963b),
        title: const Text(
          'Jobs',
          style: TextStyle(fontSize: 20, fontFamily: 'bold'),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, i) {
          return new Container(
            color: const Color.fromARGB(255, 238, 238, 238),
            padding: const EdgeInsets.all(8.0),
            child: new GestureDetector(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: const Text(
                              'History Name',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontFamily: 'tahoma'),
                            ),
                          ),
                          ButtonTheme(
                            minWidth: 88.0,
                            height: 5.0,
                            child: const Text(
                              'Status Name',
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
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2,
                                      color: const Color.fromARGB(
                                          255, 192, 191, 191)),
                                ),
                                child: Image.asset(
                                  'assets/images/rol.webp',
                                  height: 60,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Item Code',
                                      style: TextStyle(
                                          fontSize: 14, fontFamily: 'tahoma'),
                                    ),
                                    Text(
                                      "Type",
                                      style: TextStyle(
                                          fontSize: 14, fontFamily: 'tahoma'),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text(
                                "Price",
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'tahoma'),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Total Amount',
                            style:
                                TextStyle(fontSize: 14, fontFamily: 'tahoma'),
                          ),
                          Text(
                            'Total Number : Rp 32.000',
                            style:
                                TextStyle(fontSize: 16, fontFamily: 'tahoma'),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            children: [
                              TextButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff40963b),
                                  minimumSize: const Size(88, 20),
                                  padding: const EdgeInsets.all(12.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  elevation: 5,
                                ),
                                child: Container(
                                  child: const Text(
                                    'See More...',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'tahoma'),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const JobsDetail()),
                                  );
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
