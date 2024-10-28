import 'dart:convert';

import 'package:api_integration_sample/model/facts_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreenController with ChangeNotifier {
  FactsModel? resObj;
  bool isLoading = false;

  Future getFetcheddata() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse("https://catfact.ninja/fact");

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var convertedjson = jsonDecode(response.body);
        resObj = FactsModel(
            facts: convertedjson["fact"], length: convertedjson["length"]);
      }
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }
}
