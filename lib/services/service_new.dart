import 'dart:convert';

import 'package:buoi2/models/articles.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class NewService {
  static Future<News> fetchNewsApple(
      nameapi, fromdate, todate, sortby, apikey) async {
    String url =
        "https://newsapi.org/v2/everything?q=${nameapi}&from=${fromdate}&to=${todate}&sortBy=${sortby}&apiKey=${apikey}";
    var reponse = await http.get(Uri.parse(url));
    if (reponse.statusCode == 200) {
      var jsonData = json.decode(reponse.body);
      print(jsonData);

      return newsFromJson(jsonData);
    } else {
      return throw Exception('fail');
    }
  }

  static Future<News> fetchNewsTesla(nameapi, fromdate, sortby, apikey) async {
    String url =
        "https://newsapi.org/v2/everything?q=${nameapi}&from=${fromdate}&sortBy=${sortby}&apiKey=${apikey}";
    var reponse = await http.get(Uri.parse(url));
    if (reponse.statusCode == 200) {
      var jsonData = json.decode(reponse.body);
      print(jsonData);

      return newsFromJson(reponse.body);
    } else {
      return throw Exception('fail');
    }
  }
}