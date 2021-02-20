import 'package:flutter/material.dart';
import 'package:mysqli_attempt_3/models/product.dart';

class ProductCard extends StatelessWidget {

  final Product product;
  final Function delete;
  final Function update;

  ProductCard({this.product,this.delete,this.update});

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
                "Product barcode : ${product.barcode}",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Product Name : ${product.name}",
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),

              SizedBox(
                height: 16,
              ),
              Text(
                "Product Price RM ${product.price}",
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: update,
                child: Text("update"),
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.red)),
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
