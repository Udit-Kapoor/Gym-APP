// To parse this JSON data, do
//
//     final cafeteriaPastOrderTrainer = cafeteriaPastOrderTrainerFromJson(jsonString);

import 'dart:convert';

List<CafeteriaPastOrderTrainer> cafeteriaPastOrderTrainerFromJson(String str) =>
    List<CafeteriaPastOrderTrainer>.from(
        json.decode(str).map((x) => CafeteriaPastOrderTrainer.fromJson(x)));

String cafeteriaPastOrderTrainerToJson(List<CafeteriaPastOrderTrainer> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CafeteriaPastOrderTrainer {
  CafeteriaPastOrderTrainer({
    this.cart,
  });

  Cart cart;

  factory CafeteriaPastOrderTrainer.fromJson(Map<String, dynamic> json) =>
      CafeteriaPastOrderTrainer(
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
  dynamic name;
  dynamic phone;
  int quantity;
  bool orderCancel;
  int price;
  DateTime createdAt;
  dynamic customer;
  Trainer trainer;
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
        customer: json["customer"],
        trainer: Trainer.fromJson(json["trainer"]),
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
        "customer": customer,
        "trainer": trainer.toJson(),
        "item": item.toJson(),
        "employee": employee,
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
  String type;
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

class Trainer {
  Trainer({
    this.id,
    this.firstName,
    this.middleName,
    this.lastName,
    this.dob,
    this.gender,
    this.phone,
    this.altPhone,
    this.email,
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.pincode,
    this.image,
    this.idProof,
    this.idProofImage,
    this.idProofImage1,
    this.resume,
    this.joiningDate,
    this.salary,
    this.salaryDueDate,
    this.releasingDate,
    this.active,
    this.dateAdded,
    this.tid,
    this.user,
  });

  int id;
  String firstName;
  dynamic middleName;
  String lastName;
  DateTime dob;
  String gender;
  String phone;
  String altPhone;
  String email;
  String address1;
  String address2;
  String city;
  String state;
  int pincode;
  String image;
  String idProof;
  dynamic idProofImage;
  dynamic idProofImage1;
  String resume;
  DateTime joiningDate;
  int salary;
  DateTime salaryDueDate;
  DateTime releasingDate;
  bool active;
  DateTime dateAdded;
  String tid;
  User user;

  factory Trainer.fromJson(Map<String, dynamic> json) => Trainer(
        id: json["id"],
        firstName: json["first_Name"],
        middleName: json["middle_Name"],
        lastName: json["last_Name"],
        dob: DateTime.parse(json["DOB"]),
        gender: json["gender"],
        phone: json["phone"],
        altPhone: json["alt_phone"],
        email: json["email"],
        address1: json["Address1"],
        address2: json["Address2"],
        city: json["city"],
        state: json["state"],
        pincode: json["pincode"],
        image: json["image"],
        idProof: json["id_proof"],
        idProofImage: json["id_proof_image"],
        idProofImage1: json["id_proof_image1"],
        resume: json["resume"],
        joiningDate: DateTime.parse(json["joining_date"]),
        salary: json["salary"],
        salaryDueDate: DateTime.parse(json["salary_due_date"]),
        releasingDate: DateTime.parse(json["releasing_date"]),
        active: json["active"],
        dateAdded: DateTime.parse(json["date_added"]),
        tid: json["tid"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_Name": firstName,
        "middle_Name": middleName,
        "last_Name": lastName,
        "DOB":
            "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "phone": phone,
        "alt_phone": altPhone,
        "email": email,
        "Address1": address1,
        "Address2": address2,
        "city": city,
        "state": state,
        "pincode": pincode,
        "image": image,
        "id_proof": idProof,
        "id_proof_image": idProofImage,
        "id_proof_image1": idProofImage1,
        "resume": resume,
        "joining_date":
            "${joiningDate.year.toString().padLeft(4, '0')}-${joiningDate.month.toString().padLeft(2, '0')}-${joiningDate.day.toString().padLeft(2, '0')}",
        "salary": salary,
        "salary_due_date":
            "${salaryDueDate.year.toString().padLeft(4, '0')}-${salaryDueDate.month.toString().padLeft(2, '0')}-${salaryDueDate.day.toString().padLeft(2, '0')}",
        "releasing_date":
            "${releasingDate.year.toString().padLeft(4, '0')}-${releasingDate.month.toString().padLeft(2, '0')}-${releasingDate.day.toString().padLeft(2, '0')}",
        "active": active,
        "date_added":
            "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
        "tid": tid,
        "user": user.toJson(),
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
  List<dynamic> userPermissions;

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
        userPermissions:
            List<dynamic>.from(json["user_permissions"].map((x) => x)),
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
