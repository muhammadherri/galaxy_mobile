import 'package:flutter/material.dart';
import 'package:bm_mobile/model/AppModel.dart';
import 'package:bm_mobile/screens/ProKitScreenListing.dart';

Map<String, WidgetBuilder> routes() {
  return <String, WidgetBuilder>{
    ProKitScreenListing.tag: (context) => ProKitScreenListing(ProTheme()),
  };
}
