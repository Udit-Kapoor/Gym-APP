// To parse this JSON data, do
//
//     final trainerReviewModel = trainerReviewModelFromJson(jsonString);

import 'dart:convert';


import '../../lib.dart';

List<TrainerReviewModel> trainerReviewModelFromJson(String str) => List<TrainerReviewModel>.from(json.decode(str).map((x) => TrainerReviewModel.fromJson(x)));

String trainerReviewModelToJson(List<TrainerReviewModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TrainerReviewModel {
    TrainerReviewModel({
        this.id,
        this.feedback,
        this.date,
        this.rating,
        this.source,
        this.user,
        this.trainer,
    });

    int id;
    String feedback;
    DateTime date;
    String rating;
    String source;
    int user;
    int trainer;

    factory TrainerReviewModel.fromJson(Map<String, dynamic> json) => TrainerReviewModel(
        id: json["id"],
        feedback: json["feedback"],
        date: DateTime.parse(json["date"]),
        rating: json["rating"],
        source: json["source"],
        user: json["user"],
        trainer: json["trainer"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "feedback": feedback,
        "date": date.toIso8601String(),
        "rating": rating,
        "source": source,
        "user": user,
        "trainer": trainer,
    };
}



Future<ApiResponse> trainerReview() async {
  ApiResponse cp = await ApiHelper().getReq(
      endpoint: "https://api.health2offer.com/core/trainerfeedback/");
  return cp;
}
