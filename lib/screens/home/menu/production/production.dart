// ignore_for_file: unnecessary_new, avoid_unnecessary_containers, avoid_print, unused_import, duplicate_ignore
import 'package:bm_mobile/screens/home/menu/production/productiondetail.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ProductionClass extends StatefulWidget {
  const ProductionClass({super.key});

  @override
  State<ProductionClass> createState() => _ProductionClassState();
}

class _ProductionClassState extends State<ProductionClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff40963b),
        title: const Text(
          'Production',
          style: TextStyle(fontSize: 20, fontFamily: 'bold'),
        ),
      ),
      body: Container(
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return const ProductionList();
          },
        ),
      ),
    );
  }
}

class ProductionList extends StatelessWidget {
  const ProductionList({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, i) {
        return new Container(
          color: const Color.fromARGB(255, 238, 238, 238),
          padding: const EdgeInsets.all(8.0),
          child: new GestureDetector(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: const ProductionDetailClass()),
                );
              },
              child: new Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text(
                                  'Item Name',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontFamily: 'tahoma'),
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Text(
                                      'Winong',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontFamily: 'tahoma'),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Blog A-12',
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
                    const Divider(
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  child: const Text(
                                    '60 Kg',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                        fontFamily: 'tahoma'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: const Text(
                                    'Width',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                        fontFamily: 'tahoma'),
                                  ),
                                ),
                                Container(
                                  child: const Text(
                                    '60 Cm',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                        fontFamily: 'tahoma'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: const Text(
                                    'Height',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                        fontFamily: 'tahoma'),
                                  ),
                                ),
                                Container(
                                  child: const Text(
                                    '60 Cm',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                        fontFamily: 'tahoma'),
                                  ),
                                ),
                              ],
                            ),
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
                              children: [
                                Container(
                                  child: const Text(
                                    'Updated Date',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontFamily: 'tahoma'),
                                  ),
                                ),
                                Container(
                                  child: const Text(
                                    '14-Okt-2022',
                                    style: TextStyle(
                                        fontSize: 16,
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
