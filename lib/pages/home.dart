import 'package:flutter/material.dart';
import 'package:mysqli_attempt_3/models/product.dart';
import 'dart:math';
import 'package:mysqli_attempt_3/services/db.dart';
import 'package:mysqli_attempt_3/ui/product_card.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Product> productList = [];

  @override
  void initState() {
    // TODO: implement initState
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SQL Second lesson"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()  {

          addProduct();


          // insert();
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: productList.map((product) {
            return ProductCard(
                product: product,
                delete: () async {
                  await delete(product);
                  setState(() {
                    refresh();
                  });
                });
          }).toList(),
        ),
      ),
    );
  }

  Future<void> insert() async {

  }

  void refresh() async {
    Random rng = new Random();

    List<Map<String, dynamic>> _results = await DB.query(Product.table);
    productList = _results.map((item) => Product.fromMap(item)).toList();
    setState(() {
      print(productList.length);
    });
    print("kambing golek ${productList.length}");
  }

  void delete(Product product) async {
    DB.delete(Product.table, product);
    refresh();
  }

  void addProduct() async{
    final coordinates = await Navigator.pushNamed(context,'/addProduct');

    Map valueMap = Map.from(coordinates);
    print(valueMap["barcode"]);

    Random rng = new Random();
    await DB.insert(
        table: Product.table,
        model: Product(
            id:rng.nextInt(999999999) ,
            barcode: valueMap["barcode"],
            name: valueMap["name"],
            price: valueMap["price"]));

    refresh();
  }
}
