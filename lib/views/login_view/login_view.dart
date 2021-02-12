import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_app/models/api-response.dart';
import 'package:gym_app/models/api_helper.dart';
import 'package:gym_app/models/login/authentication.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _isCustomer = true;

  String number;
  String pass;
  Future<void> _submit() async {
    final sp = await SharedPreferences.getInstance();
    ApiResponse login = await ApiHelper().postReq(
      endpoint: "https://p2c-gym.herokuapp.com/rest-auth/login/",
      data: {"username": number, "password": pass},
    );
    sp.setString("AUTH_KEY", login.data.key);
    if (!login.error) {
      Navigator.pushNamed(context, '/CustomerHome');
    } else {
      Fluttertoast.showToast(msg: "Authentication failed");
    }
  }

  Widget _cusOrEmp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isCustomer = true;
            });
          },
          child: Container(
            height: 80,
            width: 80,
            child: Center(
              child: Text(
                'Customer',
                style: TextStyle(
                    color: _isCustomer ? Colors.white : Color(0xFF868686),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            decoration: BoxDecoration(
                border: Border.all(
                    color: _isCustomer ? Colors.white : Color(0xFF868686),
                    width: 2),
                shape: BoxShape.circle),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          height: 130,
          width: 1,
          color: Colors.white,
        ),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isCustomer = false;
            });
          },
          child: Container(
            height: 80,
            width: 80,
            child: Center(
              child: Text(
                'H2O \n Employee',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: _isCustomer ? Color(0xFF868686) : Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            decoration: BoxDecoration(
                border: Border.all(
                    color: _isCustomer ? Color(0xFF868686) : Colors.white,
                    width: 2),
                shape: BoxShape.circle),
          ),
        ),
      ],
    );
  }

  Widget _showForgotPass() {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20.0)), //this right here
                  child: Container(
                    height: 200,
                    child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Text(
                              "Send a password reset link to:",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 15),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 28.0, left: 25),
                              child: Row(
                                children: [
                                  Container(
                                    height: 12,
                                    width: 12,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.black, width: 1.0)),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    "Phone",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    height: 30,
                                    width: 150,
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(
                                            5.0, 15.0, 20.0, 10.0),
                                        hintText: "91-",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 26.0, top: 15.0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 12,
                                    width: 12,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.black, width: 1.0)),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    "Email",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    height: 30,
                                    width: 150,
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(
                                            5.0, 15.0, 20.0, 10.0),
                                        hintText: "abcd@gmail.com",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, top: 20.0, right: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: null,
                                    //ToDo: Navigator.pop
                                    child: Container(
                                      width: 80,
                                      height: 33,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1.0)),
                                      child: Center(
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    //ToDo: Send password reset link
                                    onTap: null,
                                    child: Container(
                                      width: 80,
                                      height: 33,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1.0)),
                                      child: Center(
                                        child: Text(
                                          "Confirm",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                );
              });
        },
        child: Text('Forgot Password?'),
      ),
    );
  }

  Widget _showSubmit() {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: GestureDetector(
        onTap: () => {
          _submit(),
        },
        child: Icon(
          Icons.arrow_forward_rounded,
          size: 40,
        ),
      ),
    );
  }

  Widget _showChangePass() {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20.0)), //this right here
                  child: Container(
                    height: 330,
                    child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Text(
                              "Change Password",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 15),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Text(
                                "Current Password",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 15),
                              ),
                            ),
                            Container(
                              height: 30,
                              width: 160,
                              child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(
                                      5.0, 15.0, 20.0, 10.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Text(
                                "New Password",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 15),
                              ),
                            ),
                            Container(
                              height: 30,
                              width: 160,
                              child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(
                                      5.0, 15.0, 20.0, 10.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Text(
                                "Confirm Password",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 15),
                              ),
                            ),
                            Container(
                              height: 30,
                              width: 160,
                              child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(
                                      5.0, 15.0, 20.0, 10.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, top: 20.0, right: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: null,
                                    //ToDo: Navigator.pop
                                    child: Container(
                                      width: 80,
                                      height: 33,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1.0)),
                                      child: Center(
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    //ToDo: Send password reset link
                                    onTap: null,
                                    child: Container(
                                      width: 80,
                                      height: 33,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1.0)),
                                      child: Center(
                                        child: Text(
                                          "Confirm",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                );
              });
        },
        child: Text('ADD IT LATER WHEREVER'),
      ),
    );
  }

  Widget _wishToChangePass() {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20.0)), //this right here
                  child: Container(
                    height: 130,
                    child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Wish to change password?",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 15),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, top: 20.0, right: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: null,
                                    //ToDo: Navigator.pop
                                    child: Container(
                                      width: 80,
                                      height: 33,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1.0)),
                                      child: Center(
                                        child: Text(
                                          "No",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    //ToDo: Open Change Password Dialog
                                    onTap: null,
                                    child: Container(
                                      width: 80,
                                      height: 33,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1.0)),
                                      child: Center(
                                        child: Text(
                                          "Yes",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                );
              });
        },
        child: Text('CHANGE PASSWORD'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 450,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(65.0),
                    ),
                    image: new DecorationImage(
                      image: new AssetImage('image/login1.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 180.0),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 30),
                      ),
                    ),
                    _cusOrEmp(),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1.0,
                          color: Color(0xFF34373E),
                        ),
                      ),
                    ),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        prefixIcon: Icon(Icons.phone),
                        hintText: "Mobile Number",
                      ),
                      onChanged: (value) => {number = value},
                    ),
                  ),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1.0,
                          color: Color(0xFF34373E),
                        ),
                      ),
                    ),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        prefixIcon: Icon(Icons.lock_outline),
                        hintText: "Password",
                      ),
                      onChanged: (value) => {
                        pass = value,
                      },
                    ),
                  ),
                  _showSubmit(),
                  _showForgotPass(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
