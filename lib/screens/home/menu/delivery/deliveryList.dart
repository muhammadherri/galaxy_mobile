// ignore_for_file: unnecessary_new, use_key_in_widget_constructors, avoid_unnecessary_containers, must_be_immutable, file_names
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'deliverydetail.dart';

class DeliveryHeaderList extends StatefulWidget {
  List list;
  DeliveryHeaderList({required this.list});

  @override
  State<DeliveryHeaderList> createState() => _DeliveryHeaderListState();
}

class _DeliveryHeaderListState extends State<DeliveryHeaderList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.list.length,
      itemBuilder: (context, i) {
        return new Container(
          color: const Color.fromARGB(255, 238, 238, 238),
          padding: const EdgeInsets.only(bottom: 20, right: 4, left: 4),
          child: new GestureDetector(
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
                        Container(
                          child: Text(
                            widget.list[i]['party_name'],
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontFamily: 'tahoma'),
                          ),
                        ),
                        ButtonTheme(
                          minWidth: 88.0,
                          height: 5.0,
                          child: Text(
                            widget.list[i]['lvl'] == '6'
                                ? "Waiting Shipping"
                                : widget.list[i]['lvl'] == '11'
                                    ? "Cancel"
                                    : "Closed",
                            style: const TextStyle(
                                color: Color(0xff40963b),
                                fontSize: 16,
                                fontFamily: 'tahoma'),
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              widget.list[i]['currency_code'],
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontFamily: 'tahoma'),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Delivery ID.',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontFamily: 'tahoma'),
                                  ),
                                  Text(
                                    widget.list[i]['delivery_id'],
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontFamily: 'tahoma'),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Customer Shipto.',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontFamily: 'tahoma'),
                                  ),
                                  Text(
                                    widget.list[i]['site_code'],
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Freight :",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontFamily: 'tahoma'),
                                  ),
                                  Text(
                                    widget.list[i]['term_code'] == 'null'
                                        ? 'Empty'
                                        : widget.list[i]['term_code'],
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontFamily: 'tahoma'),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Weight. ",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontFamily: 'tahoma'),
                                  ),
                                  Text(
                                    widget.list[i]['gross_weight'] == 'null'
                                        ? 'Empty'
                                        : widget.list[i]['gross_weight'],
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
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
                  const Divider(
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.list[i]['dock_code'].toString() == 'null'
                                  ? 'Delivery Note is Empty'
                                  : widget.list[i]['dock_code'].toString(),
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'tahoma',
                                  color: Colors.grey),
                            ),
                            Text(
                              widget.list[i]['on_or_about_date'],
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'tahoma',
                                  color: Colors.grey),
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
                      children: [
                        Text(
                          widget.list[i]['attribute2'],
                          style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'tahoma',
                              color: Colors.grey),
                        ),
                        TextButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff40963b),
                            minimumSize: const Size(88, 20),
                            padding: const EdgeInsets.all(12.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 5,
                          ),
                          child: Container(
                            child: const Text(
                              'See More...',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'tahoma'),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: DeliveryDetail(
                                    Request: widget.list[i],
                                  )),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class DeliveryItemList extends StatefulWidget {
  List list;
  DeliveryItemList({super.key, required this.list});

  @override
  State<DeliveryItemList> createState() => _DeliveryItemListState();
}

class _DeliveryItemListState extends State<DeliveryItemList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: Expanded(
          child: ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: (context, i) {
          return new Container(
            color: const Color.fromARGB(255, 238, 238, 238),
            child: new GestureDetector(
              child: new Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Sales No',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontFamily: 'tahoma'),
                              ),
                              Text(
                                widget.list[i]['source_header_number']
                                    .toString(),
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
                              const Text(
                                'Line',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontFamily: 'tahoma'),
                              ),
                              Text(
                                widget.list[i]['source_line_id'].toString(),
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
                              const Text(
                                'Item No',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontFamily: 'tahoma'),
                              ),
                              Text(
                                widget.list[i]['item_code'].toString(),
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
                              const Text(
                                'Customer PO',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontFamily: 'tahoma'),
                              ),
                              Text(
                                widget.list[i]['cust_po_number'].toString(),
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
                              const Text(
                                'Qty',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontFamily: 'tahoma'),
                              ),
                              Text(
                                widget.list[i]['requested_quantity'].toString(),
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
                              const Text(
                                'UOM',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontFamily: 'tahoma'),
                              ),
                              Text(
                                widget.list[i]['requested_quantity_uom']
                                    .toString(),
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
                              const Text(
                                'Inventory',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontFamily: 'tahoma'),
                              ),
                              Text(
                                widget.list[i]['subinventory'] == 'null'
                                    ? 'SubInventory is Empty'
                                    : widget.list[i]['subinventory'].toString(),
                                style: TextStyle(
                                    color:
                                        widget.list[i]['subinventory'] == 'null'
                                            ? Colors.grey
                                            : const Color(0xff40963b),
                                    fontSize: 14,
                                    fontFamily: 'tahoma'),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Item Description',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontFamily: 'tahoma'),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: 200,
                                    height: 20,
                                    child: Text(
                                      textAlign: TextAlign.end,
                                      widget.list[i]['item_description']
                                          .toString(),
                                      style: const TextStyle(
                                          color: Color(0xff40963b),
                                          fontSize: 14,
                                          fontFamily: 'tahoma'),
                                    ),
                                  ),
                                ],
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
          );
        },
      )),
    );
  }
}
