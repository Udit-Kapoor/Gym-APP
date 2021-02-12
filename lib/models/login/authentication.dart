import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:gym_app/models/login/rest_auth_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Authentication with ChangeNotifier {
  static Future<void> login(String number, String pass) async {
    const url = 'https://p2c-gym.herokuapp.com/rest-auth/login/';
    try {
      final response = await http.post(url,
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
          body: json.encode({
            'username': number,
            'password': pass,
            //'returnSecureToken': true,
          }));
      final responseData = RestAuthLogin.fromJson(json.decode(response.body));
      print(responseData.key);
      if (responseData.key == null) {
        throw HttpException("error");
      }
    } catch (error) {
      throw error;
    }
  }
}
