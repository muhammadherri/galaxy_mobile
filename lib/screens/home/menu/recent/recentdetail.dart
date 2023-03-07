// ignore_for_file: avoid_unnecessary_containers, unnecessary_new, sized_box_for_whitespace
import 'package:bm_mobile/screens/home/menu/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class RecentDetail extends StatefulWidget {
  const RecentDetail({super.key});

  @override
  State<RecentDetail> createState() => _RecentDetailState();
}

class _RecentDetailState extends State<RecentDetail> {
  Container detailinformation(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(8.0),
      child: new GestureDetector(
        child: Column(
          children: [
            new Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                child: const Icon(
                              Icons.info_outline_rounded,
                              color: Color.fromARGB(255, 255, 175, 2),
                            )),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              child: const Text(
                                'Information Detail',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontFamily: 'tahoma'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                height: 25,
                                width: 25,
                                child: const Icon(
                                  Icons.circle,
                                  size: 10,
                                  color: Color.fromARGB(255, 3, 125, 36),
                                )),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              child: const Text(
                                'Step 1',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    fontFamily: 'tahoma'),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                height: 25,
                                width: 25,
                                child: const Icon(
                                  Icons.circle,
                                  size: 10,
                                  color: Colors.white,
                                )),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              child: const Text(
                                'Date',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    fontFamily: 'tahoma'),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Image.asset(
                                'assets/icons/location.png',
                                height: 25,
                                color: const Color.fromARGB(255, 3, 125, 36),
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              child: const Text(
                                'Warehouse',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    fontFamily: 'tahoma'),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                child: const Icon(
                              Icons.location_on_outlined,
                              size: 25,
                              color: Colors.white,
                            )),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              child: const Text(
                                'Complete Address',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    fontFamily: 'tahoma'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            new Card(
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
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: const Dashboard()),
                              );
                            },
                            child: const Text(
                              'PT. Buana Megah',
                              style: TextStyle(
                                  color: Color(0xff40963b),
                                  fontSize: 16,
                                  fontFamily: 'tahoma'),
                            ),
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
                          'Total Amount',
                          style: TextStyle(fontSize: 14, fontFamily: 'tahoma'),
                        ),
                        Text(
                          'Total Number : Rp 32.000',
                          style: TextStyle(fontSize: 16, fontFamily: 'tahoma'),
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
                        Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text('Detail status and reason'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  )
                ],
              ),
            ),
            new Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: const Text(
                                'No Product',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontFamily: 'tahoma'),
                              ),
                            ),
                            Container(
                              child: const Text(
                                '3r72388273',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontFamily: 'tahoma'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: const Text(
                                'Booking Date',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontFamily: 'tahoma'),
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Text(
                                    '13-10-2022',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                        fontFamily: 'tahoma'),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '11:23',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                        fontFamily: 'tahoma'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: const Text(
                                'Delivery Date',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontFamily: 'tahoma'),
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Text(
                                    '13-10-2022',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                        fontFamily: 'tahoma'),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '12:23',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                        fontFamily: 'tahoma'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: const Text(
                                'Received Date',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontFamily: 'tahoma'),
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Text(
                                    '15-10-2022',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                        fontFamily: 'tahoma'),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '11:23',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff40963b),
        title: const Text(
          'Recent Detail',
          style: TextStyle(fontSize: 20, fontFamily: 'bold'),
        ),
      ),
      body: Container(
          color: const Color.fromARGB(255, 238, 238, 238),
          child: ListView(
            children: [
              Stack(
                children: [
                  detailinformation(context),
                ],
              )
            ],
          )),
    );
  }
}
