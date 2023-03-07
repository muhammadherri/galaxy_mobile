import 'package:flutter/material.dart';

class RcvCustomer extends StatefulWidget {
  const RcvCustomer({super.key});

  @override
  State<RcvCustomer> createState() => _RcvCustomerState();
}

class _RcvCustomerState extends State<RcvCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff40963b),
        title: const Text(
          'Customer Receive',
          style: TextStyle(fontSize: 20, fontFamily: 'bold'),
        ),
      ),
    );
  }
}
