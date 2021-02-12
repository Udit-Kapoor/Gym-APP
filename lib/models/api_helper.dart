import 'dart:convert';
import 'dart:io';

import 'package:gym_app/models/api-response.dart';
import 'package:gym_app/models/login/rest_auth_login.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiHelper {
  Future<SharedPreferences> s = SharedPreferences.getInstance();

  Future login({String url, Map data}) async {
    Response login = await post(
      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
      body: jsonEncode(data),
    );
    return RestAuthLogin.fromJson(jsonDecode(login.body));
  }

  final sp = SharedPreferences.getInstance();
  Future<ApiResponse> postReq(
      {String endpoint, Map data, String query = ""}) async {
    final String url = endpoint + query;
    final _sp = await sp;
    try {
      Response postReq = await post(
        url,
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "TOKEN ${_sp.getString("AUTH_KEY")}"
        },
        body: jsonEncode(data),
      );
      return postReq.statusCode == 200
          ? ApiResponse(data: RestAuthLogin.fromJson(jsonDecode(postReq.body)))
          : ApiResponse(error: true);
    } on SocketException {
      return ApiResponse(error: true, errorMessage: "NO INTERN");
    } on HttpException {} catch (e) {
      return ApiResponse(error: true, errorMessage: e.toString());
    }
  }

  Future<ApiResponse> getReq(
      {String endpoint, Map data, String query = ""}) async {
    final String url = endpoint + query;
    final _sp = await sp;
    try {
      Response getReq = await get(
        url,
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "TOKEN ${_sp.getString("AUTH_KEY")}"
        },
      );
      return ApiResponse(data: RestAuthLogin.fromJson(jsonDecode(getReq.body)));
    } catch (e) {
      return ApiResponse(error: true, errorMessage: e.toString());
    }
  }
}
