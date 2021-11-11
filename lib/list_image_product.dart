import 'package:buoi2/product.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListImageProduct extends StatefulWidget {
  const ListImageProduct({Key? key}) : super(key: key);

  @override
  _ListImageProductState createState() => _ListImageProductState();
}

class _ListImageProductState extends State<ListImageProduct> {
  late Future<List<Product>> lsProduct;

  void initState() {
    super.initState();
    lsProduct = Product.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List Image Product"),
        ),
        body: FutureBuilder(
            future: lsProduct,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CarouselSlider.builder(
                        itemBuilder: (context, index, realIndex) {
                          Product dt = snapshot.data[index];
                          print(dt);
                          return _buildBody(dt);
                        },

                        //Slider Container properties
                        options: CarouselOptions(
                            height: 300,
                            enlargeCenterPage: true,
                            // autoPlay: true,
                            aspectRatio: 16 / 9,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            autoPlayAnimationDuration:
                            Duration(milliseconds: 1000),
                            viewportFraction: 0.8,
                            scrollDirection: Axis.horizontal),
                        itemCount: snapshot.data.length,
                      ),
                    ),
                  ],
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}

Widget _buildBody(Product dt) {
  return Container(
    child: Column(
      children: [
        Image.network(
          dt.image,
          width: Get.width * 0.9,
          fit: BoxFit.fill,
          height: 200,
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            dt.title,
            maxLines: 1,

            style: TextStyle(color: Colors.blue, fontSize: 20),
          ),
        )
      ],
    ),
  );
}