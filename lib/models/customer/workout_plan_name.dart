// To parse this JSON data, do
//
//     final workoutPlanNameModel = workoutPlanNameModelFromJson(jsonString);

import 'dart:convert';

import 'package:gym_app/apis/api_helper.dart';
import 'package:gym_app/apis/api_response.dart';

List<WorkoutPlanNameModel> workoutPlanNameModelFromJson(String str) =>
    List<WorkoutPlanNameModel>.from(
        json.decode(str).map((x) => WorkoutPlanNameModel.fromJson(x)));

String workoutPlanNameModelToJson(List<WorkoutPlanNameModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WorkoutPlanNameModel {
  WorkoutPlanNameModel({
    this.id,
    this.date,
    this.name,
    this.customer,
    this.workouts,
  });

  int id;
  DateTime date;
  String name;
  Customer customer;
  List<Workout> workouts;

  factory WorkoutPlanNameModel.fromJson(Map<String, dynamic> json) =>
      WorkoutPlanNameModel(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        name: json["name"],
        customer: Customer.fromJson(json["customer"]),
        workouts: List<Workout>.from(
            json["workouts"].map((x) => Workout.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "name": name,
        "customer": customer.toJson(),
        "workouts": List<dynamic>.from(workouts.map((x) => x.toJson())),
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
  dynamic photo;
  String idProof;
  dynamic idProofImage;
  dynamic idProofImage1;
  bool active;
  DateTime dateAdded;
  int user;
  int batchId;

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
        user: json["user"],
        batchId: json["batch_id"],
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
        "user": user,
        "batch_id": batchId,
      };
}

class Workout {
  Workout({
    this.id,
    this.name,
    this.muscle,
  });

  int id;
  String name;
  String muscle;

  factory Workout.fromJson(Map<String, dynamic> json) => Workout(
        id: json["id"],
        name: json["name"],
        muscle: json["muscle"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "muscle": muscle,
      };
}

Future<ApiResponse> workoutPlanFoo(int id) async {
  ApiResponse x = await ApiHelper().getReq(
      endpoint: "https://p2c-gym.herokuapp.com/customer/workoutplan/$id/list/");


  return x;
}
