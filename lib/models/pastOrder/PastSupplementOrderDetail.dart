// To parse this JSON data, do
//
//     final supplementPastOrderDetail = supplementPastOrderDetailFromJson(jsonString);

import 'dart:convert';

SupplementPastOrderDetail supplementPastOrderDetailFromJson(String str) =>
    SupplementPastOrderDetail.fromJson(json.decode(str));

String supplementPastOrderDetailToJson(SupplementPastOrderDetail data) =>
    json.encode(data.toJson());

class SupplementPastOrderDetail {
  SupplementPastOrderDetail({
    this.id,
    this.cart,
    this.status,
    this.amount,
    this.date,
    this.paid,
    this.mop,
    this.address1,
    this.address2,
    this.landmark,
    this.city,
    this.state,
    this.pincode,
    this.mode,
    this.receivedBy,
    this.deliveryTime,
    this.deliveryDate,
    this.customer,
    this.cust,
    this.gymtrainer,
  });

  int id;
  Cart cart;
  String status;
  int amount;
  DateTime date;
  bool paid;
  String mop;
  String address1;
  String address2;
  String landmark;
  String city;
  String state;
  int pincode;
  String mode;
  String receivedBy;
  dynamic deliveryTime;
  dynamic deliveryDate;
  dynamic customer;
  int cust;
  dynamic gymtrainer;

  factory SupplementPastOrderDetail.fromJson(Map<String, dynamic> json) =>
      SupplementPastOrderDetail(
        id: json["id"],
        cart: Cart.fromJson(json["cart"]),
        status: json["status"],
        amount: json["amount"],
        date: DateTime.parse(json["date"]),
        paid: json["paid"],
        mop: json["MOP"],
        address1: json["Address1"],
        address2: json["Address2"],
        landmark: json["landmark"],
        city: json["city"],
        state: json["state"],
        pincode: json["pincode"],
        mode: json["mode"],
        receivedBy: json["received_by"],
        deliveryTime: json["delivery_time"],
        deliveryDate: json["delivery_date"],
        customer: json["customer"],
        cust: json["cust"],
        gymtrainer: json["gymtrainer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cart": cart.toJson(),
        "status": status,
        "amount": amount,
        "date": date.toIso8601String(),
        "paid": paid,
        "MOP": mop,
        "Address1": address1,
        "Address2": address2,
        "landmark": landmark,
        "city": city,
        "state": state,
        "pincode": pincode,
        "mode": mode,
        "received_by": receivedBy,
        "delivery_time": deliveryTime,
        "delivery_date": deliveryDate,
        "customer": customer,
        "cust": cust,
        "gymtrainer": gymtrainer,
      };
}

class Cart {
  Cart({
    this.item,
    this.paymentId,
    this.orderid,
    this.id,
  });

  List<Item> item;
  dynamic paymentId;
  String orderid;
  int id;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        item: List<Item>.from(json["item"].map((x) => Item.fromJson(x))),
        paymentId: json["payment_id"],
        orderid: json["orderid"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "item": List<dynamic>.from(item.map((x) => x.toJson())),
        "payment_id": paymentId,
        "orderid": orderid,
        "id": id,
      };
}

class Item {
  Item({
    this.product,
    this.quantity,
  });

  Product product;
  int quantity;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        product: Product.fromJson(json["product"]),
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "product": product.toJson(),
        "quantity": quantity,
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
  int price;
  bool isStock;
  String slug;
  int id;
  int weight;
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
