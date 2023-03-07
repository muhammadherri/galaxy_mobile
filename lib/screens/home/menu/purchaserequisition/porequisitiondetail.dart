// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, no_logic_in_create_state, unnecessary_new, unnecessary_const, avoid_unnecessary_containers, unnecessary_this, sized_box_for_whitespace, empty_statements, unnecessary_string_interpolations, prefer_const_constructors, dead_code, avoid_print, unused_local_variable, use_build_context_synchronously, unrelated_type_equality_checks, depend_on_referenced_packages, unused_field, unnecessary_null_comparison, avoid_web_libraries_in_flutter, unused_import

import 'dart:convert';
import 'package:bm_mobile/screens/home/menu/purchaserequisition/poreqList.dart';
import 'package:bm_mobile/screens/home/menu/purchaserequisition/porequisition.dart';
import 'package:bm_mobile/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_overlay_pro/animations/bouncing_line.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class PurchaseOrderRequisitionDetailClass extends StatefulWidget {
  final request;
  const PurchaseOrderRequisitionDetailClass({super.key, this.request});

  @override
  State<PurchaseOrderRequisitionDetailClass> createState() =>
      _PurchaseOrderRequisitionDetailClassState(
        id: this.request['id'].toString(),
        pr_number: this.request['pr_number'].toString(),
        user: this.request['user'].toString(),
        status: this.request['status'].toString(),
        created_at: this.request['created_at'].toString(),
        action: this.request['action'].toString(),
        intattribute1: this.request['intattribute1'].toString(),
        created_by: this.request['created_by'].toString(),
        app_lvl: this.request['app_lvl'].toString(),
      );
}

class _PurchaseOrderRequisitionDetailClassState
    extends State<PurchaseOrderRequisitionDetailClass> {
  String? image;
  late String id;
  late String pr_number;
  late String user;
  late String status;
  late String created_at;
  late String action;
  late String intattribute1;
  late String created_by;
  late String app_lvl;

  _PurchaseOrderRequisitionDetailClassState({
    required this.id,
    required this.pr_number,
    required this.user,
    required this.status,
    required this.created_at,
    required this.action,
    required this.intattribute1,
    required this.created_by,
    required this.app_lvl,
  });
  TextEditingController notedcontroller = TextEditingController();
  String toktoken = '';
  String userlevel = '';

  Future<void> getCameraImageGallery() async {
    XFile? imageFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (imageFile == null) {
      return;
    }
    final tempDir = await getTemporaryDirectory();
    var path = tempDir.path;

    String fileName =
        imageFile == null ? 'Kosong' : imageFile.path.split('/poreq').last;
    setState(() {
      image = fileName;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      toktoken = (prefs.getString('token') ?? '');
      userlevel = (prefs.getString('userstatuses') ?? '');
    });
  }

  Future getDataPORequisitionDetail() async {
    final response = await http
        .get(Uri.parse("$base_api/purchaserequisition/$id"), headers: {
      // "Content-Type": "application/json",
      "Accept": "application/json",
    });
    var data = jsonDecode(response.body.toString());
    var names = data['data']['porequisationDetail'];
    return names;
  }

  Future poreqApproval() async {
    try {
      String note = notedcontroller.text;
      print(note);
      if (note == '') {
        Fluttertoast.showToast(
            msg: 'Note is required',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white);
      } else {
        http.Response pre =
            await http.post(Uri.parse('$base_api/app/$id'), body: {
          'authorized_status': '2', //status
          'app_lvl_id': app_lvl, //app_lvl +
          'api_token': toktoken, //token
          'comments': note, //comment
        });
        var data = json.decode(pre.body.toString());
        print(data);
        Fluttertoast.showToast(
            msg: 'Approve Successfully',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Color(0xff40963b),
            textColor: Colors.white);
        Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.rightToLeft,
              child: PurchaseOrderRequisitionClass()),
        );
      }
    } catch (e) {
      print(e);
      Exception(e);
    }
  }

  Future poreqRejected() async {
    String note = notedcontroller.text;
    print(note);
    if (note == '') {
      Fluttertoast.showToast(
          msg: 'Note is required',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white);
    } else {
      http.Response pre =
          await http.post(Uri.parse('$base_api/rjc/$id'), body: {
        'authorized_status': '13', //status
        'app_lvl_id': app_lvl, //app_lvl +
        'api_token': toktoken, //token
        'comments': note, //comment
      });
      var data = json.decode(pre.body.toString());
      print(data);
      Fluttertoast.showToast(
          msg: 'Rejected Successfully',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xff40963b),
          textColor: Colors.white);
      Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.rightToLeft,
            child: PurchaseOrderRequisitionClass()),
      );
    }
  }

  Container porequisitiondetail(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8.0),
        child: new GestureDetector(
            child: Column(children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text(
                              'PT. BUANA MEGAH',
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff40963b),
                                  fontFamily: 'tahoma'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 15,
                        child: Text(
                          'Head Office',
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontFamily: 'tahoma'),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 180,
                        height: 15,
                        child: Text(
                          'Jl. Argopuro 42, Surabaya 60251, East Java, Indonesia',
                          style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xff40963b),
                              fontFamily: 'tahoma'),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 15,
                        child: Text(
                          'Pasuruan Office',
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontFamily: 'tahoma'),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 180,
                        height: 15,
                        child: Text(
                          'Jalan Raya Cangkringmalang km. 40, Beji Pasuruan 67154 East Java, Indonesia',
                          style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xff40963b),
                              fontFamily: 'tahoma'),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 15,
                        child: Text(
                          'Tel.',
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontFamily: 'tahoma'),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 15,
                        child: Text(
                          '656288, 656289',
                          style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xff40963b),
                              fontFamily: 'tahoma'),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 15,
                        child: Text(
                          'Fax.',
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontFamily: 'tahoma'),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 15,
                        child: Text(
                          '655054',
                          style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xff40963b),
                              fontFamily: 'tahoma'),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Color(0xff40963b),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Number',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontFamily: 'tahoma'),
                            ),
                            Text(
                              pr_number,
                              style: const TextStyle(
                                  color: Color(0xff40963b),
                                  fontSize: 14,
                                  fontFamily: 'tahoma'),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Creation Date',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontFamily: 'tahoma'),
                            ),
                            Text(
                              created_at,
                              style: const TextStyle(
                                  color: Color(0xff40963b),
                                  fontSize: 14,
                                  fontFamily: 'tahoma'),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Status',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontFamily: 'tahoma'),
                            ),
                            Text(
                              status == '2'
                                  ? 'Approved'
                                  : status == '13'
                                      ? 'Rejected'
                                      : "Open",
                              style: const TextStyle(
                                  color: Color(0xff40963b),
                                  fontSize: 14,
                                  fontFamily: 'tahoma'),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Requested By',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontFamily: 'tahoma'),
                            ),
                            Text(
                              user,
                              style: const TextStyle(
                                  color: Color(0xff40963b),
                                  fontSize: 14,
                                  fontFamily: 'tahoma'),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 1,
                          color: Color(0xff40963b),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              'Lines',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontFamily: 'tahoma'),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 200,
                          child: FutureBuilder(
                            future: getDataPORequisitionDetail(),
                            builder: (context, snapshot) {
                              return snapshot.hasData
                                  ? new PurchaseOrderReqItemList(
                                      list: snapshot.data,
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            new LoadingBouncingLine.circle(
                                              borderColor: Color(0xff40963b),
                                              size: 40.0,
                                              backgroundColor:
                                                  Color(0xff40963b),
                                              duration:
                                                  Duration(milliseconds: 900),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "LOADING",
                                          style: TextStyle(
                                              fontFamily: 'tahoma',
                                              fontSize: 12,
                                              color: Colors.grey),
                                        ),
                                      ],
                                    );
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              'Notes',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontFamily: 'tahoma'),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: notedcontroller,
                          maxLines: 3,
                          decoration: new InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.green, width: 2.0),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0),
                                borderRadius: BorderRadius.circular(10)),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.teal,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Material(
                    type: MaterialType.transparency,
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        border: Border.all(width: 1, color: Colors.white),
                        color: const Color(0xff40963b),
                      ),
                      child: InkWell(
                        onTap: (() {
                          getCameraImageGallery();
                        }),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                'ADD SIGNATURE',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'bold'),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ])));
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
          'Purchase Requisition Detail',
          style: TextStyle(fontSize: 20, fontFamily: 'bold'),
        ),
      ),
      body: Container(
          color: const Color.fromARGB(255, 238, 238, 238),
          child: ListView(
            children: [
              Stack(
                children: [
                  porequisitiondetail(context),
                ],
              )
            ],
          )),
      bottomNavigationBar: userlevel == '1' && app_lvl == '1'
          ? BottomAppBar(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 20,
                          offset: const Offset(0, 3))
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: [
                          Container(
                            // color: Color.fromRGBO(250, 194, 25, 1),
                            width: 180,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(250, 194, 25, 1),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    topLeft: Radius.circular(10))),
                            child: TextButton(
                              onPressed: () async {
                                poreqRejected();
                              },
                              child: Text(
                                'Reject',
                                style: TextStyle(
                                    fontFamily: 'tahoma',
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            width: 180,
                            // color: Color(0xff40963b),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            child: TextButton(
                              onPressed: () {
                                poreqApproval();
                              },
                              child: Text(
                                'APPROVE',
                                style: TextStyle(
                                    fontFamily: 'tahoma',
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          : userlevel == '2' && app_lvl == '2'
              ? BottomAppBar(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 20,
                              offset: const Offset(0, 3))
                        ],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: [
                              Container(
                                // color: Color.fromRGBO(250, 194, 25, 1),
                                width: 180,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(250, 194, 25, 1),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        topLeft: Radius.circular(10))),
                                child: TextButton(
                                  onPressed: () async {
                                    poreqRejected();
                                  },
                                  child: Text(
                                    'Reject',
                                    style: TextStyle(
                                        fontFamily: 'tahoma',
                                        fontSize: 16,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              Container(
                                width: 180,
                                // color: Color(0xff40963b),
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                        topRight: Radius.circular(10))),
                                child: TextButton(
                                  onPressed: () {
                                    poreqApproval();
                                  },
                                  child: Text(
                                    'APPROVE',
                                    style: TextStyle(
                                        fontFamily: 'tahoma',
                                        fontSize: 16,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : userlevel == '3' && app_lvl == '3'
                  ? BottomAppBar(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 5,
                                  blurRadius: 20,
                                  offset: const Offset(0, 3))
                            ],
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                children: [
                                  Container(
                                    // color: Color.fromRGBO(250, 194, 25, 1),
                                    width: 180,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(250, 194, 25, 1),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            topLeft: Radius.circular(10))),
                                    child: TextButton(
                                      onPressed: () async {
                                        poreqRejected();
                                      },
                                      child: Text(
                                        'Reject',
                                        style: TextStyle(
                                            fontFamily: 'tahoma',
                                            fontSize: 16,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 180,
                                    // color: Color(0xff40963b),
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(10),
                                            topRight: Radius.circular(10))),
                                    child: TextButton(
                                      onPressed: () {
                                        poreqApproval();
                                      },
                                      child: Text(
                                        'APPROVE',
                                        style: TextStyle(
                                            fontFamily: 'tahoma',
                                            fontSize: 16,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : BottomAppBar(),
    );
  }
}
