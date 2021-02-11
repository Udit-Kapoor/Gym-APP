import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'RecievedUser.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Authentication with ChangeNotifier {
  static Future<void> login(String number, String pass) async {
    const url = 'https://p2c-gym.herokuapp.com/rest-auth/login/';
    try {
      final response = await http.post(url,
          body: json.encode({
            'username': number,
            'password': pass,
            //'returnSecureToken': true,
          }));
      // print("successful try block");
      //final recievedUser = recievedUserFromJson(response.body);
      final responseData = json.decode(response.body);
      if (responseData['key'] != null) {
        throw HttpException("error");
      }
      //print(responseData);
    } catch (error) {
      throw error;
    }
  }
}
