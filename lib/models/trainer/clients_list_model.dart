// To parse this JSON data, do
//
//     final clientsListModel = clientsListModelFromJson(jsonString);

import 'dart:convert';

import 'package:gym_app/apis/api_helper.dart';
import 'package:gym_app/apis/api_response.dart';

ClientsListModel clientsListModelFromJson(String str) =>
    ClientsListModel.fromJson(json.decode(str));

String clientsListModelToJson(ClientsListModel data) =>
    json.encode(data.toJson());

class ClientsListModel {
  ClientsListModel({
    this.id,
    this.trainer,
    this.cust,
    this.batchName,
    this.startdate,
    this.batchTimeTo,
    this.batchTimeFrom,
    this.limit,
  });

  int id;
  Trainer trainer;
  List<Cust> cust;
  String batchName;
  DateTime startdate;
  String batchTimeTo;
  String batchTimeFrom;
  int limit;

  factory ClientsListModel.fromJson(Map<String, dynamic> json) =>
      ClientsListModel(
        id: json["id"],
        trainer: Trainer.fromJson(json["trainer"]),
        cust: List<Cust>.from(json["cust"].map((x) => Cust.fromJson(x))),
        batchName: json["batch_name"],
        startdate: DateTime.parse(json["startdate"]),
        batchTimeTo: json["batch_time_to"],
        batchTimeFrom: json["batch_time_from"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "trainer": trainer.toJson(),
        "cust": List<dynamic>.from(cust.map((x) => x.toJson())),
        "batch_name": batchName,
        "startdate":
            "${startdate.year.toString().padLeft(4, '0')}-${startdate.month.toString().padLeft(2, '0')}-${startdate.day.toString().padLeft(2, '0')}",
        "batch_time_to": batchTimeTo,
        "batch_time_from": batchTimeFrom,
        "limit": limit,
      };
}

class Cust {
  Cust({
    this.id,
    this.custid,
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
  String custid;
  String firstName;
  String middleName;
  String lastName;
  DateTime dateOfBirth;
  String gender;
  String phone;
  String alternatePhone;
  String email;
  String address1;
  String address2;
  String city;
  String state;
  int pincode;
  String photo;
  String idProof;
  dynamic idProofImage;
  dynamic idProofImage1;
  bool active;
  DateTime dateAdded;
  int user;
  int batchId;

  factory Cust.fromJson(Map<String, dynamic> json) => Cust(
        id: json["id"],
        custid: json["custid"] == null ? null : json["custid"],
        firstName: json["first_name"],
        middleName: json["middle_name"] == null ? null : json["middle_name"],
        lastName: json["last_name"],
        dateOfBirth: json["date_of_birth"] == null
            ? null
            : DateTime.parse(json["date_of_birth"]),
        gender: json["gender"],
        phone: json["phone"],
        alternatePhone:
            json["alternate_phone"] == null ? null : json["alternate_phone"],
        email: json["email"],
        address1: json["address1"],
        address2: json["address2"],
        city: json["city"],
        state: json["state"],
        pincode: json["pincode"] == null ? null : json["pincode"],
        photo: json["photo"] == null ? null : json["photo"],
        idProof: json["id_proof"],
        idProofImage: json["id_proof_image"],
        idProofImage1: json["id_proof_image1"],
        active: json["active"],
        dateAdded: DateTime.parse(json["date_added"]),
        user: json["user"],
        batchId: json["batch_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "custid": custid == null ? null : custid,
        "first_name": firstName,
        "middle_name": middleName == null ? null : middleName,
        "last_name": lastName,
        "date_of_birth": dateOfBirth == null
            ? null
            : "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "phone": phone,
        "alternate_phone": alternatePhone == null ? null : alternatePhone,
        "email": email,
        "address1": address1,
        "address2": address2,
        "city": city,
        "state": state,
        "pincode": pincode == null ? null : pincode,
        "photo": photo == null ? null : photo,
        "id_proof": idProof,
        "id_proof_image": idProofImage,
        "id_proof_image1": idProofImage1,
        "active": active,
        "date_added":
            "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
        "user": user,
        "batch_id": batchId,
      };
}

class Trainer {
  Trainer({
    this.id,
    this.firstName,
    this.lastName,
  });

  int id;
  String firstName;
  String lastName;

  factory Trainer.fromJson(Map<String, dynamic> json) => Trainer(
        id: json["id"],
        firstName: json["first_Name"],
        lastName: json["last_Name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_Name": firstName,
        "last_Name": lastName,
      };
}

Future<ApiResponse> clientList(int id) async {
  ApiResponse x = await ApiHelper().getReq(
    endpoint: "https://api.health2offer.com/trainer/batchdetail/$id/",
    // data: {"id": id},
  );
  return x;
}
