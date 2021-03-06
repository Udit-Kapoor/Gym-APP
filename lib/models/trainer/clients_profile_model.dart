// To parse this JSON data, do
//
//     final clientsProfileModel = clientsProfileModelFromJson(jsonString);

import 'dart:convert';

import 'package:gym_app/apis/api_helper.dart';
import 'package:gym_app/apis/api_response.dart';

ClientsProfileModel clientsProfileModelFromJson(String str) =>
    ClientsProfileModel.fromJson(json.decode(str));

String clientsProfileModelToJson(ClientsProfileModel data) =>
    json.encode(data.toJson());

class ClientsProfileModel {
  ClientsProfileModel({
    this.id,
    this.cid,
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
    this.dateAdded,
    this.user,
  });

  int id;
  String cid;
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
  String idProofImage;
  dynamic idProofImage1;
  DateTime dateAdded;
  int user;

  factory ClientsProfileModel.fromJson(Map<String, dynamic> json) =>
      ClientsProfileModel(
        id: json["id"],
        cid: json["cid"],
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
        dateAdded: DateTime.parse(json["date_added"]),
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cid": cid,
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
        "date_added":
            "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
        "user": user,
      };
}

Future<ApiResponse> clientsProfile(int id) async {
  ApiResponse x = await ApiHelper().postReq(
    endpoint: "https://p2c-gym.herokuapp.com/customer/trainerprofile/",
    data: {"id": id},
  );
  return x;
}
