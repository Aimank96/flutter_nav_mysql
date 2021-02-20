import 'package:flutter/material.dart';
import 'package:mysqli_attempt_3/models/product.dart';

class ProductCard extends StatelessWidget {

  final Product product;
  final Function delete;

  ProductCard({this.product,this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "${product.barcode}",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "${product.name}",
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: delete,
                child: Text("Delete"),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red)),
              )
            ],
          ),
        ));
  }
}
