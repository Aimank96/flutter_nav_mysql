import 'package:flutter/material.dart';
import 'services/db.dart';
import 'pages/home.dart';
import 'pages/add-product.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DB.init();
  runApp(MaterialApp(
      routes:<String, WidgetBuilder> {
        '/':(context) => Home(),
        '/addProduct':(context) => AddProduct(),
      }
  ));
}
