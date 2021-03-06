// To parse this JSON data, do
//
//     final supplementProduct = supplementProductFromJson(jsonString);

import 'dart:convert';

import 'package:gym_app/apis/api_helper.dart';
import 'package:gym_app/apis/api_response.dart';

SupplementProduct supplementProductFromJson(String str) =>
    SupplementProduct.fromJson(json.decode(str));

String supplementProductToJson(SupplementProduct data) =>
    json.encode(data.toJson());

class SupplementProduct {
  SupplementProduct({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int count;
  String next;
  dynamic previous;
  List<Result> results;

  factory SupplementProduct.fromJson(Map<String, dynamic> json) =>
      SupplementProduct(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.vendor,
    this.name,
    this.image1,
    this.price,
    this.isStock,
    this.slug,
    this.id,
    this.weight,
    this.brand,
  });

  Vendor vendor;
  String name;
  String image1;
  double price;
  bool isStock;
  String slug;
  int id;
  double weight;
  String brand;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        vendor: Vendor.fromJson(json["vendor"]),
        name: json["name"],
        image1: json["image1"],
        price: json["price"],
        isStock: json["is_stock"],
        slug: json["slug"],
        id: json["id"],
        weight: json["weight"],
        brand: json["brand"],
      );

  Map<String, dynamic> toJson() => {
        "vendor": vendor.toJson(),
        "name": name,
        "image1": image1,
        "price": price,
        "is_stock": isStock,
        "slug": slug,
        "id": id,
        "weight": weight,
        "brand": brand,
      };
}

class Vendor {
  Vendor({
    this.name,
  });

  String name;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

Future<SupplementProduct> getSupplements(String query) async {
  ApiResponse cp = await ApiHelper().getReq(
      endpoint: "https://p2c-gym.herokuapp.com/website/product/", query: query);

  var model = supplementProductFromJson(cp.data);
  var finalModel = supplementProductFromJson(cp.data);
  finalModel.results.clear();

  int i = 2;
  print("loop started");
  while (model.next != null) {
    ApiResponse m = await ApiHelper().getReq(
      endpoint: model.next,
    );
    var localModel = supplementProductFromJson(m.data);
    finalModel.results =
        finalModel.results + model.results + localModel.results;
    i++;
    model = localModel;
  }

  print(finalModel.results.length);
  print("loop ended");

  return finalModel;
}
