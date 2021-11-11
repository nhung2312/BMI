import 'package:buoi2/source.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Article {
  final Source source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;

  Article(this.source, this.author, this.title, this.description, this.url,
      this.urlToImage, this.publishedAt, this.content);
  static Future<List<Article>> fetchData() async {
    String url = "https://newsapi.org/v2/everything?q=apple&from=2021-11-10&to=2021-11-10&sortBy=popularity&apiKey=3dbd8bd5b9c9489999ece504b854cada";

    var client = http.Client();
    var response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print("Lay du lieu thanh cong");
      var result = response.body;
      var jsonData = jsonDecode(result);
      List<Article> ls = [];

      for (var item in jsonData) {
        dynamic id = item["id"]["name"];
        dynamic name = item["id"]["name"];
        Source source = new Source(id: id, name: name);

        var author = item['author'];
        var title = item['title'];
        var description = item['description'];
        var url = item['url'];
        var urlToImage = item['urlToImage'];
        var publishedAt = item['publishedAt'];
        var content = item['content'];

        Article p =
        new Article(source, author, title, description, url, urlToImage, publishedAt, content);
        ls.add(p);
      }
      print("Length = ${ls.length}");
      return ls;
    } else {
      print("Call api fail");
      throw Exception("Loi lay du lieu");
    }
  }
}