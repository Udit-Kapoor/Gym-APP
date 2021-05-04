import 'package:gym_app/apis/api_helper.dart';
import 'package:gym_app/apis/api_response.dart';

// To parse this JSON data, do
//
//     final todayWorkoutModel = todayWorkoutModelFromJson(jsonString);

import 'dart:convert';

List<TodayWorkoutModel> todayWorkoutModelFromJson(String str) => List<TodayWorkoutModel>.from(json.decode(str).map((x) => TodayWorkoutModel.fromJson(x)));

String todayWorkoutModelToJson(List<TodayWorkoutModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodayWorkoutModel {
    TodayWorkoutModel({
        this.date,
        this.name,
        this.workouts,
    });

    DateTime date;
    String name;
    List<dynamic> workouts;

    factory TodayWorkoutModel.fromJson(Map<String, dynamic> json) => TodayWorkoutModel(
        date: DateTime.parse(json["date"]),
        name: json["name"],
        workouts: List<dynamic>.from(json["workouts"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "name": name,
        "workouts": List<dynamic>.from(workouts.map((x) => x)),
    };
}

Future<ApiResponse> todayWorkout() async {
  ApiResponse cp = await ApiHelper().getReq(
      endpoint: "https://api.health2offer.com/customer/mytodayworkout/");
  return cp;
}
