import 'dart:convert';

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
  });

  int id;
  String name;
  String ingredients;
  String photo;
  String type;
  bool active;
  Category category;

  factory CafeteriaItems.fromJson(Map<String, dynamic> json) => CafeteriaItems(
        id: json["id"],
        name: json["name"],
        ingredients: json["ingredients"],
        photo: json["photo"],
        type: json["type"],
        active: json["active"],
        category: Category.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "ingredients": ingredients,
        "photo": photo,
        "type": type,
        "active": active,
        "category": category.toJson(),
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
