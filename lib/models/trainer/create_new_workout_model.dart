// To parse this JSON data, do
//
//     final createNewWorkoutModel = createNewWorkoutModelFromJson(jsonString);

import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';

import '../../lib.dart';

CreateNewWorkoutModel createNewWorkoutModelFromJson(String str) =>
    CreateNewWorkoutModel.fromJson(json.decode(str));

String createNewWorkoutModelToJson(CreateNewWorkoutModel data) =>
    json.encode(data.toJson());

class CreateNewWorkoutModel {
  CreateNewWorkoutModel({
    this.id,
    this.name,
    this.muscle,
  });

  int id;
  String name;
  String muscle;

  factory CreateNewWorkoutModel.fromJson(Map<String, dynamic> json) =>
      CreateNewWorkoutModel(
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

void createNewExercise(String name, String muscle) async {
  ApiResponse cp = await ApiHelper().postReq(
    endpoint: "https://api.health2offer.com/customer/workout/create/",
    data: {"name": name.trim(), "muscle": muscle},
  );
  if (cp.error) {
    Fluttertoast.showToast(msg: "Error in Submitting Request");
  } else {
    Fluttertoast.showToast(msg: "Created " + name.trim());
  }
}

void createNewWorkout(
    {int id, String name, List<int> wId, DateTime dateTime}) async {
  String formatedDate = '${dateTime.year}-${dateTime.month}-${dateTime.day}';

  ApiResponse cp = await ApiHelper().postReq(
    endpoint: "https://api.health2offer.com/customer/workoutplan/$id/",
    data: {"date": formatedDate, "name": name, "workouts": wId},
  );
  print(cp.errorMessage);
  if (cp.error) {
    Fluttertoast.showToast(msg: "Error in Submitting Request");
  } else {
    Fluttertoast.showToast(msg: "Created " + name.trim());
  }
}
