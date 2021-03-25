// To parse this JSON data, do
//
//     final transformaionImageModel = transformaionImageModelFromJson(jsonString);

import 'dart:convert';

import 'package:gym_app/apis/api_helper.dart';
import 'package:gym_app/apis/api_response.dart';

List<TransformaionImageModel> transformaionImageModelFromJson(String str) =>
    List<TransformaionImageModel>.from(
        json.decode(str).map((x) => TransformaionImageModel.fromJson(x)));

String transformaionImageModelToJson(List<TransformaionImageModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TransformaionImageModel {
  TransformaionImageModel({
    this.id,
    this.image,
    this.customer,
  });

  int id;
  String image;
  int customer;

  factory TransformaionImageModel.fromJson(Map<String, dynamic> json) =>
      TransformaionImageModel(
        id: json["id"],
        image: json["image"],
        customer: json["customer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "customer": customer,
      };
}

Future<ApiResponse> customerTransformation() async {
  ApiResponse cp = await ApiHelper().getReq(
      endpoint: "https://api.health2offer.com/customer/transformation/");

  return cp;
}
