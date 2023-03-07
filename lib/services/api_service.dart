// ignore_for_file: constant_identifier_names, prefer_interpolation_to_compose_strings, prefer_is_empty, depend_on_referenced_packages, avoid_print

import 'dart:convert';

import 'package:bm_mobile/model/product_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;

import '../helper/database_helper.dart';

const String default_profil =
    'http://192.168.1.210:8082/public/assets/images/user/default.jpg';
// const String base_api = 'http://192.168.1.210:8080/api';
const String base_api = 'http://192.168.4.81/galaxy/api';
const String base_apitest = 'http://192.168.1.7:8080/api';
const String base_pic = 'http://192.168.1.210:8082';

Future<bool> apiSyncProduct(
    String token, String lastUpdate, DatabaseHelper dbHelper) async {
  Database db = await dbHelper.database;
  print('product');
  try {
    final response = await http.post(Uri.parse("$base_api/product/data"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + token
        },
        body: {
          'last_update': lastUpdate
        });
    if (response.statusCode == 200) {
      final res = json.decode(response.body);
      for (int i = 0; i < res.length; i++) {
        ProductModel datum = ProductModel.fromDb(res[i]);
        final data = await db.rawQuery(
            "SELECT product_id FROM product WHERE product_id = ? ",
            [datum.product_id]);
        if (data.length > 0) {
          dbHelper.update(datum.tableName, 'product_id', datum.toMap());
        } else {
          dbHelper.insert(datum.tableName, datum.toMap());
        }
      }
      return true;
    } else {
      throw (response.body);
    }
  } catch (e) {
    print(e);
    return false;
  }
}
