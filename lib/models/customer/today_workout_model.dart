// To parse this JSON data, do
//
//     final todayWorkoutModel = todayWorkoutModelFromJson(jsonString);

import 'dart:convert';

import 'package:gym_app/apis/api_helper.dart';
import 'package:gym_app/apis/api_response.dart';

TodayWorkoutModel todayWorkoutModelFromJson(String str) =>
    TodayWorkoutModel.fromJson(json.decode(str));

String todayWorkoutModelToJson(TodayWorkoutModel data) =>
    json.encode(data.toJson());

class TodayWorkoutModel {
  TodayWorkoutModel({
    this.date,
    this.name,
    this.workouts,
  });

  DateTime date;
  String name;
  List<int> workouts;

  factory TodayWorkoutModel.fromJson(Map<String, dynamic> json) =>
      TodayWorkoutModel(
        date: DateTime.parse(json["date"]),
        name: json["name"],
        workouts: List<int>.from(json["workouts"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "name": name,
        "workouts": List<dynamic>.from(workouts.map((x) => x)),
      };
}

Future<ApiResponse> todayWorkout() async {
  ApiResponse cp = await ApiHelper().getReq(
      endpoint: "https://api.health2offer.com/customer/mytodayworkout/");
  return cp;
}
