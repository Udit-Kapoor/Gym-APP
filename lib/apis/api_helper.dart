import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_app/lib.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiHelper {
  Future<SharedPreferences> s = SharedPreferences.getInstance();

  Future<List> autoLogin() async {
    SharedPreferences sp = await s;
    bool b = sp.containsKey("AUTH_KEY");
    String t;
    if (b) {
      t = sp.getString("USER_TYPE");
      return [b, t];
    }
    return [b];
  }

  Future<int> getUserObjectID() async {
    SharedPreferences sp = await s;
    return sp.getInt("USER_OBJECT_ID");
  }

  Future<bool> getIsTrainer() async {
    SharedPreferences sp = await s;
    String userType = sp.getString("USER_TYPE");

    if (userType == 'CUSTOMER') return false;

    return true;
  }

  Future login({String url, Map data}) async {
    SharedPreferences sp = await s;
    try {
      Response login = await post(
        "https://api.health2offer.com/rest-auth/login/",

        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: jsonEncode(data),
        // body: data,
      );
      if (login.statusCode >= 200 && login.statusCode <= 205) {
        var rA = restAuthLoginModelFromJson(login.body);
        sp.setString("AUTH_KEY", rA.key);

        return ApiResponse(data: rA);
      } else
        return ApiResponse(error: true);
    } on SocketException {
      return ApiResponse(error: true, errorMessage: "NO INTERNET");
    } on HttpException {
      return ApiResponse(error: true, errorMessage: "HTTP ERROR");
    } catch (e) {
      return ApiResponse(error: true, errorMessage: e.toString());
    }
  }

  Future changePassword(Map data) async {
    final _sp = await s;
    try {
      Response cp = await post(
        'https://api.health2offer.com/rest-auth/password/change/',
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "TOKEN ${_sp.getString("AUTH_KEY")}"
        },
        body: jsonEncode(data),
      );
      if (cp.statusCode >= 200 && cp.statusCode <= 205) {
        Fluttertoast.showToast(msg: "Password Changed");
      } else {
        Fluttertoast.showToast(msg: "Wrong Old Password");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> submit(BuildContext ctx, String number, String pass) async {
    final sp = await s;
    CircularProgressIndicator();
    ApiResponse login = await ApiHelper().login(
      data: {"username": number, "password": pass},
    );
    if (!login.error) {
      var ut = login.data.userType;
      if (ut.isCustomer) {
        sp.setString("USER_TYPE", "CUSTOMER");
        Navigator.pushReplacementNamed(ctx, '/CustomerHome');
      } else {
        sp.setString("USER_TYPE", "TRAINER");
        Navigator.pushReplacementNamed(ctx, '/TrainerHome');
      }

      bool isTrainer = await ApiHelper().getIsTrainer();

      ApiResponse userProfile =
          isTrainer ? await trainerPro() : await customerPro();

      if (isTrainer) {
        var cp = trainerProfileModelFromJson(userProfile.data);
        sp.setInt("USER_OBJECT_ID", cp.id);
      } else {
        var cp = customerProfileModelFromJson(userProfile.data);
        sp.setInt("USER_OBJECT_ID", cp.id);
      }
    } else {
      Fluttertoast.showToast(msg: "Authentication failed");
    }
  }

  Future logout(context) async {
    final _sp = await s;
    await post("https://api.health2offer.com/rest-auth/logout/")
        .then((value) => {
              if (value.statusCode >= 200 && value.statusCode <= 205)
                {
                  _sp.clear(),
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/LoginScreen', (route) => false),
                  Fluttertoast.showToast(msg: "Logout Successful"),
                }
              else
                {
                  Fluttertoast.showToast(msg: "Logout Failed"),
                }
            });
  }

  Future<ApiResponse> postReq(
      {String endpoint, Map data, String query = ""}) async {
    final String url = endpoint + query;
    final _sp = await s;
    try {
      Response postReq = await post(
        url,
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "TOKEN ${_sp.getString("AUTH_KEY")}"
        },
        body: jsonEncode(data),
      );
      return postReq.statusCode >= 200 && postReq.statusCode <= 205
          ? ApiResponse(data: postReq.body)
          : ApiResponse(error: true);
    } on SocketException {
      return ApiResponse(error: true, errorMessage: "NO INTERNET");
    } on HttpException {
      return ApiResponse(error: true, errorMessage: "HTTP Error");
    } catch (e) {
      return ApiResponse(error: true, errorMessage: e.toString());
    }
  }

  Future<ApiResponse> attendance(String key) async {
    final _sp = await s;
    bool isTrainer = await ApiHelper().getIsTrainer();


    int id = await ApiHelper().getUserObjectID();


    String query = isTrainer ? 'QRCodetrainer' : 'QRCodeCustomer';

    try {
      Response att = await post(
        'https://api.health2offer.com/core/$query/$id/',
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "TOKEN ${_sp.getString("AUTH_KEY")}"
        },
        body: jsonEncode({"secret_key": key}),
      );
      return att.statusCode >= 200 && att.statusCode <= 205
          ? ApiResponse(data: att.body)
          : ApiResponse(error: true, data: att.statusCode);
    } on SocketException {
      return ApiResponse(error: true, errorMessage: "NO INTERNET");
    } on HttpException {
      return ApiResponse(error: true, errorMessage: "HTTP Error");
    } catch (e) {
      return ApiResponse(error: true, errorMessage: e.toString());
    }
  }

  Future<ApiResponse> patchReq(
      {String endpoint, Map data, String query = ""}) async {
    final String url = endpoint + query;
    final _sp = await s;
    try {
      Response postReq = await patch(
        url,
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "TOKEN ${_sp.getString("AUTH_KEY")}"
        },
        body: jsonEncode(data),
      );
      return postReq.statusCode >= 200 && postReq.statusCode <= 205
          ? ApiResponse(data: postReq.body)
          : ApiResponse(error: true);
    } on SocketException {
      return ApiResponse(error: true, errorMessage: "NO INTERNET");
    } on HttpException {
      return ApiResponse(error: true, errorMessage: "HTTP Error");
    } catch (e) {
      return ApiResponse(error: true, errorMessage: e.toString());
    }
  }

  Future<ApiResponse> getReq({String endpoint, String query = ""}) async {
    final String url = endpoint + query;
    SharedPreferences _sp = await s;
    try {
      Response getReq = await get(
        url,
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "TOKEN ${_sp.getString("AUTH_KEY")}"
        },
      );

      return ApiResponse(data: getReq.body);
    } catch (e) {
      return ApiResponse(error: true, errorMessage: e.toString());
    }
  }

  Future<ApiResponse> deleteReq({String endpoint}) async {
    final String url = endpoint;
    final _sp = await s;
    try {
      Response delReq = await delete(
        url,
        headers: {
          HttpHeaders.authorizationHeader: "TOKEN ${_sp.getString("AUTH_KEY")}"
        },
      );
      return delReq.statusCode >= 200 && delReq.statusCode <= 205
          ? ApiResponse(data: delReq.body)
          : ApiResponse(error: true);
    } on SocketException {
      return ApiResponse(error: true, errorMessage: "NO INTERNET");
    } on HttpException {
      return ApiResponse(error: true, errorMessage: "HTTP Error");
    } catch (e) {
      return ApiResponse(error: true, errorMessage: e.toString());
    }
  }
}
