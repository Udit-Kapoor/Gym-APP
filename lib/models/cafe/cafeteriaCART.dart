import 'dart:convert';

// To parse this JSON data, do
//
//     final cafeteriaCart = cafeteriaCartFromJson(jsonString);

import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_app/apis/api_helper.dart';
import 'package:gym_app/apis/api_response.dart';

List<CafeteriaCart> cafeteriaCartFromJson(String str) =>
    List<CafeteriaCart>.from(
        json.decode(str).map((x) => CafeteriaCart.fromJson(x)));

String cafeteriaCartToJson(List<CafeteriaCart> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CafeteriaCart {
  CafeteriaCart({
    this.id,
    this.orderedDate,
    this.paymentMethod,
    this.totalBill,
    this.name,
    this.phone,
    this.totalCost,
    this.tax,
    this.active,
    this.invoice,
    this.paymentid,
    this.orderid,
    this.paid,
    this.ordered,
    this.orderAccepted,
    this.reorder,
    this.orderReady,
    this.orderReceived,
    this.createdAt,
    this.trainer,
    this.employee,
    this.order,
  });

  int id;
  DateTime orderedDate;
  String paymentMethod;
  int totalBill;
  String name;
  dynamic phone;
  int totalCost;
  int tax;
  bool active;
  dynamic invoice;
  dynamic paymentid;
  dynamic orderid;
  bool paid;
  bool ordered;
  bool orderAccepted;
  bool reorder;
  bool orderReady;
  bool orderReceived;
  DateTime createdAt;
  dynamic trainer;
  dynamic employee;
  List<Order> order;

  factory CafeteriaCart.fromJson(Map<String, dynamic> json) => CafeteriaCart(
        id: json["id"],
        orderedDate: DateTime.parse(json["ordered_date"]),
        paymentMethod: json["payment_method"],
        totalBill: json["total_bill"],
        name: json["name"],
        phone: json["phone"],
        totalCost: json["total_cost"],
        tax: json["tax"],
        active: json["active"],
        invoice: json["invoice"],
        paymentid: json["paymentid"],
        orderid: json["orderid"],
        paid: json["paid"],
        ordered: json["ordered"],
        orderAccepted: json["order_accepted"],
        reorder: json["reorder"],
        orderReady: json["order_ready"],
        orderReceived: json["order_received"],
        createdAt: DateTime.parse(json["created_at"]),
        trainer: json["trainer"],
        employee: json["employee"],
        order: List<Order>.from(json["order"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ordered_date": orderedDate.toIso8601String(),
        "payment_method": paymentMethod,
        "total_bill": totalBill,
        "name": name,
        "phone": phone,
        "total_cost": totalCost,
        "tax": tax,
        "active": active,
        "invoice": invoice,
        "paymentid": paymentid,
        "orderid": orderid,
        "paid": paid,
        "ordered": ordered,
        "order_accepted": orderAccepted,
        "reorder": reorder,
        "order_ready": orderReady,
        "order_received": orderReceived,
        "created_at": createdAt.toIso8601String(),
        "trainer": trainer,
        "employee": employee,
        "order": List<dynamic>.from(order.map((x) => x.toJson())),
      };
}

class Order {
  Order({
    this.id,
    this.name,
    this.phone,
    this.quantity,
    this.orderCancel,
    this.price,
    this.createdAt,
    this.customer,
    this.trainer,
    this.item,
    this.employee,
  });

  int id;
  dynamic name;
  dynamic phone;
  int quantity;
  bool orderCancel;
  int price;
  DateTime createdAt;
  Customer customer;
  dynamic trainer;
  OrderItem item;
  dynamic employee;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        quantity: json["quantity"],
        orderCancel: json["order_cancel"],
        price: json["price"],
        createdAt: DateTime.parse(json["created_at"]),
        customer: Customer.fromJson(json["customer"]),
        trainer: json["trainer"],
        item: OrderItem.fromJson(json["item"]),
        employee: json["employee"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "quantity": quantity,
        "order_cancel": orderCancel,
        "price": price,
        "created_at": createdAt.toIso8601String(),
        "customer": customer.toJson(),
        "trainer": trainer,
        "item": item.toJson(),
        "employee": employee,
      };
}

class Customer {
  Customer({
    this.id,
    this.firstName,
    this.middleName,
    this.lastName,
    this.dateOfBirth,
    this.gender,
    this.phone,
    this.alternatePhone,
    this.email,
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.pincode,
    this.photo,
    this.idProof,
    this.idProofImage,
    this.idProofImage1,
    this.active,
    this.dateAdded,
    this.user,
    this.batchId,
  });

  int id;
  String firstName;
  dynamic middleName;
  String lastName;
  DateTime dateOfBirth;
  String gender;
  String phone;
  dynamic alternatePhone;
  String email;
  String address1;
  String address2;
  String city;
  String state;
  int pincode;
  dynamic photo;
  String idProof;
  dynamic idProofImage;
  dynamic idProofImage1;
  bool active;
  DateTime dateAdded;
  User user;
  BatchId batchId;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        firstName: json["first_name"],
        middleName: json["middle_name"],
        lastName: json["last_name"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        gender: json["gender"],
        phone: json["phone"],
        alternatePhone: json["alternate_phone"],
        email: json["email"],
        address1: json["address1"],
        address2: json["address2"],
        city: json["city"],
        state: json["state"],
        pincode: json["pincode"],
        photo: json["photo"],
        idProof: json["id_proof"],
        idProofImage: json["id_proof_image"],
        idProofImage1: json["id_proof_image1"],
        active: json["active"],
        dateAdded: DateTime.parse(json["date_added"]),
        user: User.fromJson(json["user"]),
        batchId: BatchId.fromJson(json["batch_id"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "middle_name": middleName,
        "last_name": lastName,
        "date_of_birth":
            "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "phone": phone,
        "alternate_phone": alternatePhone,
        "email": email,
        "address1": address1,
        "address2": address2,
        "city": city,
        "state": state,
        "pincode": pincode,
        "photo": photo,
        "id_proof": idProof,
        "id_proof_image": idProofImage,
        "id_proof_image1": idProofImage1,
        "active": active,
        "date_added":
            "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
        "user": user.toJson(),
        "batch_id": batchId.toJson(),
      };
}

class BatchId {
  BatchId({
    this.id,
    this.batchName,
    this.startdate,
    this.batchTimeTo,
    this.batchTimeFrom,
    this.limit,
    this.active,
    this.trainer,
    this.cust,
  });

  int id;
  String batchName;
  DateTime startdate;
  String batchTimeTo;
  String batchTimeFrom;
  int limit;
  bool active;
  int trainer;
  List<int> cust;

  factory BatchId.fromJson(Map<String, dynamic> json) => BatchId(
        id: json["id"],
        batchName: json["batch_name"],
        startdate: DateTime.parse(json["startdate"]),
        batchTimeTo: json["batch_time_to"],
        batchTimeFrom: json["batch_time_from"],
        limit: json["limit"],
        active: json["active"],
        trainer: json["trainer"],
        cust: List<int>.from(json["cust"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "batch_name": batchName,
        "startdate":
            "${startdate.year.toString().padLeft(4, '0')}-${startdate.month.toString().padLeft(2, '0')}-${startdate.day.toString().padLeft(2, '0')}",
        "batch_time_to": batchTimeTo,
        "batch_time_from": batchTimeFrom,
        "limit": limit,
        "active": active,
        "trainer": trainer,
        "cust": List<dynamic>.from(cust.map((x) => x)),
      };
}

class User {
  User({
    this.id,
    this.password,
    this.lastLogin,
    this.isSuperuser,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.isStaff,
    this.isActive,
    this.dateJoined,
    this.isAdmin,
    this.isEmployee,
    this.isTrainer,
    this.isCustomer,
    this.isWebuser,
    this.groups,
    this.userPermissions,
  });

  int id;
  String password;
  DateTime lastLogin;
  bool isSuperuser;
  String username;
  String firstName;
  String lastName;
  String email;
  bool isStaff;
  bool isActive;
  DateTime dateJoined;
  bool isAdmin;
  bool isEmployee;
  bool isTrainer;
  bool isCustomer;
  bool isWebuser;
  List<dynamic> groups;
  List<int> userPermissions;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        password: json["password"],
        lastLogin: DateTime.parse(json["last_login"]),
        isSuperuser: json["is_superuser"],
        username: json["username"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        isStaff: json["is_staff"],
        isActive: json["is_active"],
        dateJoined: DateTime.parse(json["date_joined"]),
        isAdmin: json["is_admin"],
        isEmployee: json["is_employee"],
        isTrainer: json["is_trainer"],
        isCustomer: json["is_customer"],
        isWebuser: json["is_webuser"],
        groups: List<dynamic>.from(json["groups"].map((x) => x)),
        userPermissions: List<int>.from(json["user_permissions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "password": password,
        "last_login": lastLogin.toIso8601String(),
        "is_superuser": isSuperuser,
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "is_staff": isStaff,
        "is_active": isActive,
        "date_joined": dateJoined.toIso8601String(),
        "is_admin": isAdmin,
        "is_employee": isEmployee,
        "is_trainer": isTrainer,
        "is_customer": isCustomer,
        "is_webuser": isWebuser,
        "groups": List<dynamic>.from(groups.map((x) => x)),
        "user_permissions": List<dynamic>.from(userPermissions.map((x) => x)),
      };
}

class OrderItem {
  OrderItem({
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
  ItemItem item;

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        id: json["id"],
        size: json["size"],
        price: json["price"],
        preparationTime: json["preparation_time"],
        active: json["active"],
        item: ItemItem.fromJson(json["item"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "size": size,
        "price": price,
        "preparation_time": preparationTime,
        "active": active,
        "item": item.toJson(),
      };
}

class ItemItem {
  ItemItem({
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
  dynamic type;
  bool active;
  int category;
  List<int> itemVarients;

  factory ItemItem.fromJson(Map<String, dynamic> json) => ItemItem(
        id: json["id"],
        name: json["name"],
        ingredients: json["ingredients"],
        photo: json["photo"],
        type: json["type"],
        active: json["active"],
        category: json["category"],
        itemVarients: List<int>.from(json["item_varients"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "ingredients": ingredients,
        "photo": photo,
        "type": type,
        "active": active,
        "category": category,
        "item_varients": List<dynamic>.from(itemVarients.map((x) => x)),
      };
}

Future<ApiResponse> getCart() async {
  ApiResponse cp = await ApiHelper().getReq(
      endpoint: "https://api.health2offer.com/facilities/cafeteria_cart/");
  return cp;
}

void delItem(int id) async {
  ApiResponse cp = await ApiHelper().deleteReq(
      endpoint: "https://api.health2offer.com/facilities/cafeteria_order/$id/");
  if (cp.error) {
    Fluttertoast.showToast(msg: "Error in Deleting Item");
  } else {
    Fluttertoast.showToast(msg: "Item Deleted");
  }
}

Future<bool> placeOrder(Map data) async {
  ApiResponse cp = await ApiHelper().postReq(
      endpoint: "https://api.health2offer.com/facilities/ordered_cart/",
      data: data);

  if (cp.error) {
    Fluttertoast.showToast(msg: "Order Not Placed");
  } else {
    Fluttertoast.showToast(msg: "Order Placed");
  }
  return cp.error;
}
