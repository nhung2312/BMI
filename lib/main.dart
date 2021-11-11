/*import 'tuan5.dart';
import 'package:flutter/material.dart';
import 'tuan3_4.dart';
import 'tuan6.dart';
import 'tuan7.dart';
import 'product_screen.dart';*/
import 'package:buoi2/list_image_product.dart';
import 'package:buoi2/product_screen.dart';
import 'package:buoi2/screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ListArticle());
  }
}