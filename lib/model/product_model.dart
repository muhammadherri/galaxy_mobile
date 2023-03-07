// ignore_for_file: non_constant_identifier_names

class ProductModel {
  ProductModel._privateConstructor();
  static final ProductModel instance = ProductModel._privateConstructor();

  final String tableName = 'product';
  late String product_id;
  late String item_code;
  late String product_code;
  late String location;
  late String warehouse;
  late String product_qty;
  late String product_gsm;
  late String product_width;
  late String updated_by;
  late String updated_at;

  Map<String, dynamic> toMap() {
    return {
      'product_id': product_id,
      'item_code': item_code,
      'product_code': product_code,
      'location': location,
      'warehouse': warehouse,
      'product_qty': product_qty,
      'product_gsm': product_gsm,
      'product_width': product_width,
      'updated_by': updated_by,
      'updated_at': updated_at,
    };
  }

  ProductModel.fromDb(Map<String, dynamic> map)
      : product_id = map['product_id'],
        item_code = map['item_code'],
        product_code = map['product_code'],
        location = map['location'],
        warehouse = map['warehouse'],
        product_qty = map['product_qty'],
        product_gsm = map['product_gsm'],
        product_width = map['product_width'],
        updated_by = map['updated_by'],
        updated_at = map['updated_at'];
}
