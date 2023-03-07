// ignore_for_file: implementation_imports, avoid_unnecessary_containers, sort_child_properties_last, prefer_typing_uninitialized_variables, non_constant_identifier_names
import 'package:flutter/material.dart';

class CompanyDetailClass extends StatefulWidget {
  final request;
  const CompanyDetailClass({super.key, this.request});

  @override
  // ignore: no_logic_in_create_state
  State<CompanyDetailClass> createState() => _CompanyDetailClassState(
        id: request['id'].toString(),
        vendor_name: request['vendor_name'].toString(),
        email: request['email'].toString(),
        address1: request['address1'].toString(),
        city: request['city'].toString(),
        province: request['province'].toString(),
        country: request['country'].toString(),
      );
}

class _CompanyDetailClassState extends State<CompanyDetailClass> {
  late String id;
  late String vendor_name;
  late String email;
  late String address1;
  late String city;
  late String province;
  late String country;

  _CompanyDetailClassState({
    required this.id,
    required this.vendor_name,
    required this.email,
    required this.address1,
    required this.city,
    required this.province,
    required this.country,
  });
  Container pictureVendor(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.asset(
                "assets/images/bm.jpg",
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 10,
              margin: const EdgeInsets.all(10),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              margin: const EdgeInsets.all(12),
              elevation: 10,
              color: const Color(0xff40963b),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            'Company Detail',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'tahoma',
                                fontSize: 16),
                          )
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.white,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            'Vendor Name',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'tahoma',
                                fontSize: 14),
                          ),
                          Text(
                            vendor_name,
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'tahoma',
                                fontSize: 14),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            'Email',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'tahoma',
                                fontSize: 14),
                          ),
                          Text(
                            email,
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'tahoma',
                                fontSize: 14),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            'Country',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'tahoma',
                                fontSize: 14),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                country,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'tahoma',
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            'Address',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'tahoma',
                                fontSize: 14),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                province,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'tahoma',
                                    fontSize: 14),
                              ),
                              const Text(
                                "-",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'tahoma',
                                    fontSize: 14),
                              ),
                              Text(
                                city,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'tahoma',
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        // direction: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              address1,
                              overflow: TextOverflow.fade,
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'tahoma',
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Galaxy',
                style: TextStyle(
                    fontSize: 16, color: Colors.grey, fontFamily: 'tahoma')),
            const Text('Version: 1.0',
                style: TextStyle(
                    fontSize: 12, color: Colors.grey, fontFamily: 'tahoma')),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: const Color.fromARGB(255, 238, 238, 238),
          child: ListView(
            children: [
              Stack(
                children: [
                  pictureVendor(context),
                ],
              )
            ],
          )),
    );
  }
}
