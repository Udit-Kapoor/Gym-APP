// To parse this JSON data, do
//
//     final clientCountModel = clientCountModelFromJson(jsonString);

import 'dart:convert';

import 'package:gym_app/apis/api_helper.dart';
import 'package:gym_app/apis/api_response.dart';

ClientCountModel clientCountModelFromJson(String str) => ClientCountModel.fromJson(json.decode(str));

String clientCountModelToJson(ClientCountModel data) => json.encode(data.toJson());

class ClientCountModel {
    ClientCountModel({
        this.count,
    });

    int count;

    factory ClientCountModel.fromJson(Map<String, dynamic> json) => ClientCountModel(
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
    };
}



Future<ApiResponse> clientCount() async {

 ApiResponse x = await ApiHelper().getReq(
    endpoint: "https://api.health2offer.com/trainer/customercount/",
   
  );
  return x;


}