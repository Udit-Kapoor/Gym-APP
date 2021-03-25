// To parse this JSON data, do
//
//     final customerSubscriptionModel = customerSubscriptionModelFromJson(jsonString);

import 'package:gym_app/apis/api_helper.dart';
import 'package:gym_app/apis/api_response.dart';

import 'dart:convert';

CustomerSubscriptionModel customerSubscriptionModelFromJson(String str) =>
    CustomerSubscriptionModel.fromJson(json.decode(str));

String customerSubscriptionModelToJson(CustomerSubscriptionModel data) =>
    json.encode(data.toJson());

class CustomerSubscriptionModel {
  CustomerSubscriptionModel({
    this.healthIssues,
    this.dietPlan,
    this.exercisePlan,
    this.specialFacility,
    this.specialActivity,
    this.locker,
    this.trainername,
    this.batchTimeTo,
    this.batchTimeFrom,
    this.plan,
    this.startDate,
    this.endDate,
    this.motive,
  });

  String healthIssues;
  String dietPlan;
  ExercisePlan exercisePlan;
  List<ExercisePlan> specialFacility;
  List<ExercisePlan> specialActivity;
  Locker locker;
  String trainername;
  String batchTimeTo;
  String batchTimeFrom;
  Plan plan;
  DateTime startDate;
  DateTime endDate;
  String motive;

  factory CustomerSubscriptionModel.fromJson(Map<String, dynamic> json) =>
      CustomerSubscriptionModel(
        healthIssues: json["health_issues"],
        dietPlan: json["diet_plan"],
        exercisePlan: ExercisePlan.fromJson(json["exercise_plan"]),
        specialFacility: List<ExercisePlan>.from(
            json["special_facility"].map((x) => ExercisePlan.fromJson(x))),
        specialActivity: List<ExercisePlan>.from(
            json["special_activity"].map((x) => ExercisePlan.fromJson(x))),
        locker: Locker.fromJson(json["locker"]),
        trainername: json["trainername"],
        batchTimeTo: json["batch_time_to"],
        batchTimeFrom: json["batch_time_from"],
        plan: Plan.fromJson(json["plan"]),
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        motive: json["motive"],
      );

  Map<String, dynamic> toJson() => {
        "health_issues": healthIssues,
        "diet_plan": dietPlan,
        "exercise_plan": exercisePlan.toJson(),
        "special_facility":
            List<dynamic>.from(specialFacility.map((x) => x.toJson())),
        "special_activity":
            List<dynamic>.from(specialActivity.map((x) => x.toJson())),
        "locker": locker.toJson(),
        "trainername": trainername,
        "batch_time_to": batchTimeTo,
        "batch_time_from": batchTimeFrom,
        "plan": plan.toJson(),
        "start_date":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "motive": motive,
      };
}

class ExercisePlan {
  ExercisePlan({
    this.id,
    this.name,
    this.active,
  });

  int id;
  String name;
  bool active;

  factory ExercisePlan.fromJson(Map<String, dynamic> json) => ExercisePlan(
        id: json["id"],
        name: json["name"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "active": active,
      };
}

class Locker {
  Locker({
    this.id,
    this.name,
    this.active,
    this.permanent,
    this.customer,
  });

  int id;
  String name;
  bool active;
  bool permanent;
  dynamic customer;

  factory Locker.fromJson(Map<String, dynamic> json) => Locker(
        id: json["id"],
        name: json["name"],
        active: json["active"],
        permanent: json["permanent"],
        customer: json["customer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "active": active,
        "permanent": permanent,
        "customer": customer,
      };
}

class Plan {
  Plan({
    this.id,
    this.name,
    this.months,
    this.amount,
    this.active,
    this.details,
  });

  int id;
  String name;
  int months;
  int amount;
  bool active;
  String details;

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        id: json["id"],
        name: json["name"],
        months: json["months"],
        amount: json["amount"],
        active: json["active"],
        details: json["details"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "months": months,
        "amount": amount,
        "active": active,
        "details": details,
      };
}

Future<ApiResponse> customerGymSub() async {
  ApiResponse cp = await ApiHelper()
      .getReq(endpoint: "https://api.health2offer.com/customer/profileadd/");
  return cp;
}
