// ignore_for_file: sort_child_properties_last, avoid_print, unused_local_variable, prefer_const_constructors, depend_on_referenced_packages, file_names, use_key_in_widget_constructors, unused_catch_clause, prefer_if_null_operators, use_build_context_synchronously, duplicate_ignore, unnecessary_string_interpolations
import 'dart:async';
import 'dart:convert';
import 'package:bm_mobile/helper/database_helper.dart';
import 'package:bm_mobile/screens/home/menu/bottom.dart';
import 'package:bm_mobile/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:bm_mobile/settings/AppWidget.dart';
import 'package:bm_mobile/utils/BMColors.dart';
import 'package:bm_mobile/utils/BMImages.dart';
import 'package:bm_mobile/utils/BMStrings.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqlite_api.dart';
import '../../../main.dart';
import 'BMDialog.dart';

class BMSignIn extends StatefulWidget {
  static String tag = '/BMSignIn';
  @override
  BMSignInState createState() => BMSignInState();
}

class BMSignInState extends State<BMSignIn> {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String fullname = '';
  String myemail = '';
  String usermanager = '';
  String tiktoken = '';
  String userID = '';
  String firstappinstalled = '';
  // String imagePf = '';
  String userstatus = '';
// Login method
  Future<void> login(String username, password) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => LoginDialog(),
    );
    try {
      http.Response res = await http.post(
        Uri.parse("$base_api/login"),
        body: {'username': username, 'password': password},
      );
      print(res.statusCode);
      if (res.statusCode == 200) {
        Map<String, dynamic> map = json.decode(res.body);
        Map<String, dynamic> userdata = map['data']['user'];
        var data = json.decode(res.body.toString());
        print(data);
        var names = data['data']['user']['name'];
        var email = data['data']['user']['email'];
        var usrmng = data['data']['user']['user_manager'];
        var userid = data['data']['user']['userID'];
        // var image = data['data']['users_detail']['path'];
        var token = data['data']['access_token'];
        var userstatuses = data['data']['user']['user_status'] == null
            ? '10'
            : data['data']['user']['user_status'];
        // print(image);

        // ignore: prefer_conditional_assignment
        // if (image == null) {
        //   image = "assets/icons/userdas.png";
        // }

        // await setValue("personal_names", names);
        // await setValue("personal_mails", email);
        // await setValue("personal_department", department);
        // await setValue("profil_pic", '$base_pic/$path');
        // await setValue("token", token);
        print("Login Successfully");
        SharedPreferences prefs = await SharedPreferences.getInstance();
        setState(() {
          myemail = email;
          fullname = names;
          usermanager = usrmng;
          tiktoken = token;
          userID = userid;
          firstappinstalled = '1';
          // imagePf = image;
          userstatus = userstatuses;
          // print(image);
        });
        prefs.setString('email', myemail);
        prefs.setString('names', fullname);
        prefs.setString('usrmng', usermanager);
        prefs.setString('token', tiktoken);
        prefs.setString('userid', userID);
        prefs.setString('app', firstappinstalled);
        // prefs.setString('image', '$base_pic/$imagePf');
        prefs.setString('userstatuses', userstatus);

        Database db = await DatabaseHelper.instance.database;
        await db.rawQuery("DROP TABLE product");
        await Future.delayed(const Duration(seconds: 2));
        await db.rawQuery("DROP TABLE trxphinventory");
        await Future.delayed(const Duration(seconds: 2));
        await db.execute("CREATE TABLE product("
            "product_id TEXT PRIMARY KEY,"
            "item_code TEXT,"
            "product_code TEXT,"
            "location TEXT,"
            "warehouse TEXT,"
            "product_qty TEXT,"
            "product_gsm TEXT,"
            "product_width TEXT,"
            "updated_by TEXT,"
            "updated_at TEXT"
            ")");
        await db.execute("CREATE TABLE trxphinventory("
            "id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
            "product_id TEXT,"
            "item_code TEXT,"
            "product_code TEXT,"
            "location TEXT,"
            "warehouse TEXT,"
            "product_qty TEXT,"
            "product_gsm TEXT,"
            "product_width TEXT,"
            "status_trx TEXT,"
            "updated_by TEXT,"
            "updated_at TEXT"
            ")");

        await Future.delayed(const Duration(seconds: 1));

        Navigator.pop(
          context,
        );
        Fluttertoast.showToast(
            msg: 'Login Successfully',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Color(0xff40963b),
            textColor: Colors.white);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Bottomnavbar()),
        );
      } else {
        Fluttertoast.showToast(
            msg: 'Wrong Email or Password',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.redAccent,
            textColor: Colors.white);
        Navigator.pop(
          context,
        );
        print("Unauthorized");
      }
    } catch (e) {
      print(e);
      Exception(e);
    }
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print('Couldn\'t check connectivity status');
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
      if (_connectionStatus == ConnectivityResult.wifi) {
        Fluttertoast.showToast(
            msg: 'Connect Wifi',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white);
      } else if (_connectionStatus == ConnectivityResult.mobile) {
        Fluttertoast.showToast(
            msg: 'Connect Via Mobile',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.redAccent,
            textColor: Colors.white);
      } else {
        Fluttertoast.showToast(
            msg: 'Offline',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.redAccent,
            textColor: Colors.white);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    init();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> init() async {
    changeStatusColor(appColorPrimary);
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(t5White);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    changeStatusColor(appStore.appBarColor!);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(loglogin, width: width / 2.5, height: width / 2.5),
              // text(bm_judul,
              //     textColor: appStore.textPrimaryColor,
              //     fontFamily: fontBold,
              //     fontSize: 22.0),
              Container(
                margin: const EdgeInsets.all(24),
                decoration: boxDecoration(
                    bgColor: Color.fromARGB(255, 243, 249, 243),
                    showShadow: true,
                    radius: 4),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    const SizedBox(height: 10),
                    AppTextField(
                      textFieldType: TextFieldType.EMAIL,
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: bm_username,
                        labelStyle: secondaryTextStyle(size: 16),
                        prefixIcon: Icon(Icons.email_outlined,
                            color: appStore.isDarkModeOn ? white : black),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: appStore.isDarkModeOn ? white : black),
                        ),
                      ),
                    ),
                    16.height,
                    AppTextField(
                      textFieldType: TextFieldType.PASSWORD,
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: bm_password,
                        labelStyle: secondaryTextStyle(size: 16),
                        prefixIcon: Icon(Icons.lock_outline,
                            color: appStore.isDarkModeOn ? white : black),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: appStore.isDarkModeOn ? white : black),
                        ),
                      ),
                    ),
                    16.height,
                    GestureDetector(
                      onTap: () {
                        toasty(context, bm_forgot);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, right: 10),
                        child: Text(
                          bm_forgot,
                          style: TextStyle(
                              color: Color(0xff40963b),
                              fontSize: 16,
                              fontFamily: 'bold'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              login(usernameController.text.toString(),
                                  passwordController.text.toString());
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 16),
                              alignment: Alignment.center,
                              height: width / 8,
                              child: Text(
                                bm_sign_in,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: 'bold'),
                              ),
                              decoration: boxDecoration(
                                  bgColor: appColorPrimary, radius: 8),
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    CustomDialog(),
                              );
                            },
                            child: SvgPicture.asset(bm_img_fingerprint,
                                width: width / 8.2, color: t5ViewColor))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
