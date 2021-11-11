/*import 'tuan5.dart';
import 'package:flutter/material.dart';
import 'tuan3_4.dart';
import 'tuan6.dart';
import 'tuan7.dart';
import 'product_screen.dart';*/
import 'package:buoi2/list_image_product.dart';
import 'package:buoi2/product_screen.dart';
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
        home: ProductScreen());
  }
}
/*void main() {
  runApp(ProductScreen());
}
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);*/

/*(tuan2)
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
        child: Center(
            child: Text(
              "Xin chao cac ban",
              style: TextStyle(color: Colors.red,fontSize: 25),
              textDirection: TextDirection.ltr,
            ),
        ),
    );
  }
*/

/*C1:
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 200.0, left: 20),
          child: Row(
            textDirection: TextDirection.ltr,
//          crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Icon(Icons.call, color: Colors.red, size: 30, textDirection: TextDirection.ltr,),
                  Text("Call", textDirection: TextDirection.ltr, style: TextStyle(color: Colors.red),)
                ],
              ),
              Column(
                children: [
                  Icon(Icons.call, color: Colors.red, size: 30, textDirection: TextDirection.ltr,),
                  Text("Place", textDirection: TextDirection.ltr, style: TextStyle(color: Colors.red),)
                ],
              ),
              Column(
                children: [
                  Icon(Icons.call, color: Colors.red, size: 30, textDirection: TextDirection.ltr,),
                  Text("Alarm", textDirection: TextDirection.ltr, style: TextStyle(color: Colors.red),)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
*/

/*C2:
  Widget createColumn(String data, IconData icon, Color color, double size) {
    return Column(
      children: [
        Icon(icon, color: Colors.red, size: size, textDirection: TextDirection.ltr,),
        Text(data, textDirection: TextDirection.ltr, style: TextStyle(color: color),)
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 200.0, left: 20),
          child: Row(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              createColumn("Call", Icons.call, Colors.red, 50),
              createColumn("Place", Icons.place, Colors.green, 40),
              createColumn("Alarm", Icons.alarm, Colors.orange, 30),
            ]
          ),
        ),
      ),
    );
  }
*/

/*C3:
  Widget createColumn(String data, IconData icon, Color color, double size) {
    return Column(
      children: [
        Icon(icon, color: Colors.red, size: size, textDirection: TextDirection.ltr,),
        Text(data, textDirection: TextDirection.ltr, style: TextStyle(color: color),)
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    var dataList = ["Call", "Palace", "Alarm"];
    var iconList = [ Icons.call, Icons.place, Icons.alarm];
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 200.0, left: 20),
          child: Row(
              textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                createColumn(dataList[0], iconList[0], Colors.red, 50),
                createColumn(dataList[1], iconList[1], Colors.pink, 40),
                createColumn(dataList[2], iconList[2], Colors.orange, 30),
              ]
          ),
        ),
      ),
    );
  }
*/

/*
  Widget createColumn(String data, IconData icon, Color color, double size) {
    return Column(
      children: [
        Icon(icon, color: Colors.red, size: size, textDirection: TextDirection.ltr,),
        Text(data, textDirection: TextDirection.ltr, style: TextStyle(color: color),)
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    var dataList = ["Call", "Palace", "Alarm"];
    var iconList = [ Icons.call, Icons.place, Icons.alarm];
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Center(
        child: Container(
          height: 300,
          decoration: BoxDecoration(
            color: Colors.blue
          ),
          child: Row(
              textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                createColumn(dataList[0], iconList[0], Colors.red, 50),
                createColumn(dataList[1], iconList[1], Colors.pink, 40),
                createColumn(dataList[2], iconList[2], Colors.orange, 30),
              ],
          ),
        ),
      ),
    );
  }
*/

  /*Widget createColumn(String data, IconData icon, Color color, double size) {
    return Column(
      children: [
        Icon(icon, color: Colors.red, size: size, textDirection: TextDirection.ltr,),
        Text(data, textDirection: TextDirection.ltr, style: TextStyle(color: color),)
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    var dataList = ["Call", "Palace", "Alarm"];
    var iconList = [ Icons.call, Icons.place, Icons.alarm];
    double size = 40;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Center(
        child: Container(
          height: size + 200,
          decoration: BoxDecoration(
              color: Colors.black12
          ),
          child: Column(
            children: [
              Text("Xin chao cac ban", textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 30, color: Colors.red)),
              Row(
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  createColumn(dataList[0], iconList[0], Colors.red, size),
                  createColumn(dataList[1], iconList[1], Colors.pink, size),
                  createColumn(dataList[2], iconList[2], Colors.orange, size),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
//(/tuan2)