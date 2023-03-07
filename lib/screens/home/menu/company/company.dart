// ignore_for_file: unnecessary_new, must_be_immutable, use_key_in_widget_constructors
import 'package:bm_mobile/screens/home/menu/company/companydetail.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class CompanyList extends StatefulWidget {
  List list;
  CompanyList({required this.list});
  @override
  State<CompanyList> createState() => _CompanyListState();
}

class _CompanyListState extends State<CompanyList> {
  @override
  void initState() {
    super.initState();
    autologout();
  }

  autologout() async {}
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: Expanded(
          child: ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: (context, i) {
          return new Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60))),
            child: new GestureDetector(
              child: InkWell(
                onTap: (() {
                  Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: CompanyDetailClass(
                          request: widget.list[i],
                        )),
                  );
                }),
                child: new Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: new Row(
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
                          child: Row(
                            children: <Widget>[
                              Image.asset(
                                'assets/icons/company.png',
                                height: 45,
                                fit: BoxFit.contain,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 200,
                                      height: 18,
                                      child: Text(
                                        widget.list[i]['vendor_name'],
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 129, 127, 127),
                                            fontSize: 14,
                                            fontFamily: 'tahoma'),
                                      ),
                                    ),
                                    Text(
                                      widget.list[i]['email'].toString() ==
                                              'null'
                                          ? 'Email is Empty'
                                          : widget.list[i]['email'],
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 129, 127, 127),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      )),
    );
  }
}
