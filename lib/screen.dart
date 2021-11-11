import 'package:buoi2/articles.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListArticle extends StatefulWidget {
  const ListArticle({Key? key}) : super(key: key);

  @override
  _ListArticleState createState() => _ListArticleState();
}

class _ListArticleState extends State<ListArticle> {
  late Future<List<Article>> lsArticle;

  void initState() {
    super.initState();
    lsArticle = Article.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("FlutterNews",style: TextStyle(color: Colors.blue)),
          backgroundColor: Colors.white,
        ),
        body: FutureBuilder(
            future: lsArticle,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CarouselSlider.builder(
                        itemBuilder: (context, index, realIndex) {
                          Article dt = snapshot.data[index];
                          print(dt);
                          return _buildBody(dt);
                        },
                        options: CarouselOptions(
                            height: 300,
                            enlargeCenterPage: true,
                            aspectRatio: 16 / 9,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            autoPlayAnimationDuration:
                            Duration(milliseconds: 1000),
                            viewportFraction: 0.8,
                            scrollDirection: Axis.horizontal),
                        itemCount: snapshot.data.length,
                      ),
                    ),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        Article dt = snapshot.data[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              dt.title,
                              style: TextStyle(fontSize: 20, color: Colors.black),
                              maxLines: 1,
                            ),
                            leading: Image.network(
                              dt.urlToImage,
                              width: 100,
                            ),
                            subtitle: Text(
                              dt.description,
                              style: TextStyle(fontSize: 15),
                              maxLines: 1,
                            ),
                            isThreeLine: true,
                            horizontalTitleGap: 10,
                          ),
                        );
                      },
                    )
                  ],
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            )
    );
  }
}

Widget _buildBody(Article dt) {
  return Container(
    child: Column(
      children: [
        Image.network(
          dt.urlToImage,
          width: 200,
          fit: BoxFit.fill,
          height: 100,
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            dt.source.name,
            maxLines: 1,
            style: TextStyle(color: Colors.blue, fontSize: 20),
          ),
        )
      ],
    ),
  );
}