// To parse this JSON data, do
//
//     final pastSupplementOrder = pastSupplementOrderFromJson(jsonString);

import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_app/apis/api_helper.dart';
import 'package:gym_app/apis/api_response.dart';

List<PastSupplementOrder> pastSupplementOrderFromJson(String str) =>
    List<PastSupplementOrder>.from(
        json.decode(str).map((x) => PastSupplementOrder.fromJson(x)));

String pastSupplementOrderToJson(List<PastSupplementOrder> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PastSupplementOrder {
  PastSupplementOrder({
    this.id,
    this.cart,
    this.date,
    this.paid,
    this.amount,
    this.deliveryDate,
  });

  int id;
  Cart cart;
  DateTime date;
  bool paid;
  int amount;
  dynamic deliveryDate;

  factory PastSupplementOrder.fromJson(Map<String, dynamic> json) =>
      PastSupplementOrder(
        id: json["id"],
        cart: Cart.fromJson(json["cart"]),
        date: DateTime.parse(json["date"]),
        paid: json["paid"],
        amount: json["amount"],
        deliveryDate: json["delivery_date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cart": cart.toJson(),
        "date": date.toIso8601String(),
        "paid": paid,
        "amount": amount,
        "delivery_date": deliveryDate,
      };
}

class Cart {
  Cart({
    this.item,
  });

  List<Item> item;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        item: List<Item>.from(json["item"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "item": List<dynamic>.from(item.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.product,
  });

  Product product;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "product": product.toJson(),
      };
}

class Product {
  Product({
    this.name,
    this.brand,
  });

  String name;
  String brand;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        brand: json["brand"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "brand": brand,
      };
}

Future<ApiResponse> getPastSupplementOrder() async {
  ApiResponse cp = await ApiHelper().getReq(
      endpoint: "https://api.health2offer.com/customer/Customer/pastorder/");

  if (cp.error) {
    Fluttertoast.showToast(msg: "Unable to Fetch Details");
  } else {
    return cp;
  }
}
