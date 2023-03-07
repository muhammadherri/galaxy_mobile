// ignore_for_file: unnecessary_null_comparison, depend_on_referenced_packages, constant_identifier_names, non_constant_identifier_names, unnecessary_this
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const _databaseName = "galaxy_db.db";
  static const _databaseVersion = 1;
  static const tableproduct = 'product';
  static const tabletrxphinventory = 'trxphinventory';
  static const product_id = 'product_id';
  static const product_code = 'product_code';
  static const item_code = 'item_code';
  static const location = 'location';
  static const warehouse = 'warehouse';
  static const location_trx = 'location';
  static const product_qty = 'product_qty';
  static const product_gsm = 'product_gsm';
  static const product_width = 'product_width';
  static const status_trx = 'status_trx';
  static const updated_by = 'updated_by';
  static const updated_at = 'updated_at';
  static const tableusers = 'users';
  static const name = 'name';

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database ?? await _initDatabase();
    return _database ?? await _initDatabase();
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE $tableproduct("
        "product_id TEXT PRIMARY KEY,"
        "item_code TEXT,"
        "product_code TEXT,"
        "location TEXT,"
        "warehouse TEXT,"
        "product_qty TEXT,"
        "product_gsm TEXT,"
        "product_width TEXT,"
        "updated_by TEXT,"
        "updated_at TEXT"
        ")");

    await db.execute("CREATE TABLE $tabletrxphinventory("
        "id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
        "product_id TEXT,"
        "item_code TEXT,"
        "product_code TEXT,"
        "location_trx TEXT,"
        "warehouse TEXT,"
        "product_qty TEXT,"
        "product_gsm TEXT,"
        "product_width TEXT,"
        "status_trx TEXT,"
        "updated_by TEXT,"
        "updated_at TEXT"
        ")");
  }

  Future<int> insert(String table, Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> queryAllRows(String table) async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<int?> queryRowCount(String table) async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  Future<int> update(
      String table, String columnId, Map<String, dynamic> row) async {
    Database db = await instance.database;
    String product_id = row[columnId];
    return await db
        .update(table, row, where: '$columnId = ?', whereArgs: [product_id]);
  }

  Future<int> delete(String table, String columnId, int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> getExerciseMapList() async {
    Database db = await this.database;
    var result = await db.rawQuery('SELECT * FROM $tableproduct');
    return result;
  }

  Future dummyData(Database db) async {
    // await db.execute("DELETE FROM delivery");
    // await db.execute("DELETE FROM deliverydet");
  }
}
