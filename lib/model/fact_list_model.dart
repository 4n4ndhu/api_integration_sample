// To parse this JSON data, do
//
//     final factListModel = factListModelFromJson(jsonString);

import 'dart:convert';

FactListModel factListModelFromJson(String str) =>
    FactListModel.fromJson(json.decode(str));

class FactListModel {
  List<Facts>? factsList;

  FactListModel({
    this.factsList,
  });

  factory FactListModel.fromJson(Map<String, dynamic> json) => FactListModel(
        factsList: json["data"] == null
            ? []
            : List<Facts>.from(json["data"]!.map((x) => Facts.fromJson(x))),
      );
}

class Facts {
  String? fact;
  num? length;

  Facts({
    this.fact,
    this.length,
  });

  factory Facts.fromJson(Map<String, dynamic> json) => Facts(
        fact: json["fact"],
        length: json["length"],
      );
}
