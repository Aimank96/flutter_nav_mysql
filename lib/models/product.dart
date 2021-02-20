import 'package:mysqli_attempt_3/models/model.dart';

class Product extends Model {
  static String table = 'product';

  int id;
  String barcode;
  String name;
  num price;

  Product({this.id,this.barcode, this.name, this.price});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id':id,
      'barcode': barcode,
      'name': name,
      'price': price
    };

    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  static Product fromMap(Map<String, dynamic> map) {
    return Product(
        id: map['id'], barcode: map['barcode'].toString(), name: map['name'].toString(), price: map['price']);
  }
}
