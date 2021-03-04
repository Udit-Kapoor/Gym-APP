// To parse this JSON data, do
//
//     final supplementCartModel = supplementCartModelFromJson(jsonString);

import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_app/apis/api_helper.dart';
import 'package:gym_app/apis/api_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

SupplementCartModel supplementCartModelFromJson(String str, bool isCustomer) {
  if (isCustomer) {
    return SupplementCartModel.fromJsonCustomer(json.decode(str));
  } else {
    return SupplementCartModel.fromJsonTrainer(json.decode(str));
  }
}

String supplementCartModelToJson(SupplementCartModel data) =>
    json.encode(data.toJson());

class SupplementCartModel {
  SupplementCartModel({
    this.id,
    this.orderId,
    this.item,
    this.customer,
    this.trainer,
    this.status,
    this.cust,
    this.gymtrainer,
    this.amount,
    this.promocode,
    this.orderid,
    this.ordered,
    this.paymentId,
    this.singleProduct,
  });

  int id;
  dynamic orderId;
  List<Item> item;
  dynamic customer;
  dynamic trainer;
  bool status;
  Cust cust;
  dynamic gymtrainer;
  int amount;
  String promocode;
  String orderid;
  bool ordered;
  dynamic paymentId;
  bool singleProduct;

  factory SupplementCartModel.fromJsonCustomer(Map<String, dynamic> json) =>
      SupplementCartModel(
        id: json["id"],
        orderId: json["order_id"],
        item: List<Item>.from(json["item"].map((x) => Item.fromJson(x))),
        customer: json["customer"],
        trainer: json["trainer"],
        status: json["status"],
        cust: Cust.fromJson(json["cust"]),
        amount: json["amount"],
        promocode: json["promocode"],
        orderid: json["orderid"],
        ordered: json["ordered"],
        paymentId: json["payment_id"],
        singleProduct: json["single_product"],
      );

  factory SupplementCartModel.fromJsonTrainer(Map<String, dynamic> json) =>
      SupplementCartModel(
        id: json["id"],
        orderId: json["order_id"],
        item: List<Item>.from(json["item"].map((x) => Item.fromJson(x))),
        customer: json["customer"],
        trainer: json["trainer"],
        status: json["status"],
        gymtrainer: GymTrainer.fromJson(json["gymtrainer"]),
        amount: json["amount"],
        promocode: json["promocode"],
        orderid: json["orderid"],
        ordered: json["ordered"],
        paymentId: json["payment_id"],
        singleProduct: json["single_product"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "item": List<dynamic>.from(item.map((x) => x.toJson())),
        "customer": customer,
        "trainer": trainer,
        "status": status,
        "cust": cust.toJson(),
        "gymtrainer": gymtrainer,
        "amount": amount,
        "promocode": promocode,
        "orderid": orderid,
        "ordered": ordered,
        "payment_id": paymentId,
        "single_product": singleProduct,
      };
}

class Cust {
  Cust({
    this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
  });

  int id;
  String firstName;
  String lastName;
  String phone;
  String email;

  factory Cust.fromJson(Map<String, dynamic> json) => Cust(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "email": email,
      };
}

class Item {
  Item({
    this.product,
    this.quantity,
    this.id,
    this.itemStatus,
    this.msg,
  });

  Product product;
  int quantity;
  int id;
  bool itemStatus;
  String msg;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        product: Product.fromJson(json["product"]),
        quantity: json["quantity"],
        id: json["id"],
        itemStatus: json["item_status"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "product": product.toJson(),
        "quantity": quantity,
        "id": id,
        "item_status": itemStatus,
        "msg": msg,
      };
}

class Product {
  Product({
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

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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

class GymTrainer {
  GymTrainer({
    this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
  });

  int id;
  String firstName;
  String lastName;
  String phone;
  String email;

  factory GymTrainer.fromJson(Map<String, dynamic> json) => GymTrainer(
        id: json["id"],
        firstName: json["first_Name"],
        lastName: json["last_Name"],
        phone: json["phone"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_Name": firstName,
        "last_Name": lastName,
        "phone": phone,
        "email": email,
      };
}

Future<List> getSupplementCart() async {
  ApiResponse cp = await ApiHelper()
      .getReq(endpoint: "https://p2c-gym.herokuapp.com/customer/cartview/");
  SharedPreferences sp = await SharedPreferences.getInstance();

  return [sp.getString("USER_TYPE"), cp];
}

void delSupplementItem(Map data) async {
  ApiResponse cp = await ApiHelper().postReq(
    endpoint: "https://p2c-gym.herokuapp.com/customer/removecart/",
    data: data,
  );
  if (cp.error) {
    Fluttertoast.showToast(msg: "Error in Deleting Item");
  } else {
    Fluttertoast.showToast(msg: "Item Deleted");
  }
}

void updateSupplementCartItem(Map data) async {
  ApiResponse cp = await ApiHelper().patchReq(
    endpoint: "https://p2c-gym.herokuapp.com/customer/cartview/",
    data: data,
  );
  if (cp.error) {
    Fluttertoast.showToast(msg: "Error in Updating Quantity");
  } else {
    Fluttertoast.showToast(msg: "Quantity Updated");
  }
}

void placeSupplementCart(Map data) async {
  ApiResponse cp = await ApiHelper().postReq(
    endpoint: "https://p2c-gym.herokuapp.com/website/confirmpayment/",
    data: data,
  );
  if (cp.error) {
    Fluttertoast.showToast(msg: "Can not Place Order");
  } else {
    Fluttertoast.showToast(msg: "Order Placed");
  }
}
