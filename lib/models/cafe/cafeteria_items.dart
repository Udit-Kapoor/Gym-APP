import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_app/apis/api_helper.dart';
import 'package:gym_app/apis/api_response.dart';

// To parse this JSON data, do
//
//     final cafeteriaItems = cafeteriaItemsFromJson(jsonString);

List<CafeteriaItems> cafeteriaItemsFromJson(String str) =>
    List<CafeteriaItems>.from(
        json.decode(str).map((x) => CafeteriaItems.fromJson(x)));

String cafeteriaItemsToJson(List<CafeteriaItems> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CafeteriaItems {
  CafeteriaItems({
    this.id,
    this.name,
    this.ingredients,
    this.photo,
    this.type,
    this.active,
    this.category,
    this.itemVarients,
  });

  int id;
  String name;
  String ingredients;
  String photo;
  String type;
  bool active;
  Category category;
  List<ItemVarient> itemVarients;

  factory CafeteriaItems.fromJson(Map<String, dynamic> json) => CafeteriaItems(
        id: json["id"],
        name: json["name"],
        ingredients: json["ingredients"],
        photo: json["photo"],
        type: json["type"],
        active: json["active"],
        category: Category.fromJson(json["category"]),
        itemVarients: List<ItemVarient>.from(
            json["item_varients"].map((x) => ItemVarient.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "ingredients": ingredients,
        "photo": photo,
        "type": type,
        "active": active,
        "category": category.toJson(),
        "item_varients":
            List<dynamic>.from(itemVarients.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    this.id,
    this.name,
    this.active,
  });

  int id;
  String name;
  bool active;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "active": active,
      };
}

class ItemVarient {
  ItemVarient({
    this.id,
    this.size,
    this.price,
    this.preparationTime,
    this.active,
    this.item,
  });

  int id;
  String size;
  int price;
  String preparationTime;
  bool active;
  int item;

  factory ItemVarient.fromJson(Map<String, dynamic> json) => ItemVarient(
        id: json["id"],
        size: json["size"],
        price: json["price"],
        preparationTime: json["preparation_time"],
        active: json["active"],
        item: json["item"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "size": size,
        "price": price,
        "preparation_time": preparationTime,
        "active": active,
        "item": item,
      };
}

Future<ApiResponse> getCafeItems() async {
  ApiResponse cp = await ApiHelper()
      .getReq(endpoint: "https://p2c-gym.herokuapp.com/facilities/item/");
  return cp;
}

void addToCart(Map data) async {
  ApiResponse add = await ApiHelper().postReq(
      endpoint: "https://p2c-gym.herokuapp.com/facilities/cafeteria_order/",
      data: data);

  if (add.error) {
    Fluttertoast.showToast(msg: "Item Cannot Be added Please try later");
  } else {
    Fluttertoast.showToast(msg: "Item added to Cart");
  }
}
