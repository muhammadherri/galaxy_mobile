// ignore_for_file: non_constant_identifier_names

class TrxPhInventoryModel {
  TrxPhInventoryModel._privateConstructor();
  static final TrxPhInventoryModel instance =
      TrxPhInventoryModel._privateConstructor();

  final String tableName = 'trxphinventory';
  late String id;
  late String product_id;
  late String item_code;
  late String product_code;
  late String location_trx;
  late String warehouse;
  late String product_qty;
  late String product_gsm;
  late String product_width;
  late String status_trx;
  late String updated_by;
  late String updated_at;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'product_id': product_id,
      'item_code': item_code,
      'product_code': product_code,
      'location_trx': location_trx,
      'warehouse': warehouse,
      'product_qty': product_qty,
      'product_gsm': product_gsm,
      'product_width': product_width,
      'status_trx': status_trx,
      'updated_by': updated_by,
      'updated_at': updated_at,
    };
  }

  TrxPhInventoryModel.fromDb(Map<String, dynamic> map)
      : id = map['id'],
        product_id = map['product_id'],
        item_code = map['item_code'],
        product_code = map['product_code'],
        location_trx = map['location_trx'],
        warehouse = map['warehouse'],
        product_qty = map['product_qty'],
        product_gsm = map['product_gsm'],
        product_width = map['product_width'],
        status_trx = map['status_trx'],
        updated_by = map['updated_by'],
        updated_at = map['updated_at'];
}
