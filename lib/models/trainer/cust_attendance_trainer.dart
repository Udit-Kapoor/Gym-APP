// To parse this JSON data, do
//
//     final custAttendanceTrainerModel = custAttendanceTrainerModelFromJson(jsonString);

import 'dart:convert';

import 'package:gym_app/apis/api_helper.dart';
import 'package:gym_app/apis/api_response.dart';

CustAttendanceTrainerModel custAttendanceTrainerModelFromJson(String str) =>
    CustAttendanceTrainerModel.fromJson(json.decode(str));

String custAttendanceTrainerModelToJson(CustAttendanceTrainerModel data) =>
    json.encode(data.toJson());

class CustAttendanceTrainerModel {
  CustAttendanceTrainerModel({
    this.list,
    this.percentage,
  });

  List<List<String>> list;
  double percentage;

  factory CustAttendanceTrainerModel.fromJson(Map<String, dynamic> json) =>
      CustAttendanceTrainerModel(
        list: List<List<String>>.from(
            json["list"].map((x) => List<String>.from(x.map((x) => x)))),
        percentage: json["percentage"],
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(
            list.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "percentage": percentage,
      };
}

Future<ApiResponse> clientAttendance(int id) async {
  ApiResponse cp = await ApiHelper().getReq(
      endpoint:
          "https://api.health2offer.com/customer/attendancecustomer/$id/");
  print('###################' + cp.data + '###################');
  return cp;
}
