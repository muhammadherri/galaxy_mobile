// ignore_for_file: avoid_unnecessary_containers, avoid_print
import 'package:bm_mobile/screens/home/menu/tag/tagdetail.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class TagClass extends StatefulWidget {
  const TagClass({super.key});

  @override
  State<TagClass> createState() => _TagClassState();
}

class _TagClassState extends State<TagClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff40963b),
        title: const Text(
          'Tag',
          style: TextStyle(fontSize: 20, fontFamily: 'bold'),
        ),
      ),
      body: Container(
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return const TagList();
          },
        ),
      ),
    );
  }
}

class TagList extends StatelessWidget {
  const TagList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, i) {
        // ignore: unnecessary_new
        return new Container(
          color: const Color.fromARGB(255, 238, 238, 238),
          padding: const EdgeInsets.all(8.0),
          // ignore: unnecessary_new
          child: new GestureDetector(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: const TagDetailClass()),
                );
              },
              // ignore: unnecessary_new
              child: new Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                // ignore: unnecessary_new
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: const Text(
                                  'Product Code.',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontFamily: 'tahoma'),
                                ),
                              ),
                              Container(
                                child: const Text(
                                  'G383KLJ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontFamily: 'tahoma'),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                child: const Text(
                                  '2467',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff40963b),
                                      fontFamily: 'tahoma'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text('Qty',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'tahoma')),
                                      Text('Description',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'tahoma')),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [
                                  Text('300.0',
                                      style: TextStyle(
                                          fontSize: 14, fontFamily: 'tahoma')),
                                  Text('This text for product description ',
                                      style: TextStyle(
                                          fontSize: 14, fontFamily: 'tahoma')),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
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
                            "Transfer Sent Date",
                            style:
                                TextStyle(fontSize: 16, fontFamily: 'tahoma'),
                          ),
                          Text(
                            "20-10-2022",
                            style: TextStyle(
                                color: Color(0xff40963b),
                                fontSize: 16,
                                fontFamily: 'tahoma'),
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
            ),
          ),
        );
      },
    );
  }
}
