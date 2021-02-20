import 'package:flutter/material.dart';

class AddProduct extends StatelessWidget {
  final barcodeTextController = TextEditingController();
  final nameTextController = TextEditingController();
  final priceTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: Text("add product"),
        onPressed: () {
          // myController.text = "sss";

          int price = int.parse("${priceTextController.text}");
          print("lalala ${barcodeTextController.text}");
          Navigator.of(context).pop({
            "barcode": "${barcodeTextController.text}",
            "name": "${nameTextController.text}",
            "price": price
          });
        },
      ),
      body: SafeArea(
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
    );
  }
}
