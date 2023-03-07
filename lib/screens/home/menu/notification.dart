// ignore_for_file: unnecessary_new, avoid_unnecessary_containers, prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace

import 'package:flutter/material.dart';

class NotificationClass extends StatefulWidget {
  const NotificationClass({super.key});

  @override
  State<NotificationClass> createState() => _NotificationClassState();
}

class _NotificationClassState extends State<NotificationClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff40963b),
        title: const Text(
          'Notification',
          style: TextStyle(fontFamily: 'bold'),
        ),
      ),
      body: SafeArea(child: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return _notifList();
            },
          );
        },
      )),
    );
  }

  Widget _notifList() {
    return Container(
      // color: Color.fromARGB(255, 213, 244, 211),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      child: Image.asset("assets/icons/notif.png"),
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            "MFA 125 GSM 150 CM",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'tahoma',
                                color: Colors.grey),
                          ),
                          const Text(
                            "MFA 125 GSM 150 CM",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'tahoma',
                                color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Icon(
                                Icons.timelapse_sharp,
                                color: Colors.grey,
                                size: 14,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "20-10-2022",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontFamily: 'tahoma'),
                              ),
                            ],
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
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
