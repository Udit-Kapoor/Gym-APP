// To parse this JSON data, do
//
//     final pastTrainerOrder = pastTrainerOrderFromJson(jsonString);

import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_app/apis/api_helper.dart';
import 'package:gym_app/apis/api_response.dart';

List<PastTrainerOrder> pastTrainerOrderFromJson(String str) =>
    List<PastTrainerOrder>.from(
        json.decode(str).map((x) => PastTrainerOrder.fromJson(x)));

String pastTrainerOrderToJson(List<PastTrainerOrder> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PastTrainerOrder {
  PastTrainerOrder({
    this.id,
    this.slot,
    this.startDate,
    this.endDate,
    this.amount,
  });

  int id;
  Slot slot;
  DateTime startDate;
  DateTime endDate;
  int amount;

  factory PastTrainerOrder.fromJson(Map<String, dynamic> json) =>
      PastTrainerOrder(
        id: json["id"],
        slot: Slot.fromJson(json["slot"]),
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slot": slot.toJson(),
        "startDate":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "endDate":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "amount": amount,
      };
}

class Slot {
  Slot({
    this.trainer,
  });

  Trainer trainer;

  factory Slot.fromJson(Map<String, dynamic> json) => Slot(
        trainer: Trainer.fromJson(json["trainer"]),
      );

  Map<String, dynamic> toJson() => {
        "trainer": trainer.toJson(),
      };
}

class Trainer {
  Trainer({
    this.firstName,
    this.lastName,
  });

  String firstName;
  String lastName;

  factory Trainer.fromJson(Map<String, dynamic> json) => Trainer(
        firstName: json["First_Name"],
        lastName: json["Last_Name"],
      );

  Map<String, dynamic> toJson() => {
        "First_Name": firstName,
        "Last_Name": lastName,
      };
}

Future<ApiResponse> getPastTrainerOrder() async {
  ApiResponse cp = await ApiHelper().getReq(
      endpoint:
          "https://api.health2offer.com/customer/Customer/pastbookedtrainer/");

  if (cp.error) {
    Fluttertoast.showToast(msg: "Unable to Fetch Details");
  } else {
    return cp;
  }
}
