// To parse this JSON data, do
//
//     final dietEnquiry = dietEnquiryFromJson(jsonString);

import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_app/apis/api_helper.dart';
import 'package:gym_app/apis/api_response.dart';

DietEnquiry dietEnquiryFromJson(String str) =>
    DietEnquiry.fromJson(json.decode(str));

String dietEnquiryToJson(DietEnquiry data) => json.encode(data.toJson());

class DietEnquiry {
  DietEnquiry({
    this.partner,
    this.fitnessGoal,
    this.dietPreference,
    this.name,
    this.mobileNumber,
    this.email,
    this.gender,
    this.age,
    this.weight,
    this.height,
    this.physicalActivity,
    this.foodPreference,
    this.specialInstruction,
    this.plan,
    this.typeOfMeal,
    this.duration,
    this.address,
    this.city,
    this.state,
    this.pincode,
    this.paymentMode,
  });

  String partner;
  String fitnessGoal;
  String dietPreference;
  String name;
  String mobileNumber;
  String email;
  String gender;
  int age;
  int weight;
  int height;
  String physicalActivity;
  String foodPreference;
  String specialInstruction;
  String plan;
  String typeOfMeal;
  String duration;
  String address;
  String city;
  String state;
  int pincode;
  String paymentMode;

  factory DietEnquiry.fromJson(Map<String, dynamic> json) => DietEnquiry(
        partner: json["partner"],
        fitnessGoal: json["fitness_goal"],
        dietPreference: json["diet_preference"],
        name: json["name"],
        mobileNumber: json["mobile_number"],
        email: json["email"],
        gender: json["gender"],
        age: json["age"],
        weight: json["weight"],
        height: json["height"],
        physicalActivity: json["physical_activity"],
        foodPreference: json["food_preference"],
        specialInstruction: json["special_instruction"],
        plan: json["plan"],
        typeOfMeal: json["type_of_meal"],
        duration: json["duration"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        pincode: json["pincode"],
        paymentMode: json["payment_mode"],
      );

  Map<String, dynamic> toJson() => {
        "partner": partner,
        "fitness_goal": fitnessGoal,
        "diet_preference": dietPreference,
        "name": name,
        "mobile_number": mobileNumber,
        "email": email,
        "gender": gender,
        "age": age,
        "weight": weight,
        "height": height,
        "physical_activity": physicalActivity,
        "food_preference": foodPreference,
        "special_instruction": specialInstruction,
        "plan": plan,
        "type_of_meal": typeOfMeal,
        "duration": duration,
        "address": address,
        "city": city,
        "state": state,
        "pincode": pincode,
        "payment_mode": paymentMode,
      };
}

void submitDietEnquiry(Map data) async {
  ApiResponse cp = await ApiHelper().postReq(
    endpoint: "https://api.health2offer.com/website/dietenquiry/",
    data: data,
  );
  if (cp.error) {
    Fluttertoast.showToast(msg: "Error in Submitting Request");
  } else {
    Fluttertoast.showToast(msg: "Request Submitted");
  }
}
