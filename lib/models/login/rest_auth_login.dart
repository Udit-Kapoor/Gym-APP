import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_app/apis/api_helper.dart';
import 'package:gym_app/apis/api_response.dart';

class RestAuthLogin {
  String key;
  int user;
  UserType userType;

  RestAuthLogin({this.key, this.user, this.userType});

  RestAuthLogin.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    user = json['user'];
    userType = json['user_type'] != null
        ? new UserType.fromJson(json['user_type'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['user'] = this.user;
    if (this.userType != null) {
      data['user_type'] = this.userType.toJson();
    }
    return data;
  }
}

class UserType {
  bool isAdmin;
  bool isEmployee;
  bool isTrainer;
  bool isCustomer;
  bool isWebuser;

  UserType(
      {this.isAdmin,
      this.isEmployee,
      this.isTrainer,
      this.isCustomer,
      this.isWebuser});

  UserType.fromJson(Map<String, dynamic> json) {
    isAdmin = json['is_admin'];
    isEmployee = json['is_employee'];
    isTrainer = json['is_trainer'];
    isCustomer = json['is_customer'];
    isWebuser = json['is_webuser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_admin'] = this.isAdmin;
    data['is_employee'] = this.isEmployee;
    data['is_trainer'] = this.isTrainer;
    data['is_customer'] = this.isCustomer;
    data['is_webuser'] = this.isWebuser;
    return data;
  }
}

void postForgotPass(Map data) async {
  ApiResponse cp = await ApiHelper().postReq(
      endpoint: "https://p2c-gym.herokuapp.com/rest-auth/password/reset/",
      data: data);

  if (cp.error) {
    Fluttertoast.showToast(msg: "Unable To Send Link");
  } else {
    Fluttertoast.showToast(msg: "Email Sent Successfully");
  }
}
