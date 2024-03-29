import 'package:gym_app/apis/api_helper.dart';
import 'package:gym_app/apis/api_response.dart'; // To parse this JSON data, do
//
//     final myTrainerModel = myTrainerModelFromJson(jsonString);

import 'dart:convert';

MyTrainerModel myTrainerModelFromJson(String str) =>
    MyTrainerModel.fromJson(json.decode(str));

String myTrainerModelToJson(MyTrainerModel data) => json.encode(data.toJson());

class MyTrainerModel {
  MyTrainerModel({
    this.id,
    this.firstName,
    this.lastName,
    this.image,
    this.dob,
    this.gender,
    this.address1,
    this.averageRating,
    this.phone,
  });

  int id;
  String firstName;
  String lastName;
  String image;
  DateTime dob;
  String gender;
  String address1;
  int averageRating;
  String phone;

  factory MyTrainerModel.fromJson(Map<String, dynamic> json) => MyTrainerModel(
        id: json["id"],
        firstName: json["first_Name"],
        lastName: json["last_Name"],
        image: json["image"],
        dob: DateTime.parse(json["DOB"]),
        gender: json["gender"],
        address1: json["Address1"],
        averageRating: json["average_rating"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_Name": firstName,
        "last_Name": lastName,
        "image": image,
        "DOB":
            "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "Address1": address1,
        "average_rating": averageRating,
        "phone": phone,
      };
}

Future<ApiResponse> myTrainer() async {
  ApiResponse cp = await ApiHelper()
      .getReq(endpoint: "https://api.health2offer.com/core/mytrainer/");
  return cp;
}
