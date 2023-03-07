// ignore_for_file: avoid_unnecessary_containers, avoid_print, unnecessary_new, duplicate_ignore
import 'package:bm_mobile/helper/database_helper.dart';
import 'package:bm_mobile/screens/home/menu/output/outputadd.dart';
import 'package:bm_mobile/screens/home/menu/output/outputdetail.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sqflite/sqlite_api.dart';

class OutputClass extends StatefulWidget {
  const OutputClass({super.key});

  @override
  State<OutputClass> createState() => _OutputClassState();
}

class _OutputClassState extends State<OutputClass> {
   List transferList = [];
  TextEditingController searchcontroller = TextEditingController();

  transaction() async {
    Database db = await DatabaseHelper.instance.database;
    List<Map> trf =
        await db.rawQuery("SELECT * FROM trxphinventory ORDER BY id desc");
    print(trf);
    setState(() {
      transferList = trf;
    });
  }

  Future transfer() async {
    var searchresult = searchcontroller.text;
    print(searchresult);
    DatabaseHelper dbHelper = DatabaseHelper.instance;
    Database db = await dbHelper.database;

    if (searchresult == '') {
      final data =
          await db.rawQuery("SELECT * FROM trxphinventory ORDER BY id desc");
      print(data);
      setState(() {
        transferList = data;
      });
    } else {
      final data = await db.rawQuery("SELECT * FROM trxphinventory "
          "WHERE item_code LIKE '%$searchresult%'");
      print(data);
      setState(() {
        transferList = data;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    transfer();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff40963b),
        title: const Text(
          'Output',
          style: TextStyle(fontSize: 20, fontFamily: 'bold'),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          backgroundColor: const Color(0xff40963b),
          child: const Icon(Icons.add),
          onPressed: () async {
            Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: const OutputInputClass()),
            );
          },
        ),
      ),
      body: Container(
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return const OutputList();
          },
        ),
      ),
    );
  }
}

class OutputList extends StatelessWidget {
  const OutputList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, i) {
        // ignore: unnecessary_new
        return new Container(
          color: const Color.fromARGB(255, 238, 238, 238),
          padding: const EdgeInsets.all(8.0),
          // ignore: unnecessary_new
          child: new GestureDetector(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: const OutputDetailClass()),
                );
              },
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
                                  'Product Code.',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontFamily: 'tahoma'),
                                ),
                              ),
                              Container(
                                child: const Text(
                                  'G383KLJ',
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
                                      'assets/images/qr.png',
                                      height: 60,
                                      color: const Color(0xff40963b),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text('Id',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'tahoma')),
                                      Text('Qty',
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
                                  Text('1',
                                      style: TextStyle(
                                          fontSize: 14, fontFamily: 'tahoma')),
                                  Text('300.0',
                                      style: TextStyle(
                                          fontSize: 14, fontFamily: 'tahoma')),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Transfer Date",
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'tahoma'),
                              ),
                              Text(
                                "20-10-2022",
                                style: TextStyle(
                                    color: Color(0xff40963b),
                                    fontSize: 16,
                                    fontFamily: 'tahoma'),
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
                            "Transfer Sent Date",
                            style:
                                TextStyle(fontSize: 16, fontFamily: 'tahoma'),
                          ),
                          Text(
                            "20-10-2022",
                            style: TextStyle(
                                color: Color(0xff40963b),
                                fontSize: 16,
                                fontFamily: 'tahoma'),
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
          ),
        );
      },
    );
  }
}
