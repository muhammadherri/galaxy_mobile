// ignore_for_file: avoid_unnecessary_containers, unnecessary_new, non_constant_identifier_names, prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, empty_statements, unused_import, unnecessary_string_interpolations, dead_code, avoid_print, use_build_context_synchronously, depend_on_referenced_packages, unused_local_variable, void_checks, prefer_is_empty, prefer_typing_uninitialized_variables
import 'dart:convert';
import 'package:bm_mobile/helper/database_helper.dart';
import 'package:bm_mobile/model/product_model.dart';
import 'package:bm_mobile/screens/home/menu/notification.dart';
import 'package:bm_mobile/screens/home/menu/receipt/receipt.dart';
import 'package:bm_mobile/screens/home/menu/transfer/transfer.dart';
import 'package:bm_mobile/screens/login/BMDialog.dart';
import 'package:bm_mobile/screens/login/BMSignIn.dart';
import 'package:bm_mobile/services/api_service.dart';
import 'package:bm_mobile/settings/AppConstant.dart';
import 'package:bm_mobile/settings/AppWidget.dart';
import 'package:bm_mobile/utils/BMColors.dart';
import 'package:bm_mobile/utils/widgets/BMBottomBar.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:page_transition/page_transition.dart';
import 'allocation/allocation.dart';
import 'company/company.dart';
import 'delivery/delivery.dart';
import 'jobs/jobs.dart';
import 'more.dart';
import 'dashboard.dart';
import 'namedicon.dart';
import 'output/output.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String myemail = "";
  String fullname = "";
  String toktoken = "";
  String userID = "";
  String imageAvatar = "";
  String last_update = '';
  bool progress_sync = false;
  // String fullname =getStringAsync("fullname");
  @override
  void initState() {
    super.initState();
    _loadCounter();
    getDataVendor();
  }

  Future<void> init() async {
    changeStatusColor(appColorPrimary);
  }

  Future _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      myemail = (prefs.getString('email') ?? '');
      userID = (prefs.getString('userid') ?? '');
      fullname = (prefs.getString('names') ?? '');
      toktoken = (prefs.getString('token') ?? '');
      imageAvatar = (prefs.getString('image') ?? '');
    });

    if (toktoken == '') {
      Fluttertoast.showToast(
          msg: 'Login Error',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white);
      Navigator.push(
        context,
        PageTransition(type: PageTransitionType.rightToLeft, child: BMSignIn()),
      );
    } else {}
  }

  Future getDataVendor() async {
    final response = await http.get(Uri.parse("$base_api/vendor"), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    });
    var data = jsonDecode(response.body.toString());
    var names = data['data']['vendor'];
    return names;
    print('$names');
  }

  getData() async {
    DatabaseHelper dbHelper = DatabaseHelper.instance;
    Database db = await dbHelper.database;
    setState(() {
      progress_sync = true;
    });
    // apiSyncProduct(toktoken, last_update, dbHelper);
    try {
      // download
      final responseallocation =
          await http.get(Uri.parse("$base_api/allocation"));
      print(responseallocation.statusCode == 200);
      var data = jsonDecode(responseallocation.body.toString());
      if (responseallocation.statusCode == 200) {
        final res = json.decode(responseallocation.body);
        print(res);
        for (int i = 0; i < res.length; i++) {
          print(res[i]);
          ProductModel datum = ProductModel.fromDb(res[i]);
          final data = await db.rawQuery(
              "SELECT product_id FROM product WHERE product_id = ? ",
              [datum.product_id]);
          print(data);
          if (data.length > 0) {
            dbHelper.update(datum.tableName, 'product_id', datum.toMap());
          } else {
            dbHelper.insert(datum.tableName, datum.toMap());
          }
        }
        Fluttertoast.showToast(
            msg: 'Data was Downloaded',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Color(0xff40963b),
            textColor: Colors.white);
        Navigator.pop(
          context,
        );
      } else {
        throw (responseallocation.body);
      }
      // download
    } catch (e) {
      print(e);
      Fluttertoast.showToast(
          msg: 'Connection Failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white);
      Navigator.pop(
        context,
      );
      Exception(e);
    }
  }

  apiSyncProduction() async {
    print('masuk');
    DatabaseHelper dbHelper = DatabaseHelper.instance;
    Database db = await dbHelper.database;
    var respon;
    print(respon);
    try {
      final data = await db.rawQuery("SELECT * FROM trxphinventory");
      if (data.length > 0) {
        for (int i = 0; i < data.length; i++) {
          ProductModel datum = ProductModel.fromDb(data[i]);
          final resPost = await http.post(
              Uri.parse('$base_api/allocation/sync'),
              body: {'data': json.encode(datum.toMap())});
          print(resPost.body);
          setState(() {
            respon = jsonDecode(resPost.body);
          });
        }
        var tes = respon['status'];
        if (tes == 'success') {
          print('sukses');
          await db.rawQuery("DELETE FROM trxphinventory");
          Fluttertoast.showToast(
              msg: 'Upload Success',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Color(0xff40963b),
              textColor: Colors.white);
        } else {
          print('fail');
          Fluttertoast.showToast(
              msg: 'Upload Fail',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white);
        }
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  // String fullname = getStringAsync("personalname");
  top(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
                color: Color(0xff40963b),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(imageAvatar),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Hi,',
                          style: TextStyle(
                              color: Color.fromARGB(255, 250, 249, 249),
                              fontSize: 16,
                              fontFamily: 'bold'),
                        ),
                        SizedBox(
                          width: 100,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  fullname,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 250, 249, 249),
                                      fontSize: 16,
                                      fontFamily: 'bold'),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Material(
                      type: MaterialType.transparency,
                      child: Ink(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.white),
                          color: const Color(0xff40963b),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10.0),
                          onTap: () async {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) => SyncDialog(),
                            );
                            Database db =
                                await DatabaseHelper.instance.database;
                            final data = await db
                                .rawQuery("SELECT * FROM trxphinventory");
                            print(data);
                            apiSyncProduction();

                            await new Future.delayed(
                                const Duration(seconds: 2));
                            getData();

                            // Fluttertoast.showToast(
                            //     msg: 'Syncronize is Success',
                            //     toastLength: Toast.LENGTH_SHORT,
                            //     gravity: ToastGravity.BOTTOM,
                            //     timeInSecForIosWeb: 1,
                            //     backgroundColor: Color(0xff40963b),
                            //     textColor: Colors.white);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: const [
                                ImageIcon(
                                  AssetImage("assets/icons/sync.png"),
                                  color: Colors.white,
                                  size: 20,
                                ),
                                // Icon(
                                //   Icons.sync,
                                //   size: 20.0,
                                //   color: Colors.white,
                                // ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Tap to Sync',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'tahoma'),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: SizedBox(
                    // width: 400,
                    // height: 150,
                    child: Card(
                      elevation: 5,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SizedBox(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const <Widget>[
                                  SizedBox(
                                    child: Text(
                                      "Report Laba",
                                      style: TextStyle(
                                          color: Color(0xfffac219),
                                          fontSize: 16,
                                          fontFamily: 'bold'),
                                    ),
                                  ),
                                  SizedBox(
                                    child: Text(
                                      "2022",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                          fontFamily: 'tahoma'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    child: Text(
                                      "Rp 560.000.800",
                                      style: TextStyle(
                                          color: Color(0xff40963b),
                                          fontSize: 20,
                                          fontFamily: 'tahoma'),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    child: Text(
                                      "Rp 25.852",
                                      style: TextStyle(
                                          color: Color(0xfffac219),
                                          fontSize: 20,
                                          fontFamily: 'tahoma'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        child: const Icon(
                                          Icons.circle,
                                          size: 12,
                                          color:
                                              Color.fromARGB(255, 0, 142, 61),
                                        ),
                                        onTap: () {},
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const InkWell(
                                        child: Text(
                                          'Pendapatan',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 129, 127, 127),
                                            fontFamily: 'tahoma',
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        child: const Icon(
                                          Icons.circle,
                                          size: 12,
                                          color: Color(0xfffac219),
                                        ),
                                        onTap: () {},
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const InkWell(
                                        child: Text(
                                          'Pengeluaran',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 129, 127, 127),
                                            fontFamily: 'tahoma',
                                            fontSize: 12,
                                          ),
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
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.only(left: 16),
                          height: 64,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 251, 251),
                            borderRadius: BorderRadius.circular(20),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const <Widget>[
                                      Text(
                                        'Delivery',
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 129, 127, 127),
                                          fontSize: 14,
                                          fontFamily: 'tahoma',
                                        ),
                                      ),
                                      Text(
                                        'Delivery for...',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 129, 127, 127),
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
                            borderRadius: BorderRadius.circular(20),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const <Widget>[
                                      Text(
                                        'Receipt',
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 129, 127, 127),
                                          fontSize: 14,
                                          fontFamily: 'tahoma',
                                        ),
                                      ),
                                      Text(
                                        'Receipt for...',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 129, 127, 127),
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
                            borderRadius: BorderRadius.circular(20),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const <Widget>[
                                      Text(
                                        'Output',
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 129, 127, 127),
                                          fontSize: 14,
                                          fontFamily: 'tahoma',
                                        ),
                                      ),
                                      Text(
                                        'Output for...',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 129, 127, 127),
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
                            borderRadius: BorderRadius.circular(20),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const <Widget>[
                                      Text(
                                        'Allocation',
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 129, 127, 127),
                                          fontSize: 14,
                                          fontFamily: 'tahoma',
                                        ),
                                      ),
                                      Text(
                                        'Allocation for...',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 129, 127, 127),
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
                            borderRadius: BorderRadius.circular(20),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const <Widget>[
                                      Text(
                                        'Transfer',
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 129, 127, 127),
                                          fontSize: 14,
                                          fontFamily: 'tahoma',
                                        ),
                                      ),
                                      Text(
                                        'Transfer for...',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 129, 127, 127),
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
                            borderRadius: BorderRadius.circular(20),
                            // border:
                            //     Border.all(color: const Color(0xff40963b), width: 1),
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: const MoreClass()),
                              );
                            },
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  'assets/icons/more.png',
                                  height: 35,
                                  color: Color(0xff40963b),
                                  fit: BoxFit.contain,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const <Widget>[
                                      Text(
                                        'More',
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 129, 127, 127),
                                          fontSize: 14,
                                          fontFamily: 'tahoma',
                                        ),
                                      ),
                                      Text(
                                        'More menu...',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 129, 127, 127),
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
                ],
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.only(left: 10.0, right: 20),
              child: new GestureDetector(
                  child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        'Customer List',
                        style: TextStyle(
                          fontFamily: 'tahoma',
                          color: Color.fromARGB(255, 129, 127, 127),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // color: Colors.black,
                  child: FutureBuilder(
                    future: getDataVendor(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) ;
                      return snapshot.hasData
                          ? new CompanyList(
                              list: snapshot.data,
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    new LoadingBouncingLine.circle(
                                      borderColor: Color(0xff40963b),
                                      size: 40.0,
                                      backgroundColor: Color(0xff40963b),
                                      duration: Duration(milliseconds: 900),
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
                const SizedBox(
                  height: 50,
                )
              ]))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      builder: MaterialIndicatorDelegate(
        builder: (context, controller) {
          return Image.asset(
            'assets/images/logobuana.png',
            height: 25,
            fit: BoxFit.contain,
          );
        },
      ),
      onRefresh: _loadCounter,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: Color(0xff40963b),

            // Status bar brightness (optional)
            statusBarIconBrightness:
                Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xff40963b),
          leading: IconButton(
            icon: new Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          ),
          title: Row(
            children: const [
              Text(
                'Galaxy',
                style: TextStyle(
                    color: Colors.white, fontFamily: 'bold', fontSize: 26),
              ),
              Text(
                '4.0',
                style: TextStyle(
                    color: Colors.white, fontFamily: 'bold', fontSize: 16),
              ),
            ],
          ),
          actions: [
            NamedIcon(
              iconData: Icons.notifications_outlined,
              notificationCount: 99,
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: const NotificationClass()),
                );
              },
              text: '',
            ),
          ],
          elevation: 0,
        ),
        body: Container(
            color: const Color.fromARGB(255, 238, 238, 238),
            child: ListView(
              children: [
                Stack(
                  children: [
                    top(context),
                  ],
                )
              ],
            )),
        drawer: Drawer(
            child: ListView(padding: EdgeInsets.zero, children: [
          SizedBox(
            height: 100,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff40963b),
              ),
              child: Row(
                children: const [
                  Text(
                    'Galaxy',
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'bold', fontSize: 26),
                  ),
                  Text(
                    '4.0',
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'bold', fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: const Text('Calender'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(
            thickness: 2,
          )
        ])),
      ),
    );
  }
}
