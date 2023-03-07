// ignore_for_file: unnecessary_new, prefer_const_constructors, must_be_immutable, avoid_unnecessary_containers, empty_statements
import 'package:bm_mobile/screens/home/menu/purchaseorder/purchaseorderdetail.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class PurchaseOrderClass extends StatefulWidget {
  const PurchaseOrderClass({super.key});

  @override
  State<PurchaseOrderClass> createState() => _PurchaseOrderClassState();
}

class _PurchaseOrderClassState extends State<PurchaseOrderClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
    );
  }
}

class PurchaseOrderList extends StatelessWidget {
  List list;
  PurchaseOrderList({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
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
                      child: const PurchaseOrderDetailClass()),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              list[i]['order_number'],
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontFamily: 'tahoma'),
                            ),
                          ),
                          ButtonTheme(
                            minWidth: 88.0,
                            height: 5.0,
                            child: Text(
                              list[i]['status'],
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                list[i]['currency'],
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontFamily: 'tahoma'),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                'Customer Code',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontFamily: 'tahoma'),
                              ),
                              Text(
                                list[i]['vendor_id'],
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontFamily: 'tahoma'),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Customer Name",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontFamily: 'tahoma'),
                              ),
                              Text(
                                list[i]['vendor_name'],
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
                    const Divider(
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Rate Date',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'tahoma',
                                    color: Colors.grey),
                              ),
                              Text(
                                list[i]['rate_date'].toString(),
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'tahoma',
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Created at',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'tahoma',
                                    color: Colors.grey),
                              ),
                              Text(
                                list[i]['created_at'].toString(),
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'tahoma',
                                    color: Colors.grey),
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
                        children: [
                          Text(
                            list[i]['agent_id'].toString(),
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'tahoma',
                                color: Colors.grey),
                          ),
                          TextButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffea5455),
                              minimumSize: const Size(88, 20),
                              padding: const EdgeInsets.all(12.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 5,
                            ),
                            child: Container(
                              child: Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  const Text(
                                    'Delete',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'tahoma'),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                            ),
                            onPressed: () {},
                          )
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
