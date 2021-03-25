import 'package:gym_app/apis/api_helper.dart';
import 'package:gym_app/apis/api_response.dart';
// To parse this JSON data, do
//
//     final clientsGymSubModel = clientsGymSubModelFromMap(jsonString);

import 'dart:convert';

ClientsGymSubModel clientsGymSubModelFromMap(String str) =>
    ClientsGymSubModel.fromMap(json.decode(str));

String clientsGymSubModelToMap(ClientsGymSubModel data) =>
    json.encode(data.toMap());

class ClientsGymSubModel {
  ClientsGymSubModel({
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

  factory ClientsGymSubModel.fromMap(Map<String, dynamic> json) =>
      ClientsGymSubModel(
        healthIssues: json["health_issues"],
        dietPlan: json["diet_plan"],
        exercisePlan: ExercisePlan.fromMap(json["exercise_plan"]),
        specialFacility: List<ExercisePlan>.from(
            json["special_facility"].map((x) => ExercisePlan.fromMap(x))),
        specialActivity: List<ExercisePlan>.from(
            json["special_activity"].map((x) => ExercisePlan.fromMap(x))),
        locker: Locker.fromMap(json["locker"]),
        trainername: json["trainername"],
        batchTimeTo: json["batch_time_to"],
        batchTimeFrom: json["batch_time_from"],
        plan: Plan.fromMap(json["plan"]),
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        motive: json["motive"],
      );

  Map<String, dynamic> toMap() => {
        "health_issues": healthIssues,
        "diet_plan": dietPlan,
        "exercise_plan": exercisePlan.toMap(),
        "special_facility":
            List<dynamic>.from(specialFacility.map((x) => x.toMap())),
        "special_activity":
            List<dynamic>.from(specialActivity.map((x) => x.toMap())),
        "locker": locker.toMap(),
        "trainername": trainername,
        "batch_time_to": batchTimeTo,
        "batch_time_from": batchTimeFrom,
        "plan": plan.toMap(),
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

  factory ExercisePlan.fromMap(Map<String, dynamic> json) => ExercisePlan(
        id: json["id"],
        name: json["name"],
        active: json["active"],
      );

  Map<String, dynamic> toMap() => {
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
  int customer;

  factory Locker.fromMap(Map<String, dynamic> json) => Locker(
        id: json["id"],
        name: json["name"],
        active: json["active"],
        permanent: json["permanent"],
        customer: json["customer"],
      );

  Map<String, dynamic> toMap() => {
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

  factory Plan.fromMap(Map<String, dynamic> json) => Plan(
        id: json["id"],
        name: json["name"],
        months: json["months"],
        amount: json["amount"],
        active: json["active"],
        details: json["details"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "months": months,
        "amount": amount,
        "active": active,
        "details": details,
      };
}

Future<ApiResponse> clientsGymSub(int id) async {
  ApiResponse x = await ApiHelper().postReq(
    endpoint: "https://api.health2offer.com/customer/trainerprofileadd/",
    data: {"id": id},
  );

  return x;
}
