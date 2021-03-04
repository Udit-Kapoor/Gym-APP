// To parse this JSON data, do
//
//     final customerAttendanceModel = customerAttendanceModelFromJson(jsonString);

import 'dart:convert';

import 'package:gym_app/apis/api_helper.dart';
import 'package:gym_app/apis/api_response.dart';

CustomerAttendanceModel customerAttendanceModelFromJson(String str) =>
    CustomerAttendanceModel.fromJson(json.decode(str));

String customerAttendanceModelToJson(CustomerAttendanceModel data) =>
    json.encode(data.toJson());

class CustomerAttendanceModel {
  CustomerAttendanceModel({
    this.list,
    this.percentage,
    this.totalAttendanceNumerator,
    this.totalAttendanceDenominator,
  });

  List<List<String>> list;
  double percentage;
  int totalAttendanceNumerator;
  int totalAttendanceDenominator;

  factory CustomerAttendanceModel.fromJson(Map<String, dynamic> json) =>
      CustomerAttendanceModel(
        list: List<List<String>>.from(
            json["list"].map((x) => List<String>.from(x.map((x) => x)))),
        percentage: json["percentage"].toDouble(),
        totalAttendanceNumerator: json["total_attendance_numerator"],
        totalAttendanceDenominator: json["total_attendance_denominator"],
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(
            list.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "percentage": percentage,
        "total_attendance_numerator": totalAttendanceNumerator,
        "total_attendance_denominator": totalAttendanceDenominator,
      };
}

Future<ApiResponse> customerAttendance() async {
  ApiResponse cp = await ApiHelper()
      .getReq(endpoint: "https://p2c-gym.herokuapp.com/customer/myattendance/");
  print(cp.data);
  print(cp.error);
  print(cp.errorMessage);
  
  
  return cp;
}
