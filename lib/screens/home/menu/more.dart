// ignore_for_file: prefer_const_constructors, unused_import
import 'package:bm_mobile/screens/home/menu/allocation/allocation.dart';
import 'package:bm_mobile/screens/home/menu/bottom.dart';
import 'package:bm_mobile/screens/home/menu/delivery/delivery.dart';
import 'package:bm_mobile/screens/home/menu/output/output.dart';
import 'package:bm_mobile/screens/home/menu/production/production.dart';
import 'package:bm_mobile/screens/home/menu/purchaseorder/purchaseorder.dart';
import 'package:bm_mobile/screens/home/menu/purchaserequisition/porequisition.dart';
import 'package:bm_mobile/screens/home/menu/receipt/receipt.dart';
import 'package:bm_mobile/screens/home/menu/search/search.dart';
import 'package:bm_mobile/screens/home/menu/tag/tag.dart';
import 'package:bm_mobile/screens/home/menu/transfer/transfer.dart';
import 'package:bm_mobile/screens/home/menu/users/users.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class MoreClass extends StatefulWidget {
  const MoreClass({super.key});

  @override
  State<MoreClass> createState() => _MoreClassState();
}

class _MoreClassState extends State<MoreClass> {
  Container menu(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.only(left: 16),
                    height: 64,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 251, 251),
                      borderRadius: BorderRadius.circular(12),
                      // border:
                      //     Border.all(color: const Color(0xff40963b), width: 1),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: const DeliveryClass()),
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/icons/delivery.png',
                            height: 35,
                            fit: BoxFit.contain,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Text(
                                  'Delivery',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 129, 127, 127),
                                    fontSize: 14,
                                    fontFamily: 'tahoma',
                                  ),
                                ),
                                Text(
                                  'Delivery for...',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 129, 127, 127),
                                      fontSize: 12,
                                      fontFamily: 'tahoma'),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.only(left: 16),
                    height: 64,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 251, 251),
                      borderRadius: BorderRadius.circular(12),
                      // border:
                      //     Border.all(color: const Color(0xff40963b), width: 1),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: const ReceiptClass()),
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/icons/receiptt.png',
                            height: 35,
                            fit: BoxFit.contain,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Text(
                                  'Receipt',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 129, 127, 127),
                                    fontSize: 14,
                                    fontFamily: 'tahoma',
                                  ),
                                ),
                                Text(
                                  'Receipt for...',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 129, 127, 127),
                                      fontSize: 12,
                                      fontFamily: 'tahoma'),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.only(left: 16),
                    height: 64,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 251, 251),
                      borderRadius: BorderRadius.circular(12),
                      // border:
                      //     Border.all(color: const Color(0xff40963b), width: 1),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: const OutputClass()),
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/icons/out.png',
                            height: 35,
                            fit: BoxFit.contain,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Text(
                                  'Output',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 129, 127, 127),
                                    fontSize: 14,
                                    fontFamily: 'tahoma',
                                  ),
                                ),
                                Text(
                                  'Output for...',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 129, 127, 127),
                                      fontSize: 12,
                                      fontFamily: 'tahoma'),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.only(left: 16),
                    height: 64,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 251, 251),
                      borderRadius: BorderRadius.circular(12),
                      // border:
                      //     Border.all(color: const Color(0xff40963b), width: 1),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: const AllocationClass()),
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/icons/allow.png',
                            height: 35,
                            fit: BoxFit.contain,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Text(
                                  'Allocation',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 129, 127, 127),
                                    fontSize: 14,
                                    fontFamily: 'tahoma',
                                  ),
                                ),
                                Text(
                                  'Allocation for...',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 129, 127, 127),
                                      fontSize: 12,
                                      fontFamily: 'tahoma'),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.only(left: 16),
                    height: 64,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 251, 251),
                      borderRadius: BorderRadius.circular(12),
                      // border:
                      //     Border.all(color: const Color(0xff40963b), width: 1),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: const TransferClass()),
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/icons/transfer.png',
                            height: 35,
                            fit: BoxFit.contain,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Text(
                                  'Transfer',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 129, 127, 127),
                                    fontSize: 14,
                                    fontFamily: 'tahoma',
                                  ),
                                ),
                                Text(
                                  'Transfer for...',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 129, 127, 127),
                                      fontSize: 12,
                                      fontFamily: 'tahoma'),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.only(left: 16),
                    height: 64,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 251, 251),
                      borderRadius: BorderRadius.circular(12),
                      // border:
                      //     Border.all(color: const Color(0xff40963b), width: 1),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: const TagClass()),
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/icons/tag.png',
                            height: 35,
                            fit: BoxFit.contain,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Text(
                                  'Tag',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 129, 127, 127),
                                    fontSize: 14,
                                    fontFamily: 'tahoma',
                                  ),
                                ),
                                Text(
                                  'More menu...',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 129, 127, 127),
                                      fontSize: 12,
                                      fontFamily: 'tahoma'),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.only(left: 16),
                    height: 64,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 251, 251),
                      borderRadius: BorderRadius.circular(12),
                      // border:
                      //     Border.all(color: const Color(0xff40963b), width: 1),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: const ProductionClass()),
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/icons/production.png',
                            height: 35,
                            fit: BoxFit.contain,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Text(
                                  'Production',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 129, 127, 127),
                                    fontSize: 14,
                                    fontFamily: 'tahoma',
                                  ),
                                ),
                                Text(
                                  'Production for...',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 129, 127, 127),
                                      fontSize: 12,
                                      fontFamily: 'tahoma'),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.only(left: 16),
                    height: 64,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 251, 251),
                      borderRadius: BorderRadius.circular(12),
                      // border:
                      //     Border.all(color: const Color(0xff40963b), width: 1),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: const SearchClass()),
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/icons/search.png',
                            height: 35,
                            fit: BoxFit.contain,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Text(
                                  'Search',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 129, 127, 127),
                                    fontSize: 14,
                                    fontFamily: 'tahoma',
                                  ),
                                ),
                                Text(
                                  'Search menu...',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 129, 127, 127),
                                      fontSize: 12,
                                      fontFamily: 'tahoma'),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.only(left: 16),
                    height: 64,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 251, 251),
                      borderRadius: BorderRadius.circular(12),
                      // border:
                      //     Border.all(color: const Color(0xff40963b), width: 1),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: const PurchaseOrderClass()),
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/icons/purchase.png',
                            height: 35,
                            fit: BoxFit.contain,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Text(
                                  'Purchase Order',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 129, 127, 127),
                                    fontSize: 14,
                                    fontFamily: 'tahoma',
                                  ),
                                ),
                                Text(
                                  'Purchasing for...',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 129, 127, 127),
                                      fontSize: 12,
                                      fontFamily: 'tahoma'),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.only(left: 16),
                    height: 64,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 251, 251),
                      borderRadius: BorderRadius.circular(12),
                      // border:
                      //     Border.all(color: const Color(0xff40963b), width: 1),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: const PurchaseOrderRequisitionClass()),
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/icons/poreq.png',
                            height: 35,
                            fit: BoxFit.contain,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Text(
                                  'Purchase Req',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 129, 127, 127),
                                    fontSize: 14,
                                    fontFamily: 'tahoma',
                                  ),
                                ),
                                Text(
                                  'Purchase...',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 129, 127, 127),
                                      fontSize: 12,
                                      fontFamily: 'tahoma'),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            // Row(
            //   children: <Widget>[
            //     Expanded(
            //       child: Container(
            //         margin: const EdgeInsets.only(right: 8),
            //         padding: const EdgeInsets.only(left: 16),
            //         height: 64,
            //         decoration: BoxDecoration(
            //           color: const Color.fromARGB(255, 255, 251, 251),
            //           borderRadius: BorderRadius.circular(12),
            //           // border:
            //           //     Border.all(color: const Color(0xff40963b), width: 1),
            //         ),
            //         child: InkWell(
            //           onTap: () {
            //             Navigator.push(
            //               context,
            //               PageTransition(
            //                   type: PageTransitionType.rightToLeft,
            //                   child: const PurchaseOrderClass()),
            //             );
            //           },
            //           child: Row(
            //             children: <Widget>[
            //               Image.asset(
            //                 'assets/icons/purchase.png',
            //                 height: 35,
            //                 fit: BoxFit.contain,
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.only(left: 16),
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   children: const <Widget>[
            //                     Text(
            //                       'Charts',
            //                       style: TextStyle(
            //                         color: Color.fromARGB(255, 129, 127, 127),
            //                         fontSize: 14,
            //                         fontFamily: 'tahoma',
            //                       ),
            //                     ),
            //                     Text(
            //                       'Chart List',
            //                       style: TextStyle(
            //                           color: Color.fromARGB(255, 129, 127, 127),
            //                           fontSize: 12,
            //                           fontFamily: 'tahoma'),
            //                     ),
            //                   ],
            //                 ),
            //               )
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //     Expanded(
            //       child: Container(
            //         margin: const EdgeInsets.only(right: 8),
            //         padding: const EdgeInsets.only(left: 16),
            //         height: 64,
            //         decoration: BoxDecoration(
            //           color: const Color.fromARGB(255, 255, 251, 251),
            //           borderRadius: BorderRadius.circular(12),
            //           // border:
            //           //     Border.all(color: const Color(0xff40963b), width: 1),
            //         ),
            //         child: InkWell(
            //           onTap: () {
            //             Navigator.push(
            //               context,
            //               PageTransition(
            //                   type: PageTransitionType.rightToLeft,
            //                   child: const UsersList()),
            //             );
            //           },
            //           child: Row(
            //             children: <Widget>[
            //               Image.asset(
            //                 'assets/icons/purchase.png',
            //                 height: 35,
            //                 fit: BoxFit.contain,
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.only(left: 16),
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   children: const <Widget>[
            //                     Text(
            //                       'Users',
            //                       style: TextStyle(
            //                         color: Color.fromARGB(255, 129, 127, 127),
            //                         fontSize: 14,
            //                         fontFamily: 'tahoma',
            //                       ),
            //                     ),
            //                     Text(
            //                       'Chart List',
            //                       style: TextStyle(
            //                           color: Color.fromARGB(255, 129, 127, 127),
            //                           fontSize: 12,
            //                           fontFamily: 'tahoma'),
            //                     ),
            //                   ],
            //                 ),
            //               )
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.rightToLeft, child: Bottomnavbar()),
            );
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xff40963b),
        title: const Text("Menu",
            style: TextStyle(fontSize: 20, fontFamily: 'bold')),
      ),
      body: Container(
        color: const Color.fromARGB(255, 238, 238, 238),
        child: ListView(
          children: [
            menu(context),
          ],
        ),
      ),
    );
  }
}
