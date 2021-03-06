// To parse this JSON data, do
//
//     final trainerAttendanceModel = trainerAttendanceModelFromJson(jsonString);

import 'dart:convert';

import 'package:gym_app/apis/api_helper.dart';
import 'package:gym_app/apis/api_response.dart';

TrainerAttendanceModel trainerAttendanceModelFromJson(String str) => TrainerAttendanceModel.fromJson(json.decode(str));

String trainerAttendanceModelToJson(TrainerAttendanceModel data) => json.encode(data.toJson());

class TrainerAttendanceModel {
    TrainerAttendanceModel({
        this.list,
        this.percentage,
    });

    List<List<String>> list;
    double percentage;

    factory TrainerAttendanceModel.fromJson(Map<String, dynamic> json) => TrainerAttendanceModel(
        list: List<List<String>>.from(json["list"].map((x) => List<String>.from(x.map((x) => x)))),
        percentage: json["percentage"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "percentage": percentage,
    };
}


Future<ApiResponse> trainerAttendance(int id) async {
  ApiResponse cp = await ApiHelper()
      .getReq(endpoint: "https://p2c-gym.herokuapp.com/trainer/attendancetrainer/$id/");

  return cp;
}
