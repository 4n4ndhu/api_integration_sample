import 'package:api_integration_sample/model/news_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsScreenController with ChangeNotifier {
  List<News> dataList = [];

  Future getData() async {
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=bitcoin&apiKey=e0533ab11900474fa12c7772251ca74b");

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        NewsScreenModel newsScreenRes = newsScreenModelFromJson(response.body);
        dataList = newsScreenRes.articles ?? [];
      }
    } catch (e) {}
    notifyListeners();
  }
}
