// To parse this JSON data, do
//
//     final customerSubscriptionModel = customerSubscriptionModelFromJson(jsonString);

import 'dart:convert';

CustomerSubscriptionModel customerSubscriptionModelFromJson(String str) => CustomerSubscriptionModel.fromJson(json.decode(str));

String customerSubscriptionModelToJson(CustomerSubscriptionModel data) => json.encode(data.toJson());

class CustomerSubscriptionModel {
    CustomerSubscriptionModel({
        this.healthIssues,
        this.dietPlan,
        this.exercisePlan,
        this.specialFacility,
        this.specialActivity,
        this.locker,
        this.batchTimeTo,
        this.batchTimeFrom,
        this.plan,
        this.startDate,
        this.endDate,
        this.motive,
    });

    String healthIssues;
    String dietPlan;
    dynamic exercisePlan;
    List<SpecialIty> specialFacility;
    List<SpecialIty> specialActivity;
    dynamic locker;
    String batchTimeTo;
    String batchTimeFrom;
    Plan plan;
    DateTime startDate;
    dynamic endDate;
    String motive;

    factory CustomerSubscriptionModel.fromJson(Map<String, dynamic> json) => CustomerSubscriptionModel(
        healthIssues: json["health_issues"],
        dietPlan: json["diet_plan"],
        exercisePlan: json["exercise_plan"],
        specialFacility: List<SpecialIty>.from(json["special_facility"].map((x) => SpecialIty.fromJson(x))),
        specialActivity: List<SpecialIty>.from(json["special_activity"].map((x) => SpecialIty.fromJson(x))),
        locker: json["locker"],
        batchTimeTo: json["batch_time_to"],
        batchTimeFrom: json["batch_time_from"],
        plan: Plan.fromJson(json["plan"]),
        startDate: DateTime.parse(json["start_date"]),
        endDate: json["end_date"],
        motive: json["motive"],
    );

    Map<String, dynamic> toJson() => {
        "health_issues": healthIssues,
        "diet_plan": dietPlan,
        "exercise_plan": exercisePlan,
        "special_facility": List<dynamic>.from(specialFacility.map((x) => x.toJson())),
        "special_activity": List<dynamic>.from(specialActivity.map((x) => x.toJson())),
        "locker": locker,
        "batch_time_to": batchTimeTo,
        "batch_time_from": batchTimeFrom,
        "plan": plan.toJson(),
        "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date": endDate,
        "motive": motive,
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

class SpecialIty {
    SpecialIty({
        this.id,
        this.name,
        this.active,
    });

    int id;
    String name;
    bool active;

    factory SpecialIty.fromJson(Map<String, dynamic> json) => SpecialIty(
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
