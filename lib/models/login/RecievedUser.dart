import 'dart:convert';

RecievedUser recievedUserFromJson(String str) =>
    RecievedUser.fromJson(json.decode(str));

String recievedUserToJson(RecievedUser data) => json.encode(data.toJson());

class RecievedUser {
  RecievedUser({
    this.key,
    this.user,
    this.userType,
  });

  String key;
  int user;
  String userType;

  factory RecievedUser.fromJson(Map<String, dynamic> json) => RecievedUser(
        key: json["key"],
        user: json["user"],
        userType: UserType.fromJson(json["user_type"]).toString(),
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "user": user,
        "user_type": userType,
      };
}

class UserType {
  UserType({
    this.isAdmin,
    this.isEmployee,
    this.isTrainer,
    this.isCustomer,
    this.isWebuser,
  });

  bool isAdmin;
  bool isEmployee;
  bool isTrainer;
  bool isCustomer;
  bool isWebuser;

  factory UserType.fromJson(Map<String, dynamic> json) => UserType(
        isAdmin: json["is_admin"],
        isEmployee: json["is_employee"],
        isTrainer: json["is_trainer"],
        isCustomer: json["is_customer"],
        isWebuser: json["is_webuser"],
      );

  Map<String, dynamic> toJson() => {
        "is_admin": isAdmin,
        "is_employee": isEmployee,
        "is_trainer": isTrainer,
        "is_customer": isCustomer,
        "is_webuser": isWebuser,
      };
}
