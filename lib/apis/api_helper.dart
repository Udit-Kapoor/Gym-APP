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

  Future login({String url, Map data}) async {
    try {
      Response login = await post(
        url,
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: jsonEncode(data),
      );
      return login.statusCode >= 200 && login.statusCode <= 205
          ? ApiResponse(data: RestAuthLogin.fromJson(jsonDecode(login.body)))
          : ApiResponse(error: true);
    } on SocketException {
      return ApiResponse(error: true, errorMessage: "NO INTERNET");
    } on HttpException {
      return ApiResponse(error: true, errorMessage: "HTTP ERROR");
    } catch (e) {
      return ApiResponse(error: true, errorMessage: e.toString());
    }
  }

  Future<void> submit(BuildContext ctx, String number, String pass) async {
    final sp = await SharedPreferences.getInstance();
    ApiResponse login = await ApiHelper().login(
      url: "https://p2c-gym.herokuapp.com/rest-auth/login/",
      data: {"username": number, "password": pass},
    );
    if (!login.error) {
      sp.setString("AUTH_KEY", login.data.key);
      var ut = login.data.userType;
      if (ut.isCustomer) {
        sp.setString("USER_TYPE", "CUSTOMER");
        Navigator.pushReplacementNamed(ctx, '/CustomerHome');
      } else {
        sp.setString("USER_TYPE", "TRAINER");
        Navigator.pushReplacementNamed(ctx, '/TrainerHome');
      }
    } else {
      Fluttertoast.showToast(msg: "Authentication failed");
    }
  }

  Future logout(context) async {
    final _sp = await s;
    await post("https://p2c-gym.herokuapp.com/rest-auth/logout/")
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
