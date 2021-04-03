// To parse this JSON data, do
//
//     final supplementSlug = supplementSlugFromJson(jsonString);

import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_app/apis/api_helper.dart';
import 'package:gym_app/apis/api_response.dart';
// To parse this JSON data, do
//
//     final supplementSlug = supplementSlugFromJson(jsonString);

SupplementSlug supplementSlugFromJson(String str) =>
    SupplementSlug.fromJson(json.decode(str));

String supplementSlugToJson(SupplementSlug data) => json.encode(data.toJson());

class SupplementSlug {
  SupplementSlug({
    this.id,
    this.vendor,
    this.name,
    this.desc,
    this.price,
    this.isStock,
    this.image1,
    this.image2,
    this.weight,
    this.slug,
    this.productType,
    this.nutrition,
    this.brand,
    this.date,
  });

  int id;
  Vendor vendor;
  String name;
  String desc;
  double price;
  bool isStock;
  String image1;
  String image2;
  double weight;
  String slug;
  String productType;
  String nutrition;
  String brand;
  DateTime date;

  factory SupplementSlug.fromJson(Map<String, dynamic> json) => SupplementSlug(
        id: json["id"],
        vendor: Vendor.fromJson(json["vendor"]),
        name: json["name"],
        desc: json["desc"],
        price: json["price"],
        isStock: json["is_stock"],
        image1: json["image1"],
        image2: json["image2"],
        weight: json["weight"],
        slug: json["slug"],
        productType: json["product_type"],
        nutrition: json["nutrition"],
        brand: json["brand"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "vendor": vendor.toJson(),
        "name": name,
        "desc": desc,
        "price": price,
        "is_stock": isStock,
        "image1": image1,
        "image2": image2,
        "weight": weight,
        "slug": slug,
        "product_type": productType,
        "nutrition": nutrition,
        "brand": brand,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
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

Future<ApiResponse> getSlugDetails(String slug) async {
  ApiResponse cp = await ApiHelper()
      .getReq(endpoint: "https://api.health2offer.com/website/product/$slug");
  return cp;
}

void addToSupplementCart(Map data) async {
  ApiResponse add = await ApiHelper().postReq(
      endpoint: "https://api.health2offer.com/customer/addtocart/", data: data);

  if (add.error) {
    Fluttertoast.showToast(msg: "Item Cannot Be added Please try later");
  } else {
    Fluttertoast.showToast(msg: "Item added to Cart");
  }
}
