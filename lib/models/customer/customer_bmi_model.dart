// To parse this JSON data, do
//
//     final customerBmiModel = customerBmiModelFromJson(jsonString);

import 'dart:convert';

import 'package:gym_app/apis/api_helper.dart';
import 'package:gym_app/apis/api_response.dart';

CustomerBmiModel customerBmiModelFromJson(String str) =>
    CustomerBmiModel.fromJson(json.decode(str));

String customerBmiModelToJson(CustomerBmiModel data) =>
    json.encode(data.toJson());

class CustomerBmiModel {
  CustomerBmiModel({
    this.id,
    this.weight,
    this.height,
    this.motive,
    this.healthIssue,
    this.otherHealthIssue,
    this.customer,
  });

  int id;
  double weight;
  double height;
  String motive;
  String healthIssue;
  String otherHealthIssue;
  int customer;

  factory CustomerBmiModel.fromJson(Map<String, dynamic> json) =>
      CustomerBmiModel(
        id: json["id"],
        weight: json["weight"],
        height: json["height"],
        motive: json["motive"],
        healthIssue: json["health_issue"],
        otherHealthIssue: json["other_health_issue"],
        customer: json["customer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "weight": weight,
        "height": height,
        "motive": motive,
        "health_issue": healthIssue,
        "other_health_issue": otherHealthIssue,
        "customer": customer,
      };
}

Future<ApiResponse> customerBmi() async {
  ApiResponse cp = await ApiHelper()
      .getReq(endpoint: "https://api.health2offer.com/customer/bmi/");

  return cp;
}

Future<ApiResponse> customerTrainerBmi(int id) async {
  ApiResponse cp = await ApiHelper().postReq(
      endpoint: "https://api.health2offer.com/customer/trainerbmi/",
      data: {"id": id});

  return cp;
}

Future<ApiResponse> postWeight(int id, String weight) async {
  ApiResponse cp = await ApiHelper().postReq(
      endpoint: "https://api.health2offer.com/customer/weightgraph/",
      data: {
        "weight": weight,
        "customer": id,
      });

  return cp;
}
