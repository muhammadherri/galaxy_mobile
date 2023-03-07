// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class BMCategory {
  var name = "";
  Color? color;

  var icon = "";
}

class BMSlider {
  var image = "";
  var balance = "";
  var accountNo = "";
}

class BMBill {
  var name;
  var day;
  var date;
  var isPaid = false;
  late var icon;
  var amount;
  var wallet = "Mastercard";
}

class BMContact {
  late var img;

  var name;

  var isOnline = false;
  var subject;

  var contactno;
}
