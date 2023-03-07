// ignore_for_file: unused_import

import 'package:flutter/material.dart';

class PurchaseOrderDetailClass extends StatefulWidget {
  const PurchaseOrderDetailClass({super.key});

  @override
  State<PurchaseOrderDetailClass> createState() =>
      _PurchaseOrderDetailClassState();
}

class _PurchaseOrderDetailClassState extends State<PurchaseOrderDetailClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff40963b),
        title: const Text(
          'Purchase Order Detail',
          style: TextStyle(fontSize: 20, fontFamily: 'bold'),
        ),
      ),
    );
  }
}
