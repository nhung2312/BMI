import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyApp6 extends StatelessWidget {
  const MyApp6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage6(),
    );
  }
}

class HomePage6 extends StatefulWidget {
  const HomePage6({Key? key}) : super(key: key);

  @override
  _HomePage6State createState() => _HomePage6State();
}

class _HomePage6State extends State<HomePage6> {
  late Future<List<Product>> lsProduct;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lsProduct = Product.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: lsProduct,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.hasData) {
            List<Product> data = snapshot.data;
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: data.length,
              itemBuilder: (context, index) {
                Product quantity = snapshot.data[index];
                return Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        child: Image.network(
                          quantity.image,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Container(
                            width: 150,
                            child: Text(
                              quantity.title,
                              style: TextStyle(
                                color: Color(0xFF1a1a1a),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                              maxLines: 1,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                              width: 150,
                              alignment: Alignment.center,
                              child: Text(
                                quantity.description,
                                style: TextStyle(
                                  color: Color(0xFF1a1a1a),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                ),
                                maxLines: 3,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                              )
                          ),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("\$${quantity.price}",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.blue)),
                            ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: new Text('Nhập số lượng'),
                                          content:
                                          new SingleChildScrollView(
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  hintText: 'Nhập số lượng',
                                                ),
                                              )),
                                          actions: <Widget>[
                                            ElevatedButton(
                                              child: Text('Chọn'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      });
                                },
                                child: Text('Mua'))
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          else return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class Rating {
  dynamic rate;
  dynamic count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['count'] = this.count;
    return data;
  }
}

class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;
  Product(this.id, this.title, this.price, this.description, this.category, this.image, this.rating);

  static Future<List<Product>> fetchData() async {
    String url = "https://fakestoreapi.com/products";
    var client = http.Client();
    var response = await client.get(Uri.parse(url));
    if(response.statusCode == 200) {
      var result = response.body;
      var jsonData = jsonDecode(result);
      List<Product> lsProduct = [];
      for(var item in jsonData) {
        dynamic rate = item["rating"]["rate"];
        dynamic count = item["rating"]["count"];
        Rating rating = new Rating(rate: rate, count: count);
        var id = item['id'];
        var title = item['title'];
        var price = item['price'];
        var description = item['description'];
        var category = item['category'];
        var image = item['image'];
        Product p = new Product(id, title, price, description, category, image, rating);
        lsProduct.add(p);
      }
      return lsProduct;
    } else {
      print(response.statusCode);
      throw Exception("Loi lay du lieu");
    }
  }
}