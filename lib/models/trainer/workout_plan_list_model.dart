// To parse this JSON data, do
//
//     final workoutsPlanListModel = workoutsPlanListModelFromJson(jsonString);

import 'dart:convert';

import 'package:gym_app/apis/api_helper.dart';
import 'package:gym_app/apis/api_response.dart';

List<WorkoutsPlanListModel> workoutsPlanListModelFromJson(String str) => List<WorkoutsPlanListModel>.from(json.decode(str).map((x) => WorkoutsPlanListModel.fromJson(x)));

String workoutsPlanListModelToJson(List<WorkoutsPlanListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WorkoutsPlanListModel {
    WorkoutsPlanListModel({
        this.id,
        this.name,
        this.muscle,
    });

    int id;
    String name;
    String muscle;

    factory WorkoutsPlanListModel.fromJson(Map<String, dynamic> json) => WorkoutsPlanListModel(
        id: json["id"],
        name: json["name"],
        muscle: json["muscle"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "muscle": muscle,
    };
}


Future<ApiResponse> workoutsPlanListClient() async {

 ApiResponse x = await ApiHelper().getReq(
    endpoint: "https://api.health2offer.com/customer/workoutlist/",
   
  );
  return x;


}