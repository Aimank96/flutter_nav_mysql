import 'package:flutter/material.dart';
import 'package:mysqli_attempt_3/models/product.dart';

class EditProduct extends StatelessWidget {
  final barcodeTextController = TextEditingController();
  final nameTextController = TextEditingController();
  final priceTextController = TextEditingController();

  final Product product;

  EditProduct({this.product});

  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context).settings.arguments;
    barcodeTextController.text = product.barcode;
    nameTextController.text = product.name;
    priceTextController.text = product.price.toString();

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Product"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("edit product"),
        onPressed: () {

          num price = num.parse("${priceTextController.text}");
          Navigator.of(context).pop({
            "barcode": "${barcodeTextController.text}",
            "name": "${nameTextController.text}",
            "price": price
          });
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Barcode'),
                controller: barcodeTextController,
              ),
              TextField(
                decoration:
                    InputDecoration(border: InputBorder.none, hintText: 'Name'),
                controller: nameTextController,
              ),
              TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Price'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                controller: priceTextController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
