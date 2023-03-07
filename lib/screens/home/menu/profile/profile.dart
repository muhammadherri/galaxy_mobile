// ignore_for_file: avoid_unnecessary_containers, unnecessary_string_interpolations, use_build_context_synchronously, prefer_const_constructors, unused_local_variable, non_constant_identifier_names, prefer_interpolation_to_compose_strings, deprecated_member_use, unnecessary_new, unused_element, unused_field, depend_on_referenced_packages, unused_import, duplicate_ignore

// ignore: unused_import
import 'package:bm_mobile/helper/database_helper.dart';
import 'package:bm_mobile/screens/login/BMSignIn.dart';
import 'package:bm_mobile/services/api_service.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqlite_api.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final String lat = "37.3230";
  final String lng = "-122.0312";
  String myemail = "";
  String fullname = "";
  String usermanager = "";
  String toktoken = "";
  String userID = '';
  String imageAvatar = "";
  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  final Uri _url = Uri.parse('https://flutter.dev');

  Future _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      myemail = (prefs.getString('email') ?? '');
      fullname = (prefs.getString('names') ?? '');
      usermanager = (prefs.getString('usrmng') ?? '');
      imageAvatar = (prefs.getString('image') ?? '');
      toktoken = (prefs.getString('token') ?? '');
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
    }
  }

  Future logout() async {
    try {
      http.Response res = await http.post(
        Uri.parse("$base_api/logout"),
        headers: {
          "Accept": "application/json",
          "apitoken": '$toktoken',
        },
      );
    } catch (e) {
      Exception(e);
    }
  }

  _clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String firstappinstalled = '';
    firstappinstalled = (prefs.getString('app') ?? '');
    setState(() {
      myemail = '';
      fullname = '';
      usermanager = '';
      toktoken = '';
      userID = '';
      // print(image);
    });
    prefs.setString('email', myemail);
    prefs.setString('names', fullname);
    prefs.setString('usrmng', usermanager);
    prefs.setString('token', toktoken);
    prefs.setString('userid', userID);

    // Database db = await DatabaseHelper.instance.database;

    Fluttertoast.showToast(
        msg: 'Logout Successfully',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.orange,
        textColor: Colors.white);
    Navigator.push(
      context,
      PageTransition(type: PageTransitionType.rightToLeft, child: BMSignIn()),
    );
  }

  Container topprofile(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        color: Color(0xff40963b),
        // image: DecorationImage(
        //   fit: BoxFit.cover,
        //   image: AssetImage("assets/images/bm.jpg"),
        // ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          // bottomRight: Radius.circular(30),
        ),
      ),
    );
  }

  Container user(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Material(
                  type: MaterialType.transparency,
                  child: SizedBox(
                    width: 90,
                    height: 20,
                    child: Ink(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        onTap: () {},
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '$usermanager' == '0'
                                    ? 'Admin'
                                    : '$usermanager' == '1'
                                        ? 'Super Admin'
                                        : '$usermanager' == '15'
                                            ? 'Super User'
                                            : 'User',
                                style: const TextStyle(
                                    color: Color(0xff40963b),
                                    fontSize: 14,
                                    fontFamily: 'tahoma'),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 50,
                margin: const EdgeInsets.only(bottom: 40),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(imageAvatar),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '$fullname',
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: 'bold'),
                        ),
                        const SizedBox(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 0.0),
                            child: Text('PT.BUANA MEGAH',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontFamily: 'tahoma')),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            list(context),
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

  Container list(BuildContext context) {
    return Container(
      child: Card(
        margin: const EdgeInsets.all(12),
        elevation: 5,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 0.3, color: Colors.grey))),
                child: InkWell(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Text(
                          "Account Setting",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontFamily: 'tahoma'),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 16,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 0.5, color: Colors.grey))),
                child: InkWell(
                  onTap: () async {},
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const <Widget>[
                              Text(
                                "Chat With Admin",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontFamily: 'tahoma'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const <Widget>[
                              Text(
                                "Whatsapp",
                                style: TextStyle(
                                    color: Color(0xff40963b),
                                    fontSize: 12,
                                    fontFamily: 'tahoma'),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                                size: 16,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 0.3, color: Colors.grey))),
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Text(
                          "Information",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontFamily: 'tahoma'),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 16,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 0.5, color: Colors.grey))),
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Text(
                          "Help",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontFamily: 'tahoma'),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 16,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                onTap: () async {
                  logout();
                  await new Future.delayed(const Duration(seconds: 2));
                  _clear();
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      const Text(
                        "Logout",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontFamily: 'tahoma'),
                      ),
                      const ImageIcon(
                        AssetImage("assets/icons/logout.png"),
                        color: Colors.grey,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text(
              'Profile',
              style: TextStyle(fontSize: 20, fontFamily: 'bold'),
            ),
            backgroundColor: const Color(0xff40963b),
            elevation: 0,
          ),
          body: Container(
              color: const Color.fromARGB(255, 238, 238, 238),
              child: ListView(
                children: [
                  Stack(
                    children: [
                      topprofile(context),
                      user(context),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
