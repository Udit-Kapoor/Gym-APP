// To parse this JSON data, do
//
//inal trainerProfileModel = trainerProfileModelFromJson(jsonString);

import 'dart:convert';

import 'package:gym_app/lib.dart';

TrainerProfileModel trainerProfileModelFromJson(String str) =>
    TrainerProfileModel.fromJson(json.decode(str));

String trainerProfileModelToJson(TrainerProfileModel data) =>
    json.encode(data.toJson());

class TrainerProfileModel {
  TrainerProfileModel({
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
  String idProofImage;
  String resume;
  DateTime joiningDate;
  int salary;
  DateTime salaryDueDate;
  DateTime releasingDate;
  bool active;
  DateTime dateAdded;
  dynamic tid;
  int user;

  factory TrainerProfileModel.fromJson(Map<String, dynamic> json) =>
      TrainerProfileModel(
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
        resume: json["resume"],
        joiningDate: DateTime.parse(json["joining_date"]),
        salary: json["salary"],
        salaryDueDate: DateTime.parse(json["salary_due_date"]),
        releasingDate: DateTime.parse(json["releasing_date"]),
        active: json["active"],
        dateAdded: DateTime.parse(json["date_added"]),
        tid: json["tid"],
        user: json["user"],
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
        "user": user,
      };
}

Future<ApiResponse> trainerPro() async {
  ApiResponse tp = await ApiHelper()
      .getReq(endpoint: "https://api.health2offer.com/trainer/myprofile/");

  return tp;
}
