// ignore_for_file: avoid_unnecessary_containers, unused_import, avoid_print, unnecessary_new, duplicate_ignore, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:page_transition/page_transition.dart';

import '../allocation/addalocation.dart';
import '../allocation/searchallocation.dart';
import '../delivery/delivery.dart';

class ReceiptClass extends StatefulWidget {
  const ReceiptClass({super.key});

  @override
  State<ReceiptClass> createState() => _ReceiptClassState();
}

class _ReceiptClassState extends State<ReceiptClass>
    with TickerProviderStateMixin {
  var renderOverlay = true;
  var visible = true;
  var switchLabelPosition = false;
  var extend = false;
  var mini = false;
  var rmicons = false;
  var customDialRoot = false;
  var closeManually = false;
  var useRAnimation = true;
  var isDialOpen = ValueNotifier<bool>(false);
  var speedDialDirection = SpeedDialDirection.up;
  var buttonSize = const Size(56.0, 56.0);
  var childrenButtonSize = const Size(56.0, 56.0);
  var selectedfABLocation = FloatingActionButtonLocation.endDocked;
  var items = [
    FloatingActionButtonLocation.startFloat,
    FloatingActionButtonLocation.startDocked,
    FloatingActionButtonLocation.centerFloat,
    FloatingActionButtonLocation.endFloat,
    FloatingActionButtonLocation.endDocked,
    FloatingActionButtonLocation.startTop,
    FloatingActionButtonLocation.centerTop,
    FloatingActionButtonLocation.endTop,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff40963b),
        title: const Text(
          'Receive',
          style: TextStyle(fontSize: 20, fontFamily: 'bold'),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: SpeedDial(
      //     icon: Icons.menu_open,
      //     activeIcon: Icons.close,
      //     spacing: 10,
      //     mini: mini,
      //     openCloseDial: isDialOpen,
      //     childPadding: const EdgeInsets.all(5),
      //     spaceBetweenChildren: 4,
      //     dialRoot: customDialRoot
      //         ? (ctx, open, toggleChildren) {
      //             return ElevatedButton(
      //               onPressed: toggleChildren,
      //               style: ElevatedButton.styleFrom(
      //                 backgroundColor: Colors.blue[900],
      //                 padding: const EdgeInsets.symmetric(
      //                     horizontal: 22, vertical: 18),
      //               ),
      //               child: const Text(
      //                 "Custom Dial Root",
      //                 style: TextStyle(fontSize: 17),
      //               ),
      //             );
      //           }
      //         : null,
      //     childrenButtonSize: childrenButtonSize,
      //     visible: visible,
      //     direction: speedDialDirection,
      //     switchLabelPosition: switchLabelPosition,
      //     closeManually: closeManually,
      //     renderOverlay: renderOverlay,
      //     onOpen: () => debugPrint('OPENING DIAL'),
      //     onClose: () => debugPrint('DIAL CLOSED'),
      //     useRotationAnimation: useRAnimation,
      //     backgroundColor: const Color(0xff40963b),
      //     tooltip: 'More Menu',
      //     heroTag: 'speed-dial-hero-tag',
      //     elevation: 80.0,
      //     animationCurve: Curves.elasticInOut,
      //     isOpenOnStart: false,
      //     shape: customDialRoot
      //         ? const RoundedRectangleBorder()
      //         : const StadiumBorder(),
      //     children: [
      //       SpeedDialChild(
      //         child: !rmicons
      //             ? const Icon(
      //                 Icons.circle_rounded,
      //                 color: Colors.white,
      //               )
      //             // Image.asset(
      //             //     'assets/icons/out.png',
      //             //     width: 25,
      //             //     color: Colors.white,
      //             //   )
      //             : null,
      //         backgroundColor: const Color(0xff40963b),
      //         foregroundColor: Colors.white,
      //         label: 'Customer Receive',
      //         labelStyle:
      //             const TextStyle(color: Colors.white, fontFamily: 'tahoma'),
      //         labelBackgroundColor: const Color(0xff40963b),
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             PageTransition(
      //                 type: PageTransitionType.rightToLeft,
      //                 child: const RcvCustomer()),
      //           );
      //         },
      //         onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
      //       ),
      //       SpeedDialChild(
      //         child: !rmicons
      //             ? const Icon(
      //                 Icons.circle_rounded,
      //                 color: Colors.white,
      //               )
      //             // Image.asset(
      //             //     'assets/icons/rcvsupplier.png',
      //             //     width: 25,
      //             //     color: Colors.white,
      //             //   )
      //             : null,
      //         backgroundColor: const Color(0xff40963b),
      //         foregroundColor: Colors.white,
      //         label: 'Supplier Receive',
      //         labelStyle:
      //             const TextStyle(color: Colors.white, fontFamily: 'tahoma'),
      //         labelBackgroundColor: const Color(0xff40963b),
      //         visible: true,
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             PageTransition(
      //                 type: PageTransitionType.rightToLeft,
      //                 child: const RcvSupplier()),
      //           );
      //         },
      //         onLongPress: () => debugPrint('THIRD CHILD LONG PRESS'),
      //       ),
      //       SpeedDialChild(
      //         child: !rmicons
      //             ? const Icon(
      //                 Icons.circle_rounded,
      //                 color: Colors.white,
      //               )
      //             // Image.asset(
      //             //     'assets/icons/rcvdirect.png',
      //             //     width: 25,
      //             //     color: Colors.white,
      //             //   )
      //             : null,
      //         backgroundColor: const Color(0xff40963b),
      //         foregroundColor: Colors.white,
      //         label: 'Supplier Direct',
      //         labelStyle:
      //             const TextStyle(color: Colors.white, fontFamily: 'tahoma'),
      //         labelBackgroundColor: const Color(0xff40963b),
      //         visible: true,
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             PageTransition(
      //                 type: PageTransitionType.rightToLeft,
      //                 child: const RcvDirect()),
      //           );
      //         },
      //         onLongPress: () => debugPrint('THIRD CHILD LONG PRESS'),
      //       ),
      //     ],
      //   ),
      // ),

      body: Container(
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return const ReceipList();
          },
        ),
      ),
    );
  }
}

class ReceipList extends StatelessWidget {
  const ReceipList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // ignore: duplicate_ignore
      itemBuilder: (context, i) {
        // ignore: unnecessary_new
        return new Container(
          color: const Color.fromARGB(255, 238, 238, 238),
          padding: const EdgeInsets.all(8.0),
          // ignore: unnecessary_new
          child: new GestureDetector(
            // ignore: unnecessary_new
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: const Text(
                                'Order No.',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontFamily: 'tahoma'),
                              ),
                            ),
                            Container(
                              child: const Text(
                                '20001212',
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
                                'GRN.',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff40963b),
                                    fontFamily: 'tahoma'),
                              ),
                            ),
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
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text('Item',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'tahoma')),
                                    Text('Qty',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'tahoma')),
                                    Text('Aju',
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
                                Text('OCC-VL',
                                    style: TextStyle(
                                        fontSize: 14, fontFamily: 'tahoma')),
                                Text('300.0',
                                    style: TextStyle(
                                        fontSize: 14, fontFamily: 'tahoma')),
                                Text('4302',
                                    style: TextStyle(
                                        fontSize: 14, fontFamily: 'tahoma')),
                              ],
                            ),

                            // Column(
                            //   children: const [
                            //     Text(
                            //       'Item',
                            //       style: TextStyle(
                            //           fontSize: 14, fontFamily: 'tahoma'),
                            //     ),
                            //     Text(
                            //       'Qty',
                            //       style: TextStyle(
                            //           fontSize: 14, fontFamily: 'tahoma'),
                            //     ),
                            //     Text(
                            //       'Aju',
                            //       style: TextStyle(
                            //           fontSize: 14, fontFamily: 'tahoma'),
                            //     ),
                            //   ],
                            // ),
                            // Column(
                            //   children: const [
                            //     Text(
                            //       'OCC-VL',
                            //       style: TextStyle(
                            //           fontSize: 14, fontFamily: 'tahoma'),
                            //     ),
                            //     Text(
                            //       '300.0',
                            //       style: TextStyle(
                            //           fontSize: 14, fontFamily: 'tahoma'),
                            //     ),
                            //     Text(
                            //       '4302',
                            //       style: TextStyle(
                            //           fontSize: 14, fontFamily: 'tahoma'),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              "Price",
                              style:
                                  TextStyle(fontSize: 16, fontFamily: 'tahoma'),
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
                          'Supplier',
                          style: TextStyle(fontSize: 14, fontFamily: 'tahoma'),
                        ),
                        Text(
                          'Ekman Recycling LTD',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'tahoma',
                              color: Color(0xff40963b)),
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
        );
      },
    );
  }
}
