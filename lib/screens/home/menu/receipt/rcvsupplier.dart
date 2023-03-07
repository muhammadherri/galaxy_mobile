import 'package:flutter/material.dart';

class RcvSupplier extends StatefulWidget {
  const RcvSupplier({super.key});

  @override
  State<RcvSupplier> createState() => _RcvSupplierState();
}

class _RcvSupplierState extends State<RcvSupplier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff40963b),
        title: const Text(
          'Supplier Receive',
          style: TextStyle(fontSize: 20, fontFamily: 'bold'),
        ),
      ),
    );
  }
}
