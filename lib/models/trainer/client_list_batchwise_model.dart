// To parse this JSON data, do
//
//     final clientListBatchwiseModel = clientListBatchwiseModelFromJson(jsonString);

import 'dart:convert';

import 'package:gym_app/apis/api_helper.dart';
import 'package:gym_app/apis/api_response.dart';

List<ClientListBatchwiseModel> clientListBatchwiseModelFromJson(String str) =>
    List<ClientListBatchwiseModel>.from(
        json.decode(str).map((x) => ClientListBatchwiseModel.fromJson(x)));

String clientListBatchwiseModelToJson(List<ClientListBatchwiseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClientListBatchwiseModel {
  ClientListBatchwiseModel({
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

  factory ClientListBatchwiseModel.fromJson(Map<String, dynamic> json) =>
      ClientListBatchwiseModel(
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

Future<ApiResponse> clientListBatchwise() async {
  ApiResponse tp = await ApiHelper()
      .getReq(endpoint: "http://p2c-gym.herokuapp.com/trainer/trainerbatch/");
  
  return tp;
}
