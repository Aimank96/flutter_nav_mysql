import 'package:flutter/material.dart';

class AddProduct extends StatelessWidget {
  final barcodeTextController = TextEditingController();
  final nameTextController = TextEditingController();
  final priceTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Add Product"),
        onPressed: () {
          // myController.text = "sss";

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
                decoration:
                    InputDecoration(border: InputBorder.none, hintText: 'Price'),
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
