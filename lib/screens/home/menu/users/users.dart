// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors, unused_local_variable
import 'dart:convert';
import 'package:bm_mobile/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay_pro/animations/bouncing_line.dart';
import 'package:http/http.dart' as http;

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  List deliveryList = [];
  TextEditingController searchcontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    getDataDelivery();
  }
  Future getDataDelivery() async {
    var searchitemcode = searchcontroller.text;
    final response = await http.get(Uri.parse("$base_apitest/users"), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    });
    var data = jsonDecode(response.body.toString());
    var names = data['data']['users'];
    setState(() {
      deliveryList = names;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xff40963b),
        title: const Text(
          'Delivery',
          style: TextStyle(fontSize: 20, fontFamily: 'bold'),
        ),
      ),
      body: deliveryList.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const LoadingBouncingLine.circle(
                      borderColor: Color(0xff40963b),
                      size: 40.0,
                      backgroundColor: Color(0xff40963b),
                      duration: Duration(milliseconds: 900),
                    ),
                  ],
                ),
                const Text(
                  "LOADING",
                  style: TextStyle(
                      fontFamily: 'tahoma', fontSize: 12, color: Colors.grey),
                ),
              ],
            )
          : Container(
              color: const Color.fromARGB(255, 238, 238, 238),
              child: ListView.builder(
                  itemCount: deliveryList.length,
                  itemBuilder: (context, index) {
                    final p = deliveryList[index];
                    return Container(
                      color: const Color.fromARGB(255, 238, 238, 238),
                      padding:
                          const EdgeInsets.only(top: 5, right: 10, left: 10),
                      child: GestureDetector(
                        child: InkWell(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            p['name'].toString(),
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey,
                                                fontFamily: 'tahoma'),
                                          ),
                                        ],
                                      ),
                                      const Divider(
                                        thickness: 1,
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
                  })),
      floatingActionButton: Container(
          width: 400.0,
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Material(
            borderRadius: BorderRadius.circular(20),
            elevation: 20.0,
            shadowColor: Colors.grey,
            child: TextFormField(
              onChanged: (String value) async {
                getDataDelivery();
              },
              textAlign: TextAlign.start,
              controller: searchcontroller,
              autofocus: false,
              style: const TextStyle(
                  fontSize: 16.0,
                  color: Color(0xff40963b),
                  fontFamily: 'tahoma'),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    searchcontroller.clear();
                    getDataDelivery();
                  },
                  icon: const Icon(Icons.cancel),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search Item',
                hintStyle: const TextStyle(
                    fontSize: 16.0, color: Colors.grey, fontFamily: 'tahoma'),
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
