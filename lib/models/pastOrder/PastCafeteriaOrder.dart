// To parse this JSON data, do
//
//     final cafeteriaPastOder = cafeteriaPastOderFromJson(jsonString);

import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_app/apis/api_helper.dart';
import 'package:gym_app/apis/api_response.dart';

List<CafeteriaPastOder> cafeteriaPastOderFromJson(String str) =>
    List<CafeteriaPastOder>.from(
        json.decode(str).map((x) => CafeteriaPastOder.fromJson(x)));

String cafeteriaPastOderToJson(List<CafeteriaPastOder> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CafeteriaPastOder {
  CafeteriaPastOder({
    this.cart,
  });

  Cart cart;

  factory CafeteriaPastOder.fromJson(Map<String, dynamic> json) =>
      CafeteriaPastOder(
        cart: Cart.fromJson(json["cart"]),
      );

  Map<String, dynamic> toJson() => {
        "cart": cart.toJson(),
      };
}

class Cart {
  Cart({
    this.order,
  });

  List<Order> order;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        order: List<Order>.from(json["order"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
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
  String name;
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
  FirstNameEnum firstName;
  dynamic middleName;
  CustomerLastName lastName;
  DateTime dateOfBirth;
  Gender gender;
  String phone;
  dynamic alternatePhone;
  Email email;
  String address1;
  String address2;
  City city;
  City state;
  int pincode;
  dynamic photo;
  IdProof idProof;
  dynamic idProofImage;
  dynamic idProofImage1;
  bool active;
  DateTime dateAdded;
  User user;
  BatchId batchId;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        firstName: firstNameEnumValues.map[json["first_name"]],
        middleName: json["middle_name"],
        lastName: customerLastNameValues.map[json["last_name"]],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        gender: genderValues.map[json["gender"]],
        phone: json["phone"],
        alternatePhone: json["alternate_phone"],
        email: emailValues.map[json["email"]],
        address1: json["address1"],
        address2: json["address2"],
        city: cityValues.map[json["city"]],
        state: cityValues.map[json["state"]],
        pincode: json["pincode"],
        photo: json["photo"],
        idProof: idProofValues.map[json["id_proof"]],
        idProofImage: json["id_proof_image"],
        idProofImage1: json["id_proof_image1"],
        active: json["active"],
        dateAdded: DateTime.parse(json["date_added"]),
        user: User.fromJson(json["user"]),
        batchId: BatchId.fromJson(json["batch_id"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstNameEnumValues.reverse[firstName],
        "middle_name": middleName,
        "last_name": customerLastNameValues.reverse[lastName],
        "date_of_birth":
            "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "gender": genderValues.reverse[gender],
        "phone": phone,
        "alternate_phone": alternatePhone,
        "email": emailValues.reverse[email],
        "address1": address1,
        "address2": address2,
        "city": cityValues.reverse[city],
        "state": cityValues.reverse[state],
        "pincode": pincode,
        "photo": photo,
        "id_proof": idProofValues.reverse[idProof],
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
  BatchName batchName;
  DateTime startdate;
  String batchTimeTo;
  String batchTimeFrom;
  int limit;
  bool active;
  int trainer;
  List<int> cust;

  factory BatchId.fromJson(Map<String, dynamic> json) => BatchId(
        id: json["id"],
        batchName: batchNameValues.map[json["batch_name"]],
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
        "batch_name": batchNameValues.reverse[batchName],
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

enum BatchName { PAWAN_EVENING_510_PM }

final batchNameValues =
    EnumValues({"Pawan Evening 5-10 pm": BatchName.PAWAN_EVENING_510_PM});

enum City { DELHI }

final cityValues = EnumValues({"delhi": City.DELHI});

enum Email { TEST_GMAIL_COM }

final emailValues = EnumValues({"test@gmail.com": Email.TEST_GMAIL_COM});

enum FirstNameEnum { TEST }

final firstNameEnumValues = EnumValues({"test": FirstNameEnum.TEST});

enum Gender { MALE }

final genderValues = EnumValues({"Male": Gender.MALE});

enum IdProof { PAN_CARD }

final idProofValues = EnumValues({"Pan Card": IdProof.PAN_CARD});

enum CustomerLastName { KUMAR }

final customerLastNameValues = EnumValues({"kumar": CustomerLastName.KUMAR});

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
  FirstNameEnum username;
  FirstName firstName;
  UserLastName lastName;
  Email email;
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
        username: firstNameEnumValues.map[json["username"]],
        firstName: firstNameValues.map[json["first_name"]],
        lastName: userLastNameValues.map[json["last_name"]],
        email: emailValues.map[json["email"]],
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
        "username": firstNameEnumValues.reverse[username],
        "first_name": firstNameValues.reverse[firstName],
        "last_name": userLastNameValues.reverse[lastName],
        "email": emailValues.reverse[email],
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

enum FirstName { UDIT }

final firstNameValues = EnumValues({"Udit": FirstName.UDIT});

enum UserLastName { TESTING }

final userLastNameValues = EnumValues({"testing": UserLastName.TESTING});

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
  Size size;
  int price;
  String preparationTime;
  bool active;
  ItemItem item;

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        id: json["id"],
        size: sizeValues.map[json["size"]],
        price: json["price"],
        preparationTime: json["preparation_time"],
        active: json["active"],
        item: ItemItem.fromJson(json["item"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "size": sizeValues.reverse[size],
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
        "name": nameEnumValues.reverse[name],
        "ingredients": ingredientsValues.reverse[ingredients],
        "photo": photo,
        "type": type,
        "active": active,
        "category": category,
        "item_varients": List<dynamic>.from(itemVarients.map((x) => x)),
      };
}

enum Ingredients { ELAYACHI }

final ingredientsValues = EnumValues({"elayachi": Ingredients.ELAYACHI});

enum NameEnum { COFFE }

final nameEnumValues = EnumValues({"coffe": NameEnum.COFFE});

enum Size { M, S }

final sizeValues = EnumValues({"M": Size.M, "S": Size.S});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

Future<ApiResponse> getPastCafeOrder() async {
  ApiResponse cp = await ApiHelper().getReq(
      endpoint:
          "http://api.health2offer.com/customer/CustomerPastOrderedView/");

  if (cp.error) {
    Fluttertoast.showToast(msg: "Unable to Fetch Details");
  } else {
    return cp;
  }
}
