import 'package:api_integration_sample/model/fact_list_model.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FactListScreenController with ChangeNotifier {
  List<Facts> dataList = [];

  Future getFetcheddata() async {
    final url = Uri.parse("https://catfact.ninja/facts");

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        FactListModel factListRes = factListModelFromJson(response.body);
        dataList = factListRes.factsList ?? [];
      }
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }
}
