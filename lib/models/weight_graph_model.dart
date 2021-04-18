// To parse this JSON data, do
//
//     final weightGraphModel = weightGraphModelFromJson(jsonString);

import 'dart:convert';

import '../lib.dart';

List<WeightGraphModel> weightGraphModelFromJson(String str) =>
    List<WeightGraphModel>.from(
        json.decode(str).map((x) => WeightGraphModel.fromJson(x)));

String weightGraphModelToJson(List<WeightGraphModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WeightGraphModel {
  WeightGraphModel({
    this.id,
    this.date,
    this.weight,
    this.customer,
  });

  int id;
  DateTime date;
  double weight;
  int customer;

  factory WeightGraphModel.fromJson(Map<String, dynamic> json) =>
      WeightGraphModel(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        weight: json["weight"],
        customer: json["customer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "weight": weight,
        "customer": customer,
      };
}

Future<ApiResponse> customerWeightGraph() async {
  int id = await ApiHelper().getUserObjectID();
  ApiResponse x = await ApiHelper().getReq(
    endpoint: "https://api.health2offer.com/customer/weightgraph/$id/",
    
  );

  return x;
}


Future<ApiResponse> trainerWeightGraph(int id) async {
  ApiResponse x = await ApiHelper().getReq(
    endpoint: "https://api.health2offer.com/customer/weightgraph/$id/",
    
  );

  return x;
}