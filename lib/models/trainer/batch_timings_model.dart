// To parse this JSON data, do
//
//     final clientListBatchwiseModel = batchTimingsModelFromJson(jsonString);

import 'dart:convert';

import 'package:gym_app/apis/api_helper.dart';
import 'package:gym_app/apis/api_response.dart';

List<BatchTimingsModel> batchTimingsModelFromJson(String str) =>
    List<BatchTimingsModel>.from(
        json.decode(str).map((x) => BatchTimingsModel.fromJson(x)));

String batchTimingsModelToJson(List<BatchTimingsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BatchTimingsModel {
  BatchTimingsModel({
    this.id,
    this.trainer,
    this.batchName,
    this.startdate,
    this.batchTimeTo,
    this.batchTimeFrom,
    this.limit,
    this.cust,
  });

  int id;
  Trainer trainer;
  String batchName;
  DateTime startdate;
  String batchTimeTo;
  String batchTimeFrom;
  int limit;
  List<int> cust;

  factory BatchTimingsModel.fromJson(Map<String, dynamic> json) =>
      BatchTimingsModel(
        id: json["id"],
        trainer: Trainer.fromJson(json["trainer"]),
        batchName: json["batch_name"],
        startdate: DateTime.parse(json["startdate"]),
        batchTimeTo: json["batch_time_to"],
        batchTimeFrom: json["batch_time_from"],
        limit: json["limit"],
        cust: List<int>.from(json["cust"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "trainer": trainer.toJson(),
        "batch_name": batchName,
        "startdate":
            "${startdate.year.toString().padLeft(4, '0')}-${startdate.month.toString().padLeft(2, '0')}-${startdate.day.toString().padLeft(2, '0')}",
        "batch_time_to": batchTimeTo,
        "batch_time_from": batchTimeFrom,
        "limit": limit,
        "cust": List<dynamic>.from(cust.map((x) => x)),
      };
}

class Trainer {
  Trainer({
    this.id,
    this.firstName,
    this.lastName,
  });

  int id;
  String firstName;
  String lastName;

  factory Trainer.fromJson(Map<String, dynamic> json) => Trainer(
        id: json["id"],
        firstName: json["first_Name"],
        lastName: json["last_Name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_Name": firstName,
        "last_Name": lastName,
      };
}

Future<ApiResponse> batchTimings() async {
  ApiResponse tp = await ApiHelper()
      .getReq(endpoint: "https://api.health2offer.com/trainer/trainerbatch/");

  return tp;
}
